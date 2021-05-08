local M = {}

function M.dashboard()
  -- local home = os.getenv('HOME')
  -- vim.g.dashboard_footer_icon = '🐬 '
  -- vim.g.dashboard_preview_command = 'cat'
  -- vim.g.dashboard_preview_pipeline = 'lolcat -F 0.3'
  -- vim.g.dashboard_preview_file = home .. '/.config/nvim/static/neovim.cat'
  -- vim.g.dashboard_preview_file_height = 12
  -- vim.g.dashboard_preview_file_width = 80
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

function M.nvim_tree()
  local tree_cb = require "nvim-tree.config".nvim_tree_callback
  local helpers = require "helpers"
  local bind_key = helpers.bind_key
  local map_cu = helpers.map_cu
  helpers.parse_variable_from_table {
    nvim_tree_side = "left",
    nvim_tree_indent_markers = 1,
    nvim_tree_ignore = {".git", ".cache", ".idea", ".DS_Store"},
    nvim_tree_auto_open = 0,
    nvim_tree_auto_close = 1,
    nvim_tree_quit_on_open = 1,
    nvim_tree_follow = 1,
    nvim_tree_git_hl = 1,
    nvim_tree_tab_open = 1,
    nvim_tree_width_allow_resize = 1,
    nvim_tree_bindings = {
      ["l"] = tree_cb("edit"),
      ["h"] = tree_cb("close_node")
    },
    nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "✹",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "?"
      },
      folder = {
        default = "📁",
        open = "📂",
        symlink = "🔗"
      }
    }
  }

  bind_key("n|<leader>1", map_cu("NvimTreeToggle"):with_noremap():with_silent())
end

function M.bufferline()
  local helpers = require "helpers"
  local bind_key = helpers.bind_key
  local map_cr = helpers.map_cr
  require "bufferline".setup {
    options = {
      view = "multiwindow",
      mappings = false,
      always_show_bufferline = false,
      show_buffer_close_icons = false
    }
  }

  bind_key("n|[b", map_cr("BufferLineCyclePrev"):with_noremap():with_silent())
  bind_key("n|]b", map_cr("BufferLineCycleNext"):with_noremap():with_silent())
  bind_key("n|b<", map_cr("BufferLineMovePrev"):with_noremap():with_silent())
  bind_key("n|b>", map_cr("BufferLineMoveNext"):with_noremap():with_silent())
  bind_key("n|gb", map_cr("BufferLinePick"):with_noremap():with_silent())
  bind_key("n|<BS>b", map_cr("Bdelete"):with_noremap():with_silent())
  bind_key("n|<M-[>", map_cr("BufferLineCyclePrev"):with_noremap():with_silent())
  bind_key("n|<M-]>", map_cr("BufferLineCycleNext"):with_noremap():with_silent())
end

return M
