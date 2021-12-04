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
                    vim.bo.filetype = "qf"
                    vim.cmd [[setl nobuflisted nonumber norelativenumber]]
                end,
                css = function()
                    vim.bo.filetype = "css"
                    vim.cmd [[setl iskeyword+=-]]
                end,
                less = function()
                    vim.bo.filetype = "less"
                    vim.cmd [[setl iskeyword+=-]]
                end,
                scss = function()
                    vim.bo.filetype = "scss"
                    vim.cmd [[setl iskeyword+=-]]
                end,
                markdown = function()
                    vim.bo.filetype = "markdown"
                    vim.cmd [[setl wrap]]
                end,
                png = function()
                    vim.fn.jobstart("open " .. vim.fn.expand "%")
                end,
                jpg = function()
                    vim.fn.jobstart("open " .. vim.fn.expand "%")
                end,
                gif = function()
                    vim.fn.jobstart("open " .. vim.fn.expand "%")
                end,
            },
        },
    }
end

return M
