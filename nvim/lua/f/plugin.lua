local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
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
        use { "nvim-lua/popup.nvim" }
        use { "nvim-lua/plenary.nvim" }
        use {
            "sainnhe/gruvbox-material",
            config = function()
                vim.g.gruvbox_material_background = "hard"
                vim.g.gruvbox_material_enable_italic = 1
                vim.g.gruvbox_material_sign_column_background = "none"
                vim.g.gruvbox_material_better_performance = 1
                vim.fn.execute "color gruvbox-material"
            end,
        }
        use {
            "ishan9299/nvim-solarized-lua",
            config = function()
                vim.g.solarized_diffmode = "low"
                -- vim.fn.execute "color solarized"
            end,
        }
        use { "kyazdani42/nvim-web-devicons", config = [[require("nvim-web-devicons").setup()]] }
        use {
            "akinsho/bufferline.nvim",
            tag = "*",
            requires = { "famiu/bufdelete.nvim" },
            config = [[require("p.nvim-bufferline")]],
        }
        use { "nvim-lualine/lualine.nvim", config = [[require("p.nvim-lualine")]] }
        use {
            "nvim-telescope/telescope.nvim",
            config = [[require("p.nvim-telescope").setup()]],
            requires = {
                "nvim-telescope/telescope-ui-select.nvim",
            },
        }
        use {
            "startup-nvim/startup.nvim",
            config = [[require("p.nvim-startup")]],
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = [[require("p.nvim-treesitter").setup()]],
        }
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use {
            "windwp/nvim-autopairs",
            config = "require('nvim-autopairs').setup()",
        }
        use {
            "windwp/nvim-ts-autotag",
            ft = { "html", "javascriptreact", "typescriptreact", "svelte", "svg", "vue" },
        }
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use {
            "numToStr/Comment.nvim",
            event = "BufRead",
            config = [[require("p.nvim-comment").setup()]],
        }

        -- LSP
        use { "neovim/nvim-lspconfig", config = "require('lsp.lsp_config')" }
        use { "b0o/schemastore.nvim" }
        use { "jose-elias-alvarez/null-ls.nvim", config = "require('lsp.null-ls')" }
        use { "jose-elias-alvarez/nvim-lsp-ts-utils" }

        -- LSP Cmp
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-nvim-lua" }
        use { "hrsh7th/cmp-buffer" }
        use { "hrsh7th/cmp-path" }
        use { "hrsh7th/cmp-cmdline" }
        use { "L3MON4D3/LuaSnip" }
        use { "saadparwaiz1/cmp_luasnip" }
        use { "rafamadriz/friendly-snippets" }
        use { "hrsh7th/nvim-cmp", config = "require('lsp.cmp')" }

        -- LSP Addons
        use { "williamboman/nvim-lsp-installer", config = "require('lsp.installer')" }
        use {
            "folke/lsp-trouble.nvim",
            config = "require('lsp.trouble')",
            cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
        }
        use {
            "simrat39/symbols-outline.nvim",
            setup = function()
                vim.g.symbols_outline = {
                    width = 40,
                }
            end,
            cmd = "SymbolsOutline",
        }

        -- tpope
        use { "tpope/vim-surround" }
        use { "tpope/vim-repeat" }
        use { "tpope/vim-unimpaired" }
        use { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" } }

        use {
            "sindrets/diffview.nvim",
            cmd = { "DiffviewOpen", "DiffviewFileHistory" },
            config = [[require'diffview'.setup()]],
        }
        use {
            "windwp/nvim-spectre",
            config = [[require("p.nvim-spectre")]],
        }
        use { "kevinhwang91/nvim-bqf", ft = "qf" }
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = [[require("p.nvim-gitsigns").setup()]],
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = [[require("p.nvim-indentline")]],
        }
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup {
                    css = { css = true },
                    less = { css = true },
                    scss = { css = true },
                    sass = { css = true },
                    vue = { css = true },
                    "javascript",
                    "javascriptreact",
                    "typescriptreact",
                    "typescript",
                    "lua",
                    "json",
                    "tmux",
                    "conf",
                    "dosini",
                    "readme",
                    html = {
                        css = true,
                        mode = "foreground",
                    },
                }
            end,
        }
        use {
            "mg979/vim-visual-multi",
            setup = function()
                var_tbl {
                    VM_default_mappings = 0,
                    VM_maps = {
                        ["Add Cursor Down"] = "<M-j>",
                        ["Add Cursor Up"] = "<M-k>",
                    },
                }
            end,
        }
        use { "akinsho/toggleterm.nvim", config = "require('p.nvim-toggleterm')" }
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
                return require("packer.util").float { border = "single" }
            end,
        },
        auto_clean = true,
        compile_on_sync = true,
    },
}
