local M = {}

local function setup_global_extensions()
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-emmet",
        "coc-eslint",
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

M.setup = function()
    setup_global_extensions()
end

return M
