local M = {}

M.setup = function()
    require("filetype").setup {
        overrides = {
            literal = {
                ideavimrc = "vim",
                [".eslintrc"] = "json",
                [".prettierrc"] = "json",
                ["tsconfig.json"] = "jsonc",
                ["jsconfig.json"] = "jsonc",
            },
            function_extensions = {
                qf = function()
                    vim.cmd [[set nobuflisted]]
                end,
                css = function()
                    vim.cmd [[setl iskeyword+=-]]
                end,
                less = function()
                    vim.cmd [[setl iskeyword+=-]]
                end,
                scss = function()
                    vim.cmd [[setl iskeyword+=-]]
                end,
                markdown = function()
                    vim.cmd [[setl wrap]]
                end,
            },
        },
    }
end

return M
