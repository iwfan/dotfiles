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
    return fileformat == "unix" and "lf" or "crlf"
end

local function tabstop()
    local expandtab = vim.bo.expandtab
    local sw = vim.bo.shiftwidth
    local indent_type = expandtab and "spc" or "tab"
    return indent_type .. "~" .. sw
end

local function session()
    return vim.fn["ObsessionStatus"](" ", " ")
end

local function file_path()
    local filepath = vim.fn.expand "%:p"
    return vim.fn.fnamemodify(filepath, ":~:.")
end

require("lualine").setup {
    options = {
        section_separators = "",
        component_separators = "", -- |
        theme = "gruvbox-material",
        disabled_filetypes = {
            "coc-explorer",
            "coctree",
            "nnn",
            "NvimTree",
            "packer",
            "startify",
            "fugitive",
            "fugitiveblame",
            "dashboard",
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = { session },
        lualine_c = {
            {
                "branch",
                icon = font_icon.branch,
                cond = conditions.hide_in_width,
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
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
        lualine_x = {
            tabstop,
            "encoding",
            eol,
            "filetype",
            "location",
            "progress",
        },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { file_path, cond = conditions.buffer_not_empty } },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
