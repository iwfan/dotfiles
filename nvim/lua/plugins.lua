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

return require("packer").startup(
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
      use {"neovim/nvim-lspconfig", disable = true}
      use {"nvim-lua/completion-nvim", disable = true}
      use {"nvim-lua/lsp-status.nvim", disable = true}
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
      }
      use "nvim-treesitter/completion-treesitter"
      use "nvim-treesitter/nvim-treesitter-textobjects"
      use "nvim-treesitter/playground"
      use {"tjdevries/nlua.nvim", disable = true}
      use {"tjdevries/lsp_extensions.nvim", disable = true}
    end

    -- Text Operation
    do
      use "wellle/targets.vim"
      use "kana/vim-textobj-user"
      use "kana/vim-textobj-entire"
      use "junegunn/vim-easy-align"
      use {"mg979/vim-visual-multi", branch = "master"}
      use "andymass/vim-matchup"
      use "windwp/nvim-autopairs"
      use "tommcdo/vim-exchange"
      use "vim-scripts/ReplaceWithRegister"

      use "alvan/vim-closetag"
      use "AndrewRadev/tagalong.vim"
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
        run = ":UpdateRemotePlugins"
      }
    end

    -- Global Search
    do
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          {"nvim-lua/popup.nvim"},
          {"nvim-lua/plenary.nvim"},
          {"nvim-telescope/telescope-fzy-native.nvim"}
        },
        config = function()
          require("telescope").setup {
            extensions = {
              fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
              }
            }
          }
          require("telescope").load_extension("fzy_native")
        end
      }
    end

    -- Git
    do
      use "tpope/vim-fugitive"
      use {
        "rhysd/git-messenger.vim",
        cmd = {"GitMessenger", "GitMessengerClose"}
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
        ft = {"html", "css", "sass", "vim", "tmux", "typescript", "typescriptreact"},
        config = tools.colorizer
      }
      use "junegunn/vim-peekaboo"
      use "voldikss/vim-floaterm"
      use {"mbbill/undotree", cmd = {"UndotreeToggle"}}
      use {"liuchengxu/vista.vim", cmd = {"Vista"}}
      use {
        "ybian/smartim",
        config = function()
          vim.g.smartim_default = "com.apple.keylayout.ABC"
        end
      }
      use "voldikss/vim-translator"

      use "editorconfig/editorconfig-vim"

      use {
        "mhartington/formatter.nvim",
        cmd = {"Format"},
        ft = {
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "html",
          "json",
          "css",
          "lua",
          "go"
        },
        config = tools.formatter
      }
    end

    -- Misc
    do
      use "tpope/vim-repeat"
      use "tpope/vim-obsession"
      use "tpope/vim-commentary"
      use "tpope/vim-surround"
    end
  end
)
