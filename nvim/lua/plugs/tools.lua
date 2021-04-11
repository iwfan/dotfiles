local M = {}

function M.colorizer()
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

function M.gitsigns()
  if not packer_plugins["plenary.nvim"].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end
  require("gitsigns").setup {
    signs = {
      add = {hl = "GitGutterAdd", text = "▋"},
      change = {hl = "GitGutterChange", text = "▋"},
      delete = {hl = "GitGutterDelete", text = "▋"},
      topdelete = {hl = "GitGutterDeleteChange", text = "▔"},
      changedelete = {hl = "GitGutterChange", text = "▎"}
    },
    current_line_blame = true
  }
end

function M.formatter()
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

return M
