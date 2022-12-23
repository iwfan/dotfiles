-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup {
    function(use)
        use { "wbthomason/packer.nvim" }

        -- Appearance
        use {
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
                    vim.g.gruvbox_material_transparent_background = 0
                    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
                    vim.fn.execute "color gruvbox-material"

                    vim.schedule(function()
                        vim.fn.execute "highlight LspSagaDiagnosticError gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaErrorTrunCateLine gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaDiagnosticWarn gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaWarnTrunCateLine gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaDiagnosticInfo gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaInfoTrunCateLine gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaDiagnosticHint gui=none cterm=none"
                        vim.fn.execute "highlight LspSagaHintTrunCateLine gui=none cterm=none"
                    end, 150)
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
            { "j-hui/fidget.nvim", config = "require('fidget').setup{}" },
            { "glepnir/lspsaga.nvim", branch = "main" },
            { "jose-elias-alvarez/typescript.nvim" },
            { "folke/neodev.nvim" },
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
            { "rafamadriz/friendly-snippets", opt = true },
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
        use { "ggandor/leap.nvim", config = "require('leap').set_default_keymaps()" }
        use {
            "andymass/vim-matchup",
            setup = function()
                vim.g.matchup_matchparen_offscreen = { method = "" }
            end,
        }
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        }
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


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
