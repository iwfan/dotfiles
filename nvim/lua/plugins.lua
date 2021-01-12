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
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    use "tpope/vim-speeddating"
    use "tpope/vim-repeat"
    use "tpope/vim-abolish"
    use "tpope/vim-obsession"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "tpope/vim-scriptease"
    use "tpope/vim-dispatch"
    use "tpope/vim-sleuth"

    use "theprimeagen/vim-be-good"

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

    use {
      "neoclide/coc.nvim",
      branch = "release",
      config = function()
        require "plugs.coc"
      end
      -- ,
      -- ft = {
      --   "typescript",
      --   "typescriptreact",
      --   "javascript",
      --   "javascriptreact",
      --   "html",
      --   "json",
      --   "css"
      -- }
    }

    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require "nvim-web-devicons".setup {default = true}
      end
    }
    use {
      "glepnir/zephyr-nvim",
      config = function()
        -- require "zephyr"
      end
    }
    use {
      "glepnir/dashboard-nvim",
      config = function()
        vim.g.dashboard_default_executive = "telescope"
        vim.g.dashboard_custom_section = {
          new_file = {
            description = {"  New   File                              SPC t f"},
            command = "DashboardNewFile"
          },
          find_history = {
            description = {"  Recently opened files                   SPC f h"},
            command = "DashboardFindHistory"
          },
          find_file = {
            description = {"  Find  File                              SPC f f"},
            command = "DashboardFindFile"
          },
          find_word = {
            description = {"  Find  Word                              SPC f g"},
            command = "DashboardFindWord"
          },
          find_register = {
            description = {"  Find  Register                          SPC f r"},
            command = "DashboardJumpMark"
          }
        }
      end
    }
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      -- your statusline
      config = function()
        require "plugs.galaxyline"
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {
      "glepnir/indent-guides.nvim",
      config = function()
        require "indent_guides".setup {
          indent_guide_size = 1,
          indent_start_level = 2,
          exclude_filetypes = {"NvimTree", "dashboard", "vista", "help", "sagahover", "terminal"}
        }
      end
    }
    use "kyazdani42/nvim-tree.lua"
    use {
      "Akin909/nvim-bufferline.lua",
      config = function()
        require "bufferline".setup {
          options = {
            mappings = false,
            always_show_bufferline = false
          }
        }
      end,
      requires = {"glepnir/zephyr-nvim"}
    }
    use "moll/vim-bbye"

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup(
          {
            css = {rgb_fn = true},
            scss = {rgb_fn = true},
            sass = {rgb_fn = true},
            stylus = {rgb_fn = true},
            vim = {names = true},
            tmux = {names = false},
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            html = {
              mode = "foreground"
            }
          }
        )
      end
    }

    use {
      "norcalli/nvim-terminal.lua",
      config = function()
        require "terminal".setup()
      end
    }

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

    use "wellle/targets.vim"
    use "kana/vim-textobj-user"
    use "kana/vim-textobj-entire"
    use "junegunn/vim-easy-align"

    use {"mg979/vim-visual-multi", branch = "master"}
    use "andymass/vim-matchup"

    use "Raimondi/delimitMate"

    use "tommcdo/vim-exchange"
    use "vim-scripts/ReplaceWithRegister"

    --  Speed j/k when press
    use "rhysd/accelerated-jk"

    -- Git
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "junegunn/gv.vim"
    use "rhysd/git-messenger.vim"
    use "mhinz/vim-signify"

    use "kshenoy/vim-signature"

    use "junegunn/vim-peekaboo"
    use "voldikss/vim-floaterm"

    use "editorconfig/editorconfig-vim"
    use "liuchengxu/vim-which-key"
    use {"mbbill/undotree", cmd = {"UndotreeToggle"}}

    -- searching
    use "haya14busa/incsearch.vim"
    use "easymotion/vim-easymotion"
    use "haya14busa/incsearch-easymotion.vim"
    -- Find & Replace
    use {
      "brooth/far.vim",
      cmd = {"F", "Far", "Fardo"},
      run = ":UpdateRemotePlugins"
    }

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
      config = function()
        local prettier = function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end

        require("formatter").setup(
          {
            logging = false,
            filetype = {
              javascript = {
                prettier
              },
              javascriptreact = {
                prettier
              },
              typescript = {
                prettier
              },
              typescriptreact = {
                prettier
              },
              lua = {
                -- luafmt
                function()
                  return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                  }
                end
              },
              go = {
                function()
                  return {
                    exe = "gofmt",
                    args = {},
                    stdin = true
                  }
                end
              }
            }
          }
        )
      end
    }

    use {
      "ybian/smartim",
      config = function()
        vim.g.smartim_default = "com.apple.keylayout.ABC"
      end
    }

    -- use 'AndrewRadev/splitjoin.vim'
    -- use 'pechorin/any-jump.vim'

    use {"liuchengxu/vista.vim", cmd = {"Vista"}}

    -- === html Plugins === "
    use "alvan/vim-closetag"
    use "AndrewRadev/tagalong.vim"

    -- use "romainl/vim-qf"

    -- " === css Plugins === "
    -- use 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'javascript','javascriptreact' ] }

    -- " === Javascript Plugins === "
    -- use 'moll/vim-node'
    -- use 'leafgarland/typescript-vim'
    -- use 'peitalin/vim-jsx-typescript'
  end
)
