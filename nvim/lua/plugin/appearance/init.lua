local appearance = {}
local insert = _G.insert(appearance)

insert {
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" }
  },
  config = function()
    local actions = require('telescope.actions')
    require("telescope").setup {
      defaults = {
        prompt_prefix = "🔭 ",
        prompt_position = "top",
        selection_caret = " ",
        sorting_strategy = "ascending",
        results_width = 0.6,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        mappings = {
          i = {
            ["<c-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true
        },
        media_files = {
          filetypes = { "png", "webp", "jpg", "jpeg" },
          find_cmd = "rg" -- find command (defaults to `fd`)
        }
      }
    }
    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("media_files")
  end
}

insert {
  "glepnir/dashboard-nvim",
  config = function()
    g.dashboard_default_executive = "telescope"
  end
}

insert {
  "kyazdani42/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    local tree_cb = require "nvim-tree.config".nvim_tree_callback
    var_tbl {
      nvim_tree_width = 40,
      nvim_tree_indent_markers = 1,
      nvim_tree_auto_open = 0,
      nvim_tree_auto_close = 1,
      nvim_tree_quit_on_open = 1,
      nvim_tree_follow = 1,
      nvim_tree_git_hl = 1,
      nvim_tree_tab_open = 1,
      nvim_tree_width_allow_resize = 1,
      nvim_tree_lsp_diagnostics = 1,
      nvim_tree_ignore = { ".git", ".cache", ".idea", ".DS_Store" },
      nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' },
      nvim_tree_bindings = {
        ["l"] = tree_cb("edit"),
        ["h"] = tree_cb("close_node")
      },
      nvim_tree_icons = {
        default = "📄",
        symlink = "🔗",
        git = {
          unstaged = "✹",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "?",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          default = "📁",
          open = "📂",
          symlink = "🔗"
        },
        lsp = {
          hint = " ",
          info = " ",
          warning = " ",
          error = " ",
        }
      }
    }

    map_cmd("n|<leader>1", "NvimTreeToggle")
  end
}

insert {
  "glepnir/galaxyline.nvim",
  branch = "main",
  config = function()
    require "plugin.appearance.galaxyline"
  end,
  requires = {
    "glepnir/zephyr-nvim",
    "kyazdani42/nvim-web-devicons"
  }
}

insert {
  "Akin909/nvim-bufferline.lua",
  requires = "moll/vim-bbye",
  config = function()
    require "bufferline".setup {
      options = {
        view = "multiwindow",
        mappings = false,
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp"
      }
    }

    map_cmd("n|[b", "BufferLineCyclePrev")
    map_cmd("n|]b", "BufferLineCycleNext")
    map_cmd("n|bh", "BufferLineCyclePrev")
    map_cmd("n|bl", "BufferLineCycleNext")
    map_cmd("n|b<", "BufferLineMovePrev")
    map_cmd("n|b>", "BufferLineMoveNext")
    map_cmd("n|gb", "BufferLinePick")
    map_cmd("n|<BS>b", "Bdelete")
  end
}

return appearance
