local editor = {}
local insert = _G.insert(editor)

insert {
  "editorconfig/editorconfig-vim",
  config = [[vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}]]
}

insert {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function() require 'plugin.editor.treesitter' end
}
insert "nvim-treesitter/nvim-treesitter-textobjects"
insert "windwp/nvim-ts-autotag"

insert {
  "liuchengxu/vista.vim",
  config = function ()
    vim.g['vista#renderer#enable_icon'] = 1
    vim.g.vista_disable_statusline = 1
    vim.g.vista_default_executive = 'ctags'
    vim.g.vista_echo_cursor_strategy = 'floating_win'
    vim.g.vista_vimwiki_executive = 'markdown'
    vim.g.vista_executive_for = {
      vimwiki =  'markdown',
      pandoc = 'markdown',
      markdown = 'toc',
      lua = 'nvim_lsp',
      typescript = 'nvim_lsp',
      typescriptreact =  'nvim_lsp',
    }
    map_cmd("n|<leader>8", "Vista!!")
  end
}

-- comment
insert {
  'terrortylor/nvim-comment',
  config = function()
    require('nvim_comment').setup()
    map_cmd('n|<C-_>', 'CommentToggle')
  end
}
insert 'JoosepAlviste/nvim-ts-context-commentstring'

insert "tpope/vim-fugitive"
insert {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = {hl = "GitGutterAdd",          text = "▋"},
        change       = {hl = "GitGutterChange",       text = "▋"},
        delete       = {hl = "GitGutterDelete",       text = "▋"},
        topdelete    = {hl = "GitGutterDeleteChange", text = "▔"},
        changedelete = {hl = "GitGutterChange",       text  = "▎"}
      }
    }

    map_cmd([[n|\c]], 'lua require"gitsigns".preview_hunk()')
    map_cmd([[n|<BS>c]], 'lua require"gitsigns".reset_hunk()')
    map_cmd([[v|\c]], 'lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})')
  end,
  requires = {"nvim-lua/plenary.nvim", opt = true}
}
insert {
  "sindrets/diffview.nvim",
  config = function ()
    local cb = require'diffview.config'.diffview_callback

    require'diffview'.setup {
      diff_binaries = false,    -- Show diffs for binaries
      file_panel = {
        width = 35,
        use_icons = true        -- Requires nvim-web-devicons
      },
      key_bindings = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        view = {
          ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
          ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
          ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
          ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
        },
        file_panel = {
          ["j"]         = cb("next_entry"),         -- Bring the cursor to the next file entry
          ["<down>"]    = cb("next_entry"),
          ["k"]         = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
          ["<up>"]      = cb("prev_entry"),
          ["<cr>"]      = cb("select_entry"),       -- Open the diff for the selected entry.
          ["o"]         = cb("select_entry"),
          ["R"]         = cb("refresh_files"),      -- Update stats and entries in the file list.
          ["<tab>"]     = cb("select_next_entry"),
          ["<s-tab>"]   = cb("select_prev_entry"),
          ["<leader>e"] = cb("focus_files"),
          ["<leader>b"] = cb("toggle_files"),
        }
      }
    }
  end
}

insert {
  "mg979/vim-visual-multi",
  config = function()
    var_tbl({
      VM_default_mappings = 0;
      VM_maps = {
        ["Add Cursor Down"] = '<A-n>';
        ["Add Cursor Up"] = '<A-p>';
      };
    })
  end
}

insert {
  'phaazon/hop.nvim',
  config = function()
    map_cmd('n|<leader>w', 'HopWord')
    map_cmd('n|<leader>l', 'HopLine')
    map_cmd('n|<leader>/', 'HopPattern')
  end
}

insert {
  "andymass/vim-matchup",
  config = [[vim.g.matchup_matchparen_offscreen = {}]]
}

insert {
  "junegunn/vim-easy-align",
  config = function ()
    map("n|ga", [[<Plug>(EasyAlign)]], { noremap = false })
    map("x|ga", [[<Plug>(EasyAlign)]], { noremap = false })
  end
}
insert {
  "blackCauldron7/surround.nvim",
  config = function()
    vim.g.surround_mappings_style = 'surround'
    require "surround".setup {}
  end
}
insert "wellle/targets.vim"
insert "tommcdo/vim-exchange"
--insert "tpope/vim-dispatch"
--insert "kana/vim-textobj-user"
--insert "kana/vim-textobj-entire"
return editor
