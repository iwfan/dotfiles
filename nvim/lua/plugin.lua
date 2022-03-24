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

        -- CoC
        use {
            "neoclide/coc.nvim",
            branch = "release",
            setup = [[require("p.nvim-coc").setup()]],
            requires = { "rafamadriz/friendly-snippets" },
        }

        -- tpope
        use { "tpope/vim-surround" }
        use { "tpope/vim-repeat" }
        use { "tpope/vim-unimpaired" }
        use { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" } }
        use { "github/copilot.vim" }

        -- Appearance
        use {
            "sainnhe/gruvbox-material",
            config = function()
                vim.g.gruvbox_material_enable_italic = 1
                vim.g.gruvbox_material_sign_column_background = "none"
                vim.g.gruvbox_material_better_performance = 1
                vim.g.gruvbox_material_transparent_background = 1
                vim.g.gruvbox_material_current_word = "grey background"
                vim.cmd "color gruvbox-material"
            end,
        }
        use { "kyazdani42/nvim-web-devicons", config = [[require("nvim-web-devicons").setup()]] }
        use {
            "startup-nvim/startup.nvim",
            requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
            config = [[require("p.nvim-startup")]],
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
        use { "akinsho/toggleterm.nvim", config = "require('p.nvim-toggleterm')" }
        use { "luukvbaal/stabilize.nvim", config = "require('stabilize').setup()" }
        use { "jghauser/mkdir.nvim", config = "require('mkdir')" }
        use { "gpanders/editorconfig.nvim" }
        use { "karb94/neoscroll.nvim", config = "require('neoscroll').setup()" }
        use { "ggandor/lightspeed.nvim" }
        use { "farmergreg/vim-lastplace" }
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
