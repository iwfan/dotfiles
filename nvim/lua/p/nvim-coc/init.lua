local M = {}

local function setup_global_extensions()
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-diagnostic",
        "coc-emmet",
        "coc-eslint",
        "coc-explorer",
        "coc-floatinput",
        "coc-git",
        "coc-go",
        "coc-graphql",
        "coc-html",
        "coc-highlight",
        "coc-imselect",
        "coc-json",
        "coc-lists",
        "coc-pairs",
        "coc-prettier",
        "coc-prisma",
        "coc-sh",
        "coc-snippets",
        "coc-sumneko-lua",
        "coc-tailwindcss",
        "coc-tabnine",
        "coc-toml",
        "coc-tsserver",
        "coc-vetur",
        "coc-vimlsp",
        "coc-yaml",
        "coc-yank",
    }
end

local function setup_keymaps()
    map_cmd("n|<C-e>", "CocCommand explorer")
    map_cmd("n|/", "CocList words")
    map_cmd("n|<leader>/", "CocList grep")
    map_cmd("n|<leader>p", "CocList files")
    map_cmd("n|<leader>P", "CocList lists")
end

M.setup = function()
    setup_global_extensions()
    setup_keymaps()
end

return M
