-- local statusline = require "galaxyline"
-- local condition = require "galaxyline.condition"
--
-- local colors = {
--     bg = "#32302f",
--     fg = "#282828",
--     bg1 = "#504945",
--     fg1 = "#ddc7a1",
--     yellow = "#d8a657",
--     cyan = "#89b482",
--     oceanblue = "#45707a",
--     green = "#a9b665",
--     orange = "#e78a4e",
--     violet = "#d3869b",
--     magenta = "#c14a4a",
--     white = "#a89984",
--     skyblue = "#7daea3",
--     blue = "#51afef",
--     red = "#ea6962",
--     grey = "#928374",
-- }
--
-- local function insert_left(component)
--     table.insert(statusline.section.left, component)
-- end
--
-- local function insert_right(component)
--     table.insert(statusline.section.right, component)
-- end
--
-- local function lsp()
--     local msg = "   "
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--         return msg
--     end
--     return "   "
-- end
--
-- statusline.short_line_list = { "NvimTree", "vista", "dbui", "packer", "vista_kind", "terminal", "dashboard" }
--
-- insert_left {
--     PreGitBranch = {
--         provider = function()
--             return ""
--         end,
--         condition = condition.check_git_workspace,
--         separator = "",
--         separator_highlight = { colors.bg },
--     },
-- }
--
-- insert_left {
--     GitBranch = {
--         provider = "GitBranch",
--         icon = FONT_ICON.branch,
--         condition = condition.check_git_workspace,
--         highlight = { colors.white, colors.bg },
--         separator = " ",
--         separator_highlight = { colors.bg },
--     },
-- }
--
-- insert_left {
--     Blank = {
--         provider = function()
--             return ""
--         end,
--         separator = "",
--         condition = condition.buffer_not_empty,
--         separator_highlight = { colors.bg },
--     },
-- }
--
-- insert_left {
--     FileIcon = {
--         provider = "FileIcon",
--         condition = condition.buffer_not_empty,
--         highlight = { colors.white, colors.bg },
--     },
-- }
--
-- insert_left {
--     FileName = {
--         provider = { "FileName" },
--         condition = condition.buffer_not_empty,
--         highlight = { colors.white, colors.bg },
--         separator = " ",
--         separator_highlight = { colors.bg },
--     },
-- }
--
-- insert_left {
--     DiagnosticError = {
--         provider = "DiagnosticError",
--         icon = FONT_ICON.error,
--         highlight = { colors.red },
--     },
-- }
--
-- insert_left {
--     DiagnosticWarn = {
--         provider = "DiagnosticWarn",
--         icon = FONT_ICON.warn,
--         highlight = { colors.yellow },
--     },
-- }
--
-- insert_left {
--     DiagnosticHint = {
--         provider = "DiagnosticHint",
--         icon = FONT_ICON.hint,
--         highlight = { colors.cyan },
--     },
-- }
--
-- insert_left {
--     DiagnosticInfo = {
--         provider = "DiagnosticInfo",
--         icon = FONT_ICON.info,
--         highlight = { colors.blue },
--     },
-- }
--
-- insert_right {
--     ShowLspClient = {
--         provider = lsp,
--         condition = condition.buffer_not_empty,
--         highlight = { colors.green },
--     },
-- }
--
-- insert_right {
--     RightSepLeftBlank = {
--         provider = function()
--             return ""
--         end,
--         separator = "",
--         highlight = { colors.grey, colors.bg },
--         separator_highlight = { colors.bg },
--     },
-- }
--
-- insert_right {
--     Tabstop = {
--         provider = function()
--             return  vim.api.nvim_buf_get_option(0, "shiftwidth")
--         end,
--         icon = " ",
--         separator = "",
--         condition = condition.hide_in_width,
--         highlight = { colors.grey, colors.bg },
--         separator_highlight = { colors.bg, colors.bg },
--     },
-- }
--
-- insert_right {
--     FileEncode = {
--         provider = function()
--             local encode = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
--             return encode:upper()
--         end,
--         separator = "  ",
--         condition = condition.hide_in_width,
--         highlight = { colors.grey, colors.bg },
--         separator_highlight = { colors.bg, colors.bg },
--     },
-- }
--
-- insert_right {
--     FileFormat = {
--         provider = function()
--             local fileformat = vim.bo.fileformat
--             if fileformat == "unix" then
--                 return "LF"
--             else
--                 return "CRLF"
--             end
--         end,
--         icon="並",
--         condition = condition.hide_in_width,
--         separator = "  ",
--         highlight = { colors.grey, colors.bg },
--         separator_highlight = { colors.bg, colors.bg },
--     },
-- }
--
-- insert_right {
--     LineInfo = {
--         provider = function()
--             local line = vim.fn.line "."
--             local column = vim.fn.col "."
--             return string.format("%3d:%2d", line, column)
--         end,
--         separator = " ",
--         icon = "",
--         condition = condition.hide_in_width,
--         highlight = { colors.grey, colors.bg },
--         separator_highlight = { colors.bg, colors.bg },
--     },
-- }
--
-- insert_right {
--     RightSepRightBlank = {
--         provider = function()
--             return ""
--         end,
--         separator = " ",
--         separator_highlight = { colors.bg },
--     },
-- }

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

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
    diag_warn = utils.get_highlight("DiagnosticWarn").fg,
    diag_error = utils.get_highlight("DiagnosticError").fg,
    diag_hint = utils.get_highlight("DiagnosticHint").fg,
    diag_info = utils.get_highlight("DiagnosticInfo").fg,
}

require('heirline').load_colors(colors)

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = "orange" },


    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = "green" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "red" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "blue" },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}


local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%7(%l/%3L%):%2c %P",
}

require("heirline").setup {
    statusline = { Git, Ruler },
}
