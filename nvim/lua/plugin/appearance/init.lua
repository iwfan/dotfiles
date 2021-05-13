local appearance = {}
local insert = _G.insert(appearance)

insert {
  "kyazdani42/nvim-web-devicons",
  config = function() require 'plugin.appearance.web-devicons' end
}

insert "glepnir/zephyr-nvim"

insert {
  "norcalli/nvim-colorizer.lua",
  config = function() require "colorizer".setup() end
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
  config = function() require 'plugin.appearance.nvim-tree' end
}

insert {
  "glepnir/galaxyline.nvim",
  branch = "main",
  config = function() require "plugin.appearance.galaxyline" end
}

insert {
  "Akin909/nvim-bufferline.lua",
  requires = "moll/vim-bbye",
  config = function() require "plugin.appearance.nvim-bufferline" end
}


insert {
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function() require "plugin.appearance.telescope" end
}

--[[ insert {
  "lukas-reineke/indent-blankline.nvim",
  branch = "lua",
  config = function()
    g.indentLine_enabled = 1
    g.indent_blankline_char = " " -- ▏

    g.indent_blankline_filetype_exclude = {'help','dashboard','NvimTree','sagahover','terminal', 'packer'};
    g.indent_blankline_buftype_exclude = {"terminal"}

    g.indent_blankline_show_trailing_blankline_indent = false
    g.indent_blankline_show_first_indent_level = false
  end
} ]]

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

return appearance
