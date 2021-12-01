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
        use "wbthomason/packer.nvim"

        -- Startup
        use {
            {
                "nathom/filetype.nvim",
                config = [[require("p.nvim-filetype").setup()]],
            },
            "lewis6991/impatient.nvim",
            {
                "tweekmonster/startuptime.vim",
                cmd = "StartupTime",
            },
        }

        -- tpope
        use {
            "tpope/vim-sensible",
            "tpope/vim-unimpaired",
            "tpope/vim-repeat",
            {
                "tpope/vim-sleuth",
                setup = function()
                    vim.g.sleuth_automatic = 0
                end,
            },
            {
                "tpope/vim-obsession",
                cmd = { "Obsess" },
            },
            {
                "tpope/vim-fugitive",
                cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
            },
        }

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
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/popup.nvim",
                    "nvim-lua/plenary.nvim",
                    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                },
                config = [[require("p.nvim-telescope").setup()]],
            },
            {
                "windwp/nvim-spectre",
                requires = "nvim-lua/plenary.nvim",
                config = [[require("p.nvim-spectre")]],
            },
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

        use {
            {
                "kyazdani42/nvim-web-devicons",
                config = [[require("p.nvim-devicons").setup()]],
            },
            {
                "kyazdani42/nvim-tree.lua",
                lock = true,
                disable = true,
                after = "nvim-web-devicons",
                setup = [[require("p.nvim-tree").set_val()]],
                config = [[require("p.nvim-tree").setup()]],
            },
            {
                "Akin909/nvim-bufferline.lua",
                after = "nvim-web-devicons",
                requires = "famiu/bufdelete.nvim",
                config = [[require("p.nvim-bufferline")]],
            },
            {
                "nvim-lualine/lualine.nvim",
                requires = { "kyazdani42/nvim-web-devicons", opt = true },
                config = [[require("p.nvim-lualine")]],
            },
            {
                "glepnir/dashboard-nvim",
                setup = [[require("p.nvim-dashboard")]],
            },
            {
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
            },
            {
                "lukas-reineke/indent-blankline.nvim",
                event = "BufRead",
                config = [[require("p.nvim-indentline")]],
            },
            {
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
            },
        }

        use {
            "editorconfig/editorconfig-vim",
            "github/copilot.vim",
            {
                "lewis6991/gitsigns.nvim",
                event = "BufRead",
                requires = "nvim-lua/plenary.nvim",
                config = [[require("p.nvim-gitsigns").setup()]],
            },
            {
                "sindrets/diffview.nvim",
                cmd = { "DiffviewOpen", "DiffviewFileHistory" },
                config = [[require'diffview'.setup()]],
            },
            "ggandor/lightspeed.nvim",
            {
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
            },
            {
                "blackCauldron7/surround.nvim",
                config = function()
                    require("surround").setup { mappings_style = "surround" }
                end,
            },
            {
                "lukas-reineke/format.nvim",
                config = [[require("p.nvim-formatter")]],
            },
            {
                "tversteeg/registers.nvim",
                setup = function()
                    vim.g.registers_return_symbol = " "
                    vim.g.registers_tab_symbol = " "
                    vim.g.registers_show_empty_registers = 0
                    vim.g.registers_trim_whitespace = 0
                    vim.g.registers_hide_only_whitespace = 1
                end,
            },
            "psliwka/vim-smoothie",
            "farmergreg/vim-lastplace",
            {
                "ybian/smartim",
                setup = function()
                    vim.g.smartim_default = "com.apple.keylayout.ABC"
                end,
            },
            {
                "jghauser/mkdir.nvim",
                config = function()
                    require "mkdir"
                end,
            },
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
