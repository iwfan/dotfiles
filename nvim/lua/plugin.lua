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
            {
                "tpope/vim-sleuth",
                setup = function()
                    vim.g.sleuth_automatic = 0
                end,
            },
            "tpope/vim-repeat",
            {
                "tpope/vim-obsession",
                cmd = { "Obsess" },
            },
            {
                "tpope/vim-fugitive",
                cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
            },
            {
                "tpope/vim-dispatch",
                cmd = { "Dispatch", "Make", "Focus", "Start" },
                requires = { "radenling/vim-dispatch-neovim" },
            },
        }

        use {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope.nvim",
                disable = true,
                requires = {
                    "nvim-lua/popup.nvim",
                    "nvim-lua/plenary.nvim",
                    "nvim-telescope/telescope-fzy-native.nvim",
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
                "famiu/feline.nvim",
                after = "nvim-web-devicons",
                config = [[require("p.nvim-feline")]],
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
                    require("colorizer").setup({ "*" }, {
                        RRGGBBAA = true,
                        css = true,
                    })
                end,
            },
        }

        -- test & debugging
        use {
            {
                "puremourning/vimspector",
                setup = [[require('p.vimspector').setup()]],
                ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            },
            {
                "vim-test/vim-test",
                config = [[require("p.vim-test").setup()]],
            },
        }

        use {
            "editorconfig/editorconfig-vim",
            "github/copilot.vim",
            {
                "lewis6991/gitsigns.nvim",
                disable = true,
                event = "BufRead",
                requires = "nvim-lua/plenary.nvim",
                config = [[require("p.nvim-gitsigns").setup()]],
            },
            {
                "sindrets/diffview.nvim",
                cmd = { "DiffviewOpen", "DiffviewFileHistory" },
                config = [[require'diffview'.setup()]],
            },
            "psliwka/vim-smoothie",
            "farmergreg/vim-lastplace",
            {
                "ggandor/lightspeed.nvim",
                config = function()
                    require("lightspeed").setup {
                        jump_to_first_match = true,
                        jump_on_partial_input_safety_timeout = 400,
                        highlight_unique_chars = false,
                        grey_out_search_area = true,
                        match_only_the_start_of_same_char_seqs = true,
                        limit_ft_matches = 5,
                        full_inclusive_prefix_key = "<c-x>",
                    }
                end,
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
            {
                "jghauser/mkdir.nvim",
                config = function()
                    require "mkdir"
                end,
            },
            {
                "mg979/vim-visual-multi",
                config = function()
                    var_tbl {
                        VM_default_mappings = 0,
                        VM_maps = {
                            ["Add Cursor Down"] = "<A-n>",
                            ["Add Cursor Up"] = "<A-p>",
                        },
                    }
                end,
            },
            {
                "blackCauldron7/surround.nvim",
                config = function()
                    vim.g.surround_mappings_style = "surround"
                    require("surround").setup {}
                end,
            },
            {
                "mhartington/formatter.nvim",
                config = [[require("p.nvim-formatter")]],
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
