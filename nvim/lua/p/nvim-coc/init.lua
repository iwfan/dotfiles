local M = {}

local function setup_global_extensions()
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-emmet",
        "coc-eslint",
        "coc-explorer",
        "coc-floatinput",
        "coc-html",
        "coc-jest",
        "coc-json",
        "coc-prettier",
        "coc-snippets",
        "coc-sumneko-lua",
        "coc-tailwindcss",
        "coc-tsserver",
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
