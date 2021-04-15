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

function M.vista()
  local helpers = require "helpers"

  helpers.parse_variable_from_table {
    -- Vista
    ["vista#renderer#enable_icon"] = 1,
    vista_disable_statusline = 1,
    vista_icon_indent = {"╰─▸ ", "├─▸ "},
    vista_default_executive = "ctags",
    vista_finder_alternative_executives = {"ctags"},
    vista_echo_cursor_strategy = "floating_win",
    vista_executive_for = {
      vimwiki = "markdown",
      pandoc = "markdown",
      markdown = "toc",
      typescript = "nvim_lsp",
      typescriptreact = "nvim_lsp",
      lua = "nvim_lsp"
    },
    vista_cursor_delay = 200,
    vista_update_on_text_changed = 1
  }
end

return M
