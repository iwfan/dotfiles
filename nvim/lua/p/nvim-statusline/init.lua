local conditions = require "heirline.conditions"
local utils = require "heirline.utils"

local colors = {
    bright_bg = utils.get_highlight("Folded").bg,
    bright_fg = utils.get_highlight("Folded").fg,
    red = utils.get_highlight("DiagnosticError").fg,
    dark_red = utils.get_highlight("DiffDelete").bg,
    green = utils.get_highlight("String").fg,
    blue = utils.get_highlight("Function").fg,
    gray = utils.get_highlight("NonText").fg,
    orange = utils.get_highlight("Constant").fg,
    purple = utils.get_highlight("Statement").fg,
    cyan = utils.get_highlight("Special").fg,
    diag_warn = utils.get_highlight("DiagnosticSignWarn").fg,
    diag_error = utils.get_highlight("DiagnosticSignError").fg,
    diag_hint = utils.get_highlight("DiagnosticSignHint").fg,
    diag_info = utils.get_highlight("DiagnosticSignInfo").fg,
    git_del = utils.get_highlight("diffRemoved").fg,
    git_add = utils.get_highlight("diffAdded").fg,
    git_change = utils.get_highlight("diffChanged").fg,
}

require("heirline").load_colors(colors)

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
        return { fg = self.icon_color, bg = "bright_bg" }
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
    hl = { fg = "bright_fg", bg = "bright_bg" },
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = " [+]",
        hl = { fg = "green", bg = "bright_bg" },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = "orange", bg = "bright_bg" },
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
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    {
        provider = "![",
        hl = { fg = colors.gray, bg = colors.bright_bg }
    },
    {
        provider = function(self)
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = "diag_error", bg = "bright_bg" },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = "diag_warn", bg = "bright_bg" },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = "diag_info", bg = "bright_bg" },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "diag_hint", bg = "bright_bg" },
    },
    {
        provider = "]",
        hl = { fg = colors.gray, bg = colors.bright_bg }
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

    hl = { fg = colors.bright_fg, bg = "bright_bg" },

    { -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { fg = "green", bold = true },
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
        hl = { fg = "git_add" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "git_del" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "git_change" },
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
    hl = { fg = colors.bright_fg, bg = colors.bright_bg },
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
    hl = { fg = colors.bright_fg, bg = colors.bright_bg },
}

local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = colors.bright_fg, bg = colors.bright_bg, bold = true },
}

local IndentSize = {
    {
        provider = function()
            return vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        hl = { fg = colors.bright_fg, bg = colors.bright_bg },
    },
    { provider = "x", hl = { fg = colors.gray, bg = colors.bright_bg } },
    { provider = "SPC", hl = { fg = colors.bright_fg, bg = colors.bright_bg } },
}

local Ruler = {
    provider = "%l:%c %P",
    hl = { fg = colors.bright_fg, bg = colors.bright_bg },
}

local Spell = {
    condition = function()
        return vim.wo.spell
    end,
    provider = " SPELL",
    hl = { fg = "orange", bg = colors.bright_bg, bold = true },
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
    Git,
    Space,
    Diagnostics,
    Align,
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
