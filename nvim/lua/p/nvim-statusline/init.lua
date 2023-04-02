local conditions = require "heirline.conditions"
local utils = require "heirline.utils"

local colors = {
    bg = utils.get_highlight("StatusLine").bg,
    fg = "#d3c6aa",
    red = "#e67e80",
    orange = "#e69875",
    yellow = "#dbbc7f",
    green = "#a7c080",
    aqua = "#83c092",
    blue = "#7fbbb3",
    purple = "#d699b6",
    grey = "#7a8478",
    grey1 = "#859289",
    grey2 = "#9da9a0",
}

local Align = { provider = "%=" }
local Space = { provider = " " }

local ViMode = {
    -- get vim current mode, this information will be required by the provider
    -- and the highlight functions, so we compute it only once per component
    -- evaluation and store it as a component attribute
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,
    -- Now we define some dictionaries to map the output of mode() to the
    -- corresponding string and color. We can put these into `static` to compute
    -- them at initialisation time.
    static = {
        mode_names = {
            -- change the strings if you like it vvvvverbose!
            n = "󰰔 NORMAL",
            no = "󰲟 N·OPERATOR",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "󰰬 VISUAL",
            vs = "󰰬 VISUAL",
            V = "󰰬 V·LINE",
            Vs = "󰰬 VISUAL",
            ["\22"] = "󰰬 V·BLOCK",
            ["\22s"] = "󰰬 V·BLOCK",
            s = "󰰣 SELECT",
            S = "󰰣 S·LINE",
            ["\19"] = "󰰣 S·BLOCK",
            i = "󰰅 INSERT",
            ic = "󰰅 INSERT",
            ix = "Ix",
            R = "󰰠 REPLACE",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "󰰠 V·REPLACE",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "󰯳 COMMAND",
            cv = "󰰲 VIM·EX",
            r = "󰰚 PROMPT",
            rm = "󰰑 MORE",
            ["r?"] = "󰰝 CONFIRM",
            ["!"] = "󰰦 SHELL",
            t = "󰰦 TERMINAL",
        },
    },
    -- We can now access the value of mode() that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    -- To be extra meticulous, we can also add some vim statusline syntax to
    -- control the padding and make sure our string is always at least 2
    -- characters long. Plus a nice Icon.
    provider = function(self)
        return self.mode_names[self.mode]
    end,
    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = { fg = colors.fg, bg = colors.bg },
    -- Re-evaluate the component only on ModeChanged event!
    -- Also allorws the statusline to be re-evaluated when entering operator-pending mode
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd "redrawstatus"
        end),
    },
}

local FileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
    on_click = {
        callback = function()
            vim.cmd "lua LF_toggle('%')"
        end,
        name = "heirline_fileblock",
    },
}

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
        return { fg = self.icon_color, bg = colors.bg }
    end,
}

local FileName = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":t")
        if filename == "" then
            return "[No Name]"
        end
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = { fg = colors.fg, bg = colors.bg },
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = " [+]",
        hl = { fg = colors.green, bg = colors.bg },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = colors.orange, bg = colors.bg },
    },
}

local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { bold = true, force = true }
        end
    end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(
    FileNameBlock,
    FileIcon,
    utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    FileFlags,
    { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

local Diagnostics = {
    condition = conditions.has_diagnostics,
    static = {
        error_icon = " ",
        warn_icon = " ",
        info_icon = " ",
        hint_icon = " ",
    },
    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    update = { "DiagnosticChanged", "BufEnter" },
    {
        provider = "󱚠 ",
        hl = { fg = colors.fg, bg = colors.bg },
    },
    {
        provider = "[",
        hl = { fg = colors.grey, bg = colors.bg },
    },
    {
        provider = function(self)
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.red, bg = colors.bg },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.orange, bg = colors.bg },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.green, bg = colors.bg },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.blue, bg = colors.bg },
    },
    {
        provider = "]",
        hl = { fg = colors.grey, bg = colors.bg },
    },
}

local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        ---@diagnostic disable-next-line: undefined-field
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,
    on_click = {
        callback = function()
            vim.cmd "lua Lazygit_toggle()"
        end,
        name = "heirline_git",
    },
    hl = { fg = colors.fg, bg = colors.bg },
    {
        -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { fg = colors.green, bold = true },
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "(",
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = colors.green },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = colors.red },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = colors.blue },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

local FileEncoding = {
    provider = function()
        local encode = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
        return encode:upper()
    end,
    hl = { fg = colors.grey, bg = colors.bg },
}

local FileFormat = {
    provider = function()
        local fileformat = vim.bo.fileformat
        if fileformat == "unix" then
            return "LF"
        else
            return "CRLF"
        end
    end,
    hl = { fg = colors.grey, bg = colors.bg },
}

local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = colors.grey1, bg = colors.bg, bold = true },
}

local IndentSize = {
    {
        provider = function()
            return vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        hl = { fg = colors.grey1, bg = colors.bg },
    },
    { provider = "x", hl = { fg = colors.grey, bg = colors.bg } },
    { provider = "SPC", hl = { fg = colors.grey, bg = colors.bg } },
}

local Ruler = {
    provider = "%l:%c %P",
    hl = { fg = colors.grey, bg = colors.bg },
}

local Spell = {
    condition = function()
        return vim.wo.spell
    end,
    provider = " SPELL",
    hl = { fg = colors.orange, bg = colors.bg, bold = true },
}

local HelpFileName = {
    condition = function()
        return vim.bo.filetype == "help"
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,
    hl = { fg = colors.blue },
}

local SpecialStatusline = {
    condition = function()
        return conditions.buffer_matches {
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive" },
        }
    end,
    FileType,
    Space,
    HelpFileName,
    Align,
    FileFormat,
    Space,
    FileEncoding,
    Space,
    IndentSize,
    Space,
    Ruler,
}

local InactiveStatusline = {
    condition = conditions.is_not_active,
    FileType,
    Space,
    FileName,
    Align,
}

local DefaultStatusline = {
    {
        provider = " ",
        hl = { fg = colors.bg, bg = "NONE" },
    },
    ViMode,
    Space,
    FileNameBlock,
    Space,
    Git,
    Space,
    Diagnostics,
    Align,
    Space,
    FileType,
    Spell,
    Space,
    FileFormat,
    Space,
    FileEncoding,
    Space,
    IndentSize,
    Space,
    Ruler,
    {
        provider = " ",
        hl = { fg = colors.bg, bg = "NONE" },
    },
}

require("heirline").setup {
    statusline = DefaultStatusline,
}
