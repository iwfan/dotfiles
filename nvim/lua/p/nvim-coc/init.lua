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
        "coc-imselect",
        "coc-json",
        "coc-prettier",
        "coc-snippets",
        "coc-sumneko-lua",
        "coc-tailwindcss",
        "coc-tsserver",
        "coc-vetur",
        "coc-vimlsp",
        "coc-yaml",
    }
end

local function setup_keymaps()
    map_cmd("n|<C-e>", "CocCommand explorer")
end

M.setup = function()
    setup_global_extensions()
    setup_keymaps()
end

return M
