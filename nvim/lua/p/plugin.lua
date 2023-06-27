local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- require("lazy").setup {
--     {
--         "tpope/vim-fugitive",
--         cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
--         event = "VeryLazy",
--         config = function()
--             local fugitive = vim.api.nvim_create_augroup("fugitive", {})
--
--             local autocmd = vim.api.nvim_create_autocmd
--             autocmd("BufWinEnter", {
--                 group = fugitive,
--                 pattern = "*",
--                 callback = function()
--                     if vim.bo.ft ~= "fugitive" then
--                         return
--                     end
--
--                     local bufnr = vim.api.nvim_get_current_buf()
--                     local opts = { buffer = bufnr, remap = false }
--                     vim.keymap.set("n", "<leader>p", function()
--                         vim.cmd.Git "push"
--                     end, opts)
--
--                     vim.keymap.set("n", "<leader>P", function()
--                         vim.cmd.Git { "pull", "--rebase" }
--                     end, opts)
--                 end,
--             })
--         end,
--     },
--     {
--         "NvChad/nvim-colorizer.lua",
--         event = "VeryLazy",
--         config = function()
--             require "p.nvim-colorizer"
--         end,
--     },
--     -- {
--     --     "Darazaki/indent-o-matic",
--     --     config = function()
--     --         require("indent-o-matic").setup {}
--     --         require("indent-o-matic").detect()
--     --     end,
--     -- },
-- }
