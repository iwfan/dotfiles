local M = {}

M.setup = function()
    -- Do not source the default filetype.vim
    vim.g.did_load_filetypes = 1

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
