local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    }
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "p.nvim-treesitter"
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },
    { "tpope/vim-repeat" },
    {
        "kylechui/nvim-surround",
        event = "BufRead",
        config = function()
          require("nvim-surround").setup()
        end,
    },
    {
        "ggandor/leap.nvim",
        event = "BufRead",
        config = function()
            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
            vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
            vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)")
        end
    },
    {
        "andymass/vim-matchup",
        event = "BufRead",
    },
    {
        "asiryk/auto-hlsearch.nvim",
        config = function()
            require("auto-hlsearch").setup()
        end,
    }
}
