local editor = {}
local insert = _G.insert(editor)

insert {
  "editorconfig/editorconfig-vim",
  config = [[vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}]]
}

insert {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require 'plugin.editor.treesitter'
  end
}
insert "nvim-treesitter/nvim-treesitter-textobjects"
insert "windwp/nvim-ts-autotag"

insert {
  'phaazon/hop.nvim',
  config = function()
    map_cmd('n|<leader>w', 'HopWord')
    map_cmd('n|<leader>l', 'HopLine')
    map_cmd('n|<leader>/', 'HopPattern')
  end
}

insert {
  "mg979/vim-visual-multi",
  config = function()
    var_tbl({
      VM_default_mappings = 0;
      VM_maps = {
        ["Add Cursor Down"] = '<A-j>';
        ["Add Cursor Up"] = '<A-k>';
      };
    })
  end
}

insert "junegunn/vim-easy-align"

insert {
  "andymass/vim-matchup",
  config = [[vim.g.matchup_matchparen_offscreen = {}]]
}

insert {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require "colorizer".setup()
  end
}

insert "junegunn/vim-peekaboo"

insert {
  "voldikss/vim-floaterm",
  config = function()
    var_tbl({
      floaterm_width = 0.9;
      floaterm_height = 0.9;
      floaterm_autoclose = 1;
    })
  end
}

return editor
