local editor = {}
local insert = _G.insert(editor)

insert {
  "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
  config = function() require 'plugin.editor.treesitter' end
}
insert "nvim-treesitter/nvim-treesitter-textobjects"
insert "windwp/nvim-ts-autotag"
insert {
  'terrortylor/nvim-comment',
  config = function()
    require('nvim_comment').setup({
      comment_empty = false,
      hook = function()
        local filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "vue"}
        local curr_filetype = vim.api.nvim_buf_get_option(0, "filetype")
        if vim.tbl_contains(filetypes, curr_filetype) then
          require("ts_context_commentstring.internal").update_commentstring()
        end
      end
    })
    map_cmd('n|<C-_>', 'CommentToggle')
  end
}
insert 'JoosepAlviste/nvim-ts-context-commentstring'

insert {
  "lukas-reineke/indent-blankline.nvim",
  config = function() require 'plugin.editor.indent-blankline' end
}

insert {
  "norcalli/nvim-colorizer.lua",
  config = function() require "colorizer".setup() end
}

insert "tpope/vim-repeat"
insert {
  "tpope/vim-fugitive",
  cmd = {
    "Git"
  }
}

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
  config = function() require 'plugin.editor.diffview' end
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
  "kevinhwang91/nvim-hlslens",
  config = function() require 'plugin.editor.hlslens' end
}


insert {
  "windwp/nvim-spectre",
  config = function() require 'plugin.editor.spectre' end
}

-- Lightspeed
insert {
  "ggandor/lightspeed.nvim",
  config = function ()
    require'lightspeed'.setup {
      jump_to_first_match = true,
      jump_on_partial_input_safety_timeout = 400,
      highlight_unique_chars = false,
      grey_out_search_area = true,
      match_only_the_start_of_same_char_seqs = true,
      limit_ft_matches = 5,
      full_inclusive_prefix_key = '<c-x>',
    }

    vim.api.nvim_set_keymap('n', 'f', '<Plug>Lightspeed_f', {noremap = false, silent = false})
    vim.api.nvim_set_keymap('n', 'F', '<Plug>Lightspeed_F', {noremap = false, silent = false})
    vim.api.nvim_set_keymap('n', 't', '<Plug>Lightspeed_t', {noremap = false, silent = false})
    vim.api.nvim_set_keymap('n', 'T', '<Plug>Lightspeed_T', {noremap = false, silent = false})
  end
}

insert {
  "nacro90/numb.nvim",
  config = function ()
    require('numb').setup{
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true -- Enable 'cursorline' for the window while peeking
    }
  end
}

insert {
  "andymass/vim-matchup",
  config = [[vim.g.matchup_matchparen_offscreen = {}]]
}

insert "tversteeg/registers.nvim"

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

return editor
