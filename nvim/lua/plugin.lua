local install_path = ("%s/site/pack/packer/start/packer.nvim"):format(stdpath)

local function install_packer()
    vim.fn.termopen(("git clone --depth=1 https://github.com/wbthomason/packer.nvim %q"):format(install_path))
    vim.cmd "packadd packer.nvim"
end

if fn.empty(fn.glob(install_path)) > 0 then
    install_packer()
end

function _G.packer_upgrade()
    vim.fn.delete(install_path, "rf")
    install_packer()
end

vim.cmd [[command! PackerUpgrade :call v:lua.packer_upgrade()]]

require("packer").startup {
    function(use, use_rocks)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

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
                "tpope/vim-fugitive",
                cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
            },
            {
                "tpope/vim-obsession",
                cmd = { "Obsess" },
            },
            {
                "tpope/vim-dispatch",
                cmd = { "Dispatch", "Make", "Focus", "Start" },
                requires = { "radenling/vim-dispatch-neovim" },
            },
        }

        use {
            {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/popup.nvim",
                    "nvim-lua/plenary.nvim",
                    "nvim-telescope/telescope-fzy-native.nvim",
                },
                config = [[require("p.nvim-telescope").setup()]],
            },
            {
                "windwp/nvim-spectre",
                config = [[require("p.nvim-spectre")]],
            },
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
        }

        use {
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = [[require("p.nvim-treesitter").setup()]],
            },
            { "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "windwp/nvim-ts-autotag",
                ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup { disable_filetype = { "TelescopePrompt" } }
                end,
            },
            {
                "terrortylor/nvim-comment",
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

        -- LSP
        use {
            {
                "neovim/nvim-lspconfig",
                config = [[require("p.nvim-lsp").setup()]],
            },
            {
                "williamboman/nvim-lsp-installer",
                requires = "neovim/nvim-lspconfig",
            },
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            {
                "hrsh7th/cmp-nvim-lsp",
                after = "nvim-lspconfig",
            },
            {
                "hrsh7th/cmp-buffer",
                after = "cmp-nvim-lsp",
            },
            {
                "hrsh7th/cmp-path",
                after = "cmp-buffer",
            },
            {
                "hrsh7th/nvim-cmp",
                config = [[require("p.nvim-lsp.completion").setup()]],
            },
        }

        use {
            {
                "kyazdani42/nvim-web-devicons",
                config = [[require("p.nvim-devicons").setup()]],
            },
            {
                "kyazdani42/nvim-tree.lua",
                after = "nvim-web-devicons",
                config = [[require("p.nvim-tree")]],
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
            {
                "lewis6991/gitsigns.nvim",
                requires = "nvim-lua/plenary.nvim",
                config = [[require("p.nvim-gitsigns").setup()]],
            },
            "psliwka/vim-smoothie",
            {
                "tversteeg/registers.nvim",
                setup = function()
                    vim.g.registers_return_symbol = " "
                    vim.g.registers_tab_symbol = " "
                    vim.g.registers_space_symbol = "␣"
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
                "ybian/smartim",
                config = function()
                    vim.g.smartim_default = "com.apple.keylayout.ABC"
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
            {
                "mattn/emmet-vim",
                event = "InsertEnter",
                ft = {
                    "html",
                    "css",
                    "javascript",
                    "javascriptreact",
                    "vue",
                    "typescript",
                    "typescriptreact",
                },
                config = function()
                    vim.g.user_emmet_complete_tag = 0
                    vim.g.user_emmet_install_global = 0
                    vim.g.user_emmet_install_command = 0
                    vim.g.user_emmet_mode = "i"
                end,
            },
        }
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

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
