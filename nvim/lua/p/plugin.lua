local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
end

require("packer").startup {
    function(use)
        use { "wbthomason/packer.nvim" }
        use {
            "antoinemadec/FixCursorHold.nvim",
            setup = function()
                vim.g.cursorhold_updatetime = 300
            end,
        }

        use { -- Appearance
            {
                "glepnir/dashboard-nvim",
                config = "require('p.nvim-startup')",
            },
            {
                "glepnir/galaxyline.nvim",
                branch = "main",
                requires = { "kyazdani42/nvim-web-devicons" },
                config = "require('p.nvim-statusline')",
            },
            {
                "akinsho/bufferline.nvim",
                tag = "v2.*",
                requires = { "kyazdani42/nvim-web-devicons", "famiu/bufdelete.nvim" },
                config = "require('p.nvim-bufferline')",
            },
            {
                "sainnhe/gruvbox-material",
                config = function()
                    vim.g.gruvbox_material_background = "hard"
                    vim.g.gruvbox_material_enable_italic = 1
                    vim.g.gruvbox_material_sign_column_background = "none"
                    vim.g.gruvbox_material_better_performance = 1
                    vim.fn.execute "color gruvbox-material"
                end,
            },
        }

        use {
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = "require('p.nvim-treesitter')",
            },
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = "require('p.nvim-treesitter.context')",
            },
            "JoosepAlviste/nvim-ts-context-commentstring",
            {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.0",
                config = "require('p.nvim-telescope')",
                requires = {
                    "nvim-lua/plenary.nvim",
                    "nvim-telescope/telescope-ui-select.nvim",
                },
            },
        }

        -- LSP
        use {
            { "williamboman/mason.nvim", config = "require('mason').setup()" },
            { "neovim/nvim-lspconfig", config = "require('lsp.lsp_config')" },
            { "nvim-lua/lsp-status.nvim", config = "require('lsp.lsp_status')" },
            { "glepnir/lspsaga.nvim", branch = "main" },
            { "jose-elias-alvarez/typescript.nvim" },
            { "folke/lua-dev.nvim" },
            { "b0o/schemastore.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "jose-elias-alvarez/null-ls.nvim" },
            { "williamboman/mason-lspconfig.nvim", config = "require('lsp.mason-lspconfig')" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
            { "hrsh7th/nvim-cmp", config = "require('lsp.cmp')" },
        }

        use {
            { "tpope/vim-repeat" },
            { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" } },
            { "kylechui/nvim-surround", config = "require('nvim-surround').setup()" },
            { "windwp/nvim-autopairs", config = "require('nvim-autopairs').setup()" },
            { "windwp/nvim-ts-autotag" },
            { "numToStr/Comment.nvim", config = "require('p.nvim-comment')" },
        }

        use {
            "sindrets/diffview.nvim",
            cmd = { "DiffviewOpen", "DiffviewFileHistory" },
            config = [[require'diffview'.setup()]],
            requires = "nvim-lua/plenary.nvim",
        }
        use {
            "nvim-pack/nvim-spectre",
            config = [[require("p.nvim-spectre")]],
        }
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = [[require("p.nvim-gitsigns")]],
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = [[require("p.nvim-indentline")]],
        }
        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = [[require("p.nvim-colorizer")]],
        }
        use {
            "mg979/vim-visual-multi",
            setup = function()
                vim.g.VM_default_mappings = 0
                vim.g.VM_maps = {
                    ["Add Cursor Down"] = "<M-j>",
                    ["Add Cursor Up"] = "<M-k>",
                }
            end,
        }
        use { "akinsho/toggleterm.nvim", tag = "v2.*", config = "require('p.nvim-toggleterm')" }
        use { "karb94/neoscroll.nvim", config = "require('neoscroll').setup()" }
        use { "gpanders/editorconfig.nvim" }
        use { "ggandor/lightspeed.nvim" }
        use { "farmergreg/vim-lastplace" }
        use {
            "ybian/smartim",
            setup = function()
                vim.g.smartim_default = "com.apple.keylayout.ABC"
            end,
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        git = { clone_timeout = 120 },
        display = {
            open_fn = function()
                return require("packer.util").float { border = "none" }
            end,
        },
        auto_clean = true,
        compile_on_sync = true,
    },
}
