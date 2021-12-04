local colors = require "colors"

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local function eol()
    local fileformat = vim.bo.fileformat
    return fileformat == "unix" and font_icon.mac or font_icon.dos
end

local function tabstop()
    return font_icon.indent .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local function session()
    return vim.fn["ObsessionStatus"](" ", " ")
end

require("lualine").setup {
    options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
        theme = "gruvbox-material",
        disabled_filetypes = {
            "coc-explorer",
            "coctree",
            "NvimTree",
            "packer",
            "startify",
            "fugitive",
            "fugitiveblame",
            "dashboard",
        },
    },
    sections = {
        lualine_a = {
            {
                session,
                separator = { left = "", right = "" },
                padding = { left = 1, right = 0 },
            },
            {
                "mode",
                separator = { left = "", right = "" },
                padding = { left = 0, right = 1 },
            },
        },
        lualine_b = {
            {
                "branch",
                icon = font_icon.branch,
                cond = conditions.hide_in_width,
            },
            {
                "diagnostics",
                sources = { "nvim_lsp", "coc" },
                symbols = {
                    error = font_icon.error,
                    warn = font_icon.warn,
                    info = font_icon.info,
                    hint = font_icon.hint,
                },
                diagnostics_color = {
                    error = { fg = colors.red },
                    warn = { fg = colors.yellow },
                    info = { fg = colors.skyblue },
                    hint = { fg = colors.cyan },
                },
                cond = conditions.hide_in_width,
            },
        },
        lualine_c = { "filename" },
        lualine_x = { "g:coc_status" },
        lualine_y = { tabstop, "encoding", eol, "filetype" },
        lualine_z = { "progress", { "location", separator = { right = "" }, cond = conditions.hide_in_width } },
    },
    inactive_sections = {
        lualine_a = { { "filename", separator = { left = "" } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { "filetype", separator = { right = "" } } },
    },
    tabline = {},
    extensions = {},
}
