local colors = {
    bg = "#32302f",
    fg = "#282828",
    fg1 = "#ddc7a1",
    yellow = "#d8a657",
    cyan = "#89b482",
    oceanblue = "#45707a",
    green = "#a9b665",
    orange = "#e78a4e",
    violet = "#d3869b",
    magenta = "#c14a4a",
    white = "#a89984",
    skyblue = "#7daea3",
    red = "#ea6962",
}

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
    return fileformat == "unix" and "LF" or "CRLF"
end

local function tabstop()
    return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
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
            "dbui",
            "packer",
            "startify",
            "fugitive",
            "fugitiveblame",
            "vista",
            "vista_kind",
            "dashboard",
        },
    },
    sections = {
        lualine_a = { { "mode", separator = { left = "" } } },
        lualine_b = {
            "branch",
            {
                "diff",
                cond = conditions.hide_in_width,
            },
            {
                "diagnostics",
                sources = { "nvim_lsp", "coc" },
                symbols = { error = " ", warn = " ", info = " " },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.skyblue },
                },
                cond = conditions.hide_in_width,
            },
        },
        lualine_c = { "filename" },
        lualine_x = { "g:coc_status" },
        lualine_y = { tabstop, "encoding", eol, "filetype" },
        lualine_z = { "progress", { "location", separator = { right = "" } } },
    },
    inactive_sections = {
        lualine_a = { { "filename", separator = { left = "" } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { "location", separator = { right = "" } } },
    },
    tabline = {},
    extensions = {},
}
