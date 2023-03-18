local conditions = require "heirline.conditions"
local utils = require "heirline.utils"
local gruvbox_material_colors = require "lualine/themes/gruvbox-material"

local colors = {
    bg = gruvbox_material_colors.inactive.a.bg,
    fg = gruvbox_material_colors.inactive.a.fg,
    red = gruvbox_material_colors.visual.a.bg,
    green = gruvbox_material_colors.insert.a.bg,
    blue = gruvbox_material_colors.command.a.bg,
    gray = gruvbox_material_colors.insert.b.bg,
    orange = gruvbox_material_colors.replace.a.bg,
    purple = gruvbox_material_colors.terminal.a.bg,
    cyan = gruvbox_material_colors.command.a.bg,
}

local Align = { provider = "%=" }
local Space = { provider = " " }

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

local modes = setmetatable({
    ["n"] = {"NORMAL", "N"},
    ["no"] = {"N·OPERATOR", "N·P"},
    ["v"] = {"VISUAL", "V"},
    ["V"] = {"V·LINE", "V·L"},
    [""] = {"V·BLOCK", "V·B"},
    [""] = {"V·BLOCK", "V·B"},
    ["s"] = {"SELECT", "S"},
    ["S"] = {"S·LINE", "S·L"},
    [""] = {"S·BLOCK", "S·B"},
    ["i"] = {"INSERT", "I"},
    ["ic"] = {"INSERT", "I"},
    ["R"] = {"REPLACE", "R"},
    ["Rv"] = {"V·REPLACE", "V·R"},
    ["c"] = {"COMMAND", "C"},
    ["cv"] = {"VIM·EX", "V·E"},
    ["ce"] = {"EX", "E"},
    ["r"] = {"PROMPT", "P"},
    ["rm"] = {"MORE", "M"},
    ["r?"] = {"CONFIRM", "C"},
    ["!"] = {"SHELL", "S"},
    ["t"] = {"TERMINAL", "T"}
}, {
    __index = function()
        return {"UNKNOWN", "U"} -- handle edge cases
    end
})

local Mode = {
    provider = function()
        local mode = modes[vim.api.nvim_get_mode().mode]
        if vim.api.nvim_win_get_width(0) <= 80 then
            return string.format("%s ", mode[2]) -- short name
        else
            return string.format("%s ", mode[1]) -- long name
        end
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
        hl = { fg = colors.gray, bg = colors.bg },
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
        hl = { fg = colors.gray, bg = colors.bg },
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
    { -- git branch name
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
    hl = { fg = colors.fg, bg = colors.bg },
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
    hl = { fg = colors.fg, bg = colors.bg },
}

local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = colors.fg, bg = colors.bg, bold = true },
}

local IndentSize = {
    {
        provider = function()
            return vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        hl = { fg = colors.fg, bg = colors.bg },
    },
    { provider = "x", hl = { fg = colors.gray, bg = colors.bg } },
    { provider = "SPC", hl = { fg = colors.fg, bg = colors.bg } },
}

local Ruler = {
    provider = "%l:%c %P",
    hl = { fg = colors.fg, bg = colors.bg },
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
    Mode,
    Git,
    Space,
    Diagnostics,
    Align,
    {
        provider = function()
            return '{…}%3{codeium#GetStatusString()}'
        end,
        hl = { fg = colors.fg, bg = colors.bg },
    },
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
}

require("heirline").setup {
    statusline = {
        hl = function()
            if conditions.is_active() then
                return "StatusLine"
            else
                return "StatusLineNC"
            end
        end,

        -- the first statusline with no condition, or which condition returns true is used.
        -- think of it as a switch case with breaks to stop fallthrough.
        fallthrough = false,

        SpecialStatusline,
        InactiveStatusline,
        DefaultStatusline,
    },
}
