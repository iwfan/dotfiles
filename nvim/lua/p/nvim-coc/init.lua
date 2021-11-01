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
        "coc-html",
        "coc-highlight",
        "coc-imselect",
        "coc-json",
        "coc-lists",
        "coc-postfix",
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
    map_cmd("n|<leader>e", "CocCommand explorer")
    map_cmd("n|<C-f>", "CocList words")
    map_cmd("n|<C-b>", "CocList buffers")
    map_cmd("n|<leader>/", "CocList grep")
    map_cmd("n|<leader>p", "CocList files --hidden")
    map_cmd("n|<leader>o", "CocList mru")
    map_cmd("n|<leader>g", "CocList gstatus")
    map_cmd("n|<leader>P", "CocList lists")
end

M.setup = function()
    setup_global_extensions()
    setup_keymaps()
end

return M
