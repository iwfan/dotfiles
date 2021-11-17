local M = {}

M.setup = function()
    require("filetype").setup {
        overrides = {
            extensions = {
                conf = "dosini",
                tmux = "dosini",
                scss = "scss",
            },
            literal = {
                ideavimrc = "vim",
                [".eslintrc"] = "json",
                [".prettierrc"] = "json",
                ["tsconfig.json"] = "jsonc",
                ["jsconfig.json"] = "jsonc",
            },
            complex = {
                [".*git/config"] = "gitconfig", -- Included in the plugin
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
