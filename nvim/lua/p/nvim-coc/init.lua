local M = {}

M.setup = function()
    vim.g.coc_config_home = config_path .. "/lua/p/nvim-coc/"
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-cssmodules",
        "coc-emmet",
        "coc-eslint",
        "coc-floatinput",
        "coc-html",
        "coc-jest",
        "coc-json",
        "coc-prettier",
        "coc-snippets",
        "coc-lua",
        "coc-tailwindcss",
        "coc-tsserver",
    }
end

return M
