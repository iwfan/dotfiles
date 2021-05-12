local M = {}

function M.dashboard()
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
      default = "📄",
      symlink = "🔗",
      git = {
        unstaged = "✹",
        staged="✓",
        unmerged="",
        renamed="➜",
        untracked = "?",
        deleted="",
        ignored="◌"
      },
      folder = {
        default = "📁",
        open = "📂",
        symlink = "🔗"
      },
      lsp  = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    }
  }

  bind_key("n|<leader>1", map_cu("NvimTreeToggle"):with_noremap():with_silent())
end

function M.bufferline()
  local helpers = require "helpers"
  local bind_key = helpers.bind_key
  local map_cr = helpers.map_cr

  vim.api.nvim_exec([[
    let bufferline = get(g:, 'bufferline', {})
    let bufferline.animation = v:true
    let bufferline.auto_hide = v:true
  ]], false)

  bind_key("n|bh", map_cr("BufferPrevious"):with_noremap():with_silent())
  bind_key("n|bl", map_cr("BufferNext"):with_noremap():with_silent())
  bind_key("n|b<", map_cr("BufferMovePrevious"):with_noremap():with_silent())
  bind_key("n|b>", map_cr("BufferMoveNext"):with_noremap():with_silent())
  bind_key("n|gb", map_cr("BufferPick"):with_noremap():with_silent())
  bind_key("n|<BS>b", map_cr("BufferClose"):with_noremap():with_silent())
  bind_key("n|<A-,>", map_cr("BufferPrevious"):with_noremap():with_silent())
  bind_key("n|<A-.>", map_cr("BufferNext"):with_noremap():with_silent())
  bind_key("n|<A-<>", map_cr("BufferMovePrevious"):with_noremap():with_silent())
  bind_key("n|<A->>", map_cr("BufferMoveNext"):with_noremap():with_silent())
end

return M
