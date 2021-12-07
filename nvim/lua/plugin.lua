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
    function(use, use_rocks)
        -- Packer can manage itself
        use { "wbthomason/packer.nvim" }

        -- Startup
        use { "lewis6991/impatient.nvim" }
        use { "nathom/filetype.nvim", config = [[require("p.nvim-filetype").setup()]] }
        use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }

        -- tpope
        use { "tpope/vim-sensible" }
        use { "tpope/vim-unimpaired" }
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
                var_tbl {
                    prosession_default_session = 1,
                    prosession_dir = vim.fn.stdpath "data" .. "/sessions/",
                }
            end,
        }

        use { "nvim-lua/plenary.nvim" }
        use {
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = [[require("p.nvim-treesitter").setup()]],
            },
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "windwp/nvim-ts-autotag",
                ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup {}
                end,
            },
            {
                "numToStr/Comment.nvim",
                event = "BufRead",
                config = [[require("p.nvim-comment").setup()]],
            },
            "JoosepAlviste/nvim-ts-context-commentstring",
            {
                "andymass/vim-matchup",
                event = "VimEnter",
                config = function()
                    vim.g.matchup_matchparen_offscreen = { method = "popup" }
                end,
            },
        }

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

        use {
            {
                "neoclide/coc.nvim",
                branch = "release",
                setup = function()
                    vim.g.coc_config_home = config_path .. "/lua/p/nvim-coc/"
                end,
                config = [[require("p.nvim-coc").setup()]],
            },
            "honza/vim-snippets",
        }

        -- Appearance
        use {
            "sainnhe/gruvbox-material",
            config = function()
                var_tbl {
                    gruvbox_material_enable_italic = 1,
                    gruvbox_material_diagnostic_text_highlight = 1,
                    gruvbox_material_sign_column_background = "none",
                }
                vim.opt.background = "dark"
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
            "kyazdani42/nvim-tree.lua",
            disable = true,
            after = "nvim-web-devicons",
            setup = [[require("p.nvim-tree").set_val()]],
            config = [[require("p.nvim-tree").setup()]],
        }
        use {
            "mhinz/vim-sayonara",
            cmd = "Sayonara",
        }
        use {
            "Akin909/nvim-bufferline.lua",
            after = "nvim-web-devicons",
            config = [[require("p.nvim-bufferline")]],
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

        -- Operations
        use { "ggandor/lightspeed.nvim" }
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

        -- Misc
        use { "kshenoy/vim-signature" }
        use { "psliwka/vim-smoothie" }
        use { "farmergreg/vim-lastplace" }
        use {
            "jghauser/mkdir.nvim",
            config = function()
                require "mkdir"
            end,
        }
        use {
            "lukas-reineke/format.nvim",
            config = [[require("p.nvim-formatter")]],
        }
        use {
            "ybian/smartim",
            setup = function()
                vim.g.smartim_default = "com.apple.keylayout.ABC"
            end,
        }
        use {
            "tversteeg/registers.nvim",
            setup = function()
                vim.g.registers_return_symbol = " "
                vim.g.registers_tab_symbol = " "
                vim.g.registers_show_empty_registers = 0
                vim.g.registers_trim_whitespace = 0
                vim.g.registers_hide_only_whitespace = 1
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
