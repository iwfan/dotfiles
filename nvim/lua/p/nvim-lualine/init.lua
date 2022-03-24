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

local function lsp()
    local msg = ""
    local priority_map = {
        bash = 1,
        tsserver = 1,
        sumneko_lua = 1,
        gopls = 1,
        graphql = 2,
        jsonls = 2,
        yamlls = 2,
        html = 2,
        cssls = 3,
        tailwindcss = 10,
        eslint = 10,
        emmet_ls = 10,
    }
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    local client_names = {}
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            table.insert(client_names, client.name)
        end
    end
    if next(client_names) == nil then
        return msg
    end
    table.sort(client_names, function(left, right)
        return priority_map[left] < priority_map[right]
    end)
    return " " .. client_names[1]
end

require("lualine").setup {
    options = {
        section_separators = "",
        component_separators = "", -- |
        -- theme = "gruvbox-material",
        theme = "auto",
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
                sources = { "nvim_diagnostic", "coc" },
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
            -- lsp,
            "g:coc_status",
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
