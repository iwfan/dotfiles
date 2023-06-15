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

require("lazy").setup {
    "nvim-tree/nvim-web-devicons",
    {
        "sainnhe/everforest",
        config = function()
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme "everforest"
        end,
    },
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require "p.nvim-startup"
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufReadPost",
        dependencies = "famiu/bufdelete.nvim",
        config = function()
            require "p.nvim-statusline"
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require "p.nvim-toggleterm"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "p.nvim-treesitter"
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require "p.nvim-telescope"
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("dressing").setup {
                input = {
                    default_prompt = "➤ ",
                    win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" },
                },
                select = {
                    backend = { "telescope", "builtin" },
                    builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
                },
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "lsp.lsp_config"
        end,
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()
                end,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require "lsp.mason-lspconfig"
                end,
            },
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                config = function()
                    require("fidget").setup {}
                end,
            },
            "jose-elias-alvarez/typescript.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require "lsp.cmp"
        end,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    { "tpope/vim-repeat" },
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
        event = "VeryLazy",
        config = function()
            local fugitive = vim.api.nvim_create_augroup("fugitive", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = fugitive,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git "push"
                    end, opts)

                    vim.keymap.set("n", "<leader>P", function()
                        vim.cmd.Git { "pull", "--rebase" }
                    end, opts)
                end,
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    { "windwp/nvim-ts-autotag", event = "VeryLazy" },
    {
        "kevinhwang91/nvim-ufo",
        event = "VeryLazy",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            require("ufo").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require "p.nvim-comment"
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        config = function()
            require("diffview").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require "p.nvim-gitsigns"
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require "p.nvim-indentline"
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require "p.nvim-colorizer"
        end,
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
    },
    {
        "andymass/vim-matchup",
        event = "VeryLazy",
    },
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        config = function()
            require "p.nvim-spectre"
        end,
    },
    { "farmergreg/vim-lastplace", event = "BufReadPost" },
    {
        "junegunn/vim-easy-align",
        cmd = { "EasyAlign" },
        event = "VeryLazy",
        config = function()
            vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)")
        end,
    },
    -- {
    --     "asiryk/auto-hlsearch.nvim",
    --     config = function()
    --         require("auto-hlsearch").setup()
    --     end,
    -- },
    -- {
    --     "Darazaki/indent-o-matic",
    --     config = function()
    --         require("indent-o-matic").setup {}
    --         require("indent-o-matic").detect()
    --     end,
    -- },
}
