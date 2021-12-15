local packer_path = ("%s/site/pack/packer/start/packer.nvim"):format(stdpath)

function _G.packer_install()
    print "Cloning packer.."
    -- remove the dir before cloning
    vim.fn.delete(packer_path, "rf")
    vim.fn.system {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        "--depth",
        "1",
        packer_path,
    }
    vim.cmd "packadd packer.nvim"
end

if fn.empty(fn.glob(packer_path)) > 0 then
    packer_install()
end

vim.cmd [[command! PackerUpgrade :call v:lua.packer_install()]]

require("packer").startup {
    function(use)
        -- Packer can manage itself
        use { "wbthomason/packer.nvim" }

        -- Startup
        use { "lewis6991/impatient.nvim" }
        use { "nathom/filetype.nvim", config = [[require("p.nvim-filetype").setup()]] }
        use {
            "antoinemadec/FixCursorHold.nvim",
            setup = function()
                vim.g.cursorhold_updatetime = 300
            end,
        }
        use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }

        -- Treesitter
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
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use {
            "numToStr/Comment.nvim",
            event = "BufRead",
            config = [[require("p.nvim-comment").setup()]],
        }
        use {
            "windwp/nvim-ts-autotag",
            ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
        }
        use {
            "andymass/vim-matchup",
            event = "VimEnter",
            config = function()
                vim.g.matchup_matchparen_offscreen = { method = "popup" }
            end,
        }

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzf-native.nvim" },
            },
            config = [[require("p.nvim-telescope").setup()]],
        }
        use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        use {
            "windwp/nvim-spectre",
            requires = "nvim-lua/plenary.nvim",
            config = [[require("p.nvim-spectre")]],
        }

        -- LSP
        use { "neovim/nvim-lspconfig", config = "require('lsp.config')" }

        -- LSP Cmp
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-nvim-lua" }
        use { "hrsh7th/cmp-buffer" }
        use { "hrsh7th/cmp-path" }
        use { "hrsh7th/cmp-calc" }
        use { "L3MON4D3/LuaSnip" }
        use { "saadparwaiz1/cmp_luasnip" }
        use { "rafamadriz/friendly-snippets" }
        use { "hrsh7th/nvim-cmp", event = "InsertEnter", config = "require('lsp.cmp')" }

        -- LSP Addons
        use { "williamboman/nvim-lsp-installer", config = "require('lsp.installer')" }
        use { "onsails/lspkind-nvim" }
        use { "kosayoda/nvim-lightbulb" }
        use { "folke/lsp-trouble.nvim", config = "require('trouble').setup {}" }
        use { "jose-elias-alvarez/nvim-lsp-ts-utils", after = { "nvim-treesitter" } }
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
        use {
            "editorconfig/editorconfig-vim",
            setup = function()
                vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*" }
            end,
        }
        use {
            "tpope/vim-sleuth",
            setup = function()
                vim.g.sleuth_automatic = 0
            end,
            cmd = "Sleuth",
        }
        use { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" } }
        use { "github/copilot.vim" }
        use { "tpope/vim-obsession" }
        use {
            "dhruvasagar/vim-prosession",
            after = "vim-obsession",
            setup = function()
                vim.g.prosession_on_startup = 0
                vim.g.prosession_default_session = 0
                vim.g.prosession_per_branch = 1
                vim.g.prosession_dir = vim.fn.stdpath "data" .. "/sessions/"
            end,
            cmd = { "Prosession", "ProsessionDelete" },
        }

        -- Appearance
        use {
            "sainnhe/gruvbox-material",
            config = function()
                vim.g.gruvbox_material_enable_italic = 1
                vim.g.gruvbox_material_diagnostic_text_highlight = 1
                vim.g.gruvbox_material_sign_column_background = "none"
                vim.cmd "color gruvbox-material"
            end,
        }
        use { "kyazdani42/nvim-web-devicons", config = [[require("nvim-web-devicons").setup()]] }
        use {
            "glepnir/dashboard-nvim",
            after = "nvim-web-devicons",
            setup = [[require("p.nvim-dashboard")]],
        }
        use {
            "romgrk/barbar.nvim",
            after = "nvim-web-devicons",
            config = [[require("p.nvim-barbar")]],
        }
        use {
            "nvim-lualine/lualine.nvim",
            after = "nvim-web-devicons",
            config = [[require("p.nvim-lualine")]],
        }
        use {
            "sindrets/diffview.nvim",
            after = "nvim-web-devicons",
            cmd = { "DiffviewOpen", "DiffviewFileHistory" },
            config = [[require'diffview'.setup()]],
        }
        use { "kevinhwang91/nvim-bqf", ft = "qf" }
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            requires = "nvim-lua/plenary.nvim",
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
        use {
            "kevinhwang91/nvim-hlslens",
            setup = function()
                map("n|n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
                map("n|N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
                map("n|*", "*<Cmd>lua require('hlslens').start()<CR>")
                map("n|#", "#<Cmd>lua require('hlslens').start()<CR>")
                map("n|]w", "g*<Cmd>lua require('hlslens').start()<CR>")
                map("n|[w", "g#<Cmd>lua require('hlslens').start()<CR>")
            end,
        }
        use {
            "tversteeg/registers.nvim",
            setup = function()
                vim.g.registers_return_symbol = " "
                vim.g.registers_tab_symbol = " "
                vim.g.registers_show_empty_registers = 0
                vim.g.registers_trim_whitespace = 1
                vim.g.registers_hide_only_whitespace = 1
            end,
        }
        use { "akinsho/toggleterm.nvim", config = "require('p.nvim-toggleterm')" }
        use { "lukas-reineke/format.nvim", config = "require('p.nvim-formatter')" }
        use { "luukvbaal/stabilize.nvim", config = "require('stabilize').setup()" }
        use { "jghauser/mkdir.nvim", config = "require('mkdir')" }
        use { "ggandor/lightspeed.nvim" }
        use { "kshenoy/vim-signature" }
        use { "psliwka/vim-smoothie" }
        use { "farmergreg/vim-lastplace" }
        use { "lambdalisue/suda.vim" }
        use {
            "ybian/smartim",
            setup = function()
                vim.g.smartim_default = "com.apple.keylayout.ABC"
            end,
        }
    end,
    config = {
        -- Move to lua dir so impatient.nvim can cache it
        compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
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
