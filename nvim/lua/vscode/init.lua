local vscode = require('vscode-neovim')
require "config/keymap"

vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 600

vim.notify = vscode.notify

local opts = { silent = true }
vim.keymap.set("n", "gr", function ()
    vscode.action("editor.action.referenceSearch.trigger")
end , opts)
vim.keymap.set("n", "]d", function ()
    vscode.action("editor.action.marker.nextInFiles")
end , opts)
vim.keymap.set("n", "[d", function ()
    vscode.action("editor.action.marker.prevInFiles")
end , opts)
vim.keymap.set("n", "\\d", function ()
end , opts)

vim.keymap.set("n", "]g", function ()
    vscode.action("workbench.action.editor.nextChange")
end , opts)
vim.keymap.set("n", "[g", function ()
    vscode.action("workbench.action.editor.prevChange")
end , opts)

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.notify_once "NO Lazy!!!!"
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require "plugins.configs.treesitter"
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
        },
    },
}, {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    }
})

