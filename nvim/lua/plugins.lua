local exec = vim.api.nvim_command
local fn = vim.fn

local packer_exists = pcall(exec, [[packadd packer.nvim]])

if not packer_exists then
  local directory = string.format("%s/site/pack/packer/opt", fn.stdpath("data"))

  fn.mkdir(directory, "p")

  exec(string.format("!git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim"))

  exec [[packadd packer.nvim]]
  return
end

require("packer").startup(
  function()
    use {"wbthomason/packer.nvim", opt = true}

    -- Appearance
    do
      local appearance = require "plugs.appearance"
      use "kyazdani42/nvim-web-devicons"

      use {
        "glepnir/dashboard-nvim",
        config = appearance.dashboard
      }

      use {
        "kyazdani42/nvim-tree.lua",
        config = appearance.nvim_tree,
        requires = "kyazdani42/nvim-web-devicons"
      }

      use {
        "Akin909/nvim-bufferline.lua",
        config = appearance.bufferline,
        requires = "moll/vim-bbye"
      }

      use {
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function()
          require "plugs.galaxyline"
        end,
        requires = {
          "glepnir/zephyr-nvim",
          {"kyazdani42/nvim-web-devicons", opt = true}
        }
      }
    end

    -- Language Server
    do
      use {
        "neovim/nvim-lspconfig",
        requires = "glepnir/lspsaga.nvim"
      }
      use "kabouzeid/nvim-lspinstall"
      use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
          require "plugs.compe"
        end,
        requires = {
          "hrsh7th/vim-vsnip",
          config = function()
            vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
          end
        }
      }
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
      }
      use "nvim-treesitter/nvim-treesitter-textobjects"
      use {
        "mattn/emmet-vim",
        event = 'InsertEnter',
        ft = {'html','javascriptreact','vue','typescriptreact'},
        config = function ()
            vim.g.user_emmet_complete_tag = 0
            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_install_command = 0
            vim.g.user_emmet_mode = 'i'
        end
      }
    end

    -- Text Operation
    do
      use "wellle/targets.vim"
      use "kana/vim-textobj-user"
      use "kana/vim-textobj-entire"
      use "junegunn/vim-easy-align"
      use {"mg979/vim-visual-multi", branch = "master"}
      use {
        "andymass/vim-matchup",
        config = [[vim.g.matchup_matchparen_offscreen = {}]]
      }
      use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()
        end
      }
      use "tommcdo/vim-exchange"
      use "vim-scripts/ReplaceWithRegister"

      use {
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter"
      }
    end

    -- Search & Replace
    do
      use "haya14busa/incsearch.vim"
      use "easymotion/vim-easymotion"
      use "haya14busa/incsearch-easymotion.vim"
      -- Find & Replace
      use {
        "brooth/far.vim",
        cmd = {"F", "Far", "Fardo"},
        run = ":UpdateRemotePlugins",
        config = [[vim.g.["far#source"] = "rg"]]
      }
    end

    -- Global Search
    do
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          {"nvim-lua/popup.nvim"},
          {"nvim-lua/plenary.nvim"},
          {"nvim-telescope/telescope-fzy-native.nvim"},
          {"nvim-telescope/telescope-media-files.nvim"}
        },
        config = function()
          require("telescope").setup {
            defaults = {
              prompt_prefix = "🔭 ",
              prompt_position = "top",
              selection_caret = " ",
              sorting_strategy = "ascending",
              results_width = 0.6,
              file_previewer = require "telescope.previewers".vim_buffer_cat.new,
              grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
              qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new
            },
            extensions = {
              fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
              },
              media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = {"png", "webp", "jpg", "jpeg"},
                find_cmd = "rg" -- find command (defaults to `fd`)
              }
            }
          }
          require("telescope").load_extension("fzy_native")
          require("telescope").load_extension("media_files")
        end
      }
    end

    -- Git
    do
      use "tpope/vim-fugitive"
      use {
        "rhysd/git-messenger.vim",
        cmd = {"GitMessenger", "GitMessengerClose"},
        config = [[vim.g.git_messenger_no_default_mappings = 1]]
      }
      use {
        "lewis6991/gitsigns.nvim",
        event = {"BufRead", "BufNewFile"},
        config = require "plugs.tools".gitsigns,
        requires = {"nvim-lua/plenary.nvim", opt = true}
      }
    end

    -- Tools
    do
      local tools = require "plugs.tools"
      use {
        "norcalli/nvim-colorizer.lua",
        config = tools.colorizer
      }
      use "junegunn/vim-peekaboo"
      use {
        "voldikss/vim-floaterm",
        config = [[
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
            vim.g.floaterm_autoclose = 1
       ]]
      }
      use {
        "mbbill/undotree",
        cmd = {"UndotreeToggle"},
        config = [[vim.g.undotree_WindowLayout = 4]]
      }
      use {
        "liuchengxu/vista.vim",
        cmd = {"Vista"},
        config = tools.vista
      }
      use {
        "ybian/smartim",
        config = function()
          vim.g.smartim_default = "com.apple.keylayout.ABC"
        end
      }
      use "voldikss/vim-translator"

      use {
        "editorconfig/editorconfig-vim",
        config = [[vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}]]
      }
    end

    -- Misc
    do
      use "tpope/vim-repeat"
      use "tpope/vim-obsession"
      use "tpope/vim-commentary"
      use "tpope/vim-surround"
      use "tpope/vim-dispatch"
    end
  end
)

require "plugs"
require "plugs"
