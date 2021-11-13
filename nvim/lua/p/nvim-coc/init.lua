local M = {}

local function setup_global_extensions()
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-emmet",
        "coc-eslint",
        "coc-explorer",
        "coc-floatinput",
        "coc-go",
        "coc-html",
        "coc-highlight",
        "coc-json",
        "coc-postfix",
        "coc-prettier",
        "coc-prisma",
        "coc-sh",
        "coc-snippets",
        "coc-sumneko-lua",
        "coc-tailwindcss",
        "coc-toml",
        "coc-tsserver",
        "coc-vetur",
        "coc-vimlsp",
        "coc-yaml",
        "coc-yank",
    }
end

local function setup_keymaps()
    map_cmd("n|<leader>e", "CocCommand explorer")
    map_cmd("n|<M-S-e>", "CocCommand explorer")
    map_cmd("n|<M-t>", "CocOutline")
end

M.setup = function()
    setup_global_extensions()
    setup_keymaps()
end

return M
