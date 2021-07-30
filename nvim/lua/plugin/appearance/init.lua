local appearance = {}
local insert = _G.insert(appearance)

insert {
  "kyazdani42/nvim-web-devicons",
  config = function() require 'plugin.appearance.web-devicons' end
}

insert {
  "sainnhe/gruvbox-material",
  config = function()
    var_tbl {
      gruvbox_material_enable_italic = 1,
      gruvbox_material_diagnostic_text_highlight = 1,
      gruvbox_material_sign_column_background = 'none'
    }
    vim.cmd([[colorscheme gruvbox-material]])
  end
}

insert {
  "glepnir/dashboard-nvim",
  config = function() require 'plugin.appearance.nvim-dashboard' end
}

insert {
  "kyazdani42/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons",
  config = function() require 'plugin.appearance.nvim-tree' end
}

-- insert {
--   "glepnir/galaxyline.nvim",
--   disable = true,
--   branch = "main",
--   config = function() require "plugin.appearance.galaxyline" end
-- }

insert {
  "Akin909/nvim-bufferline.lua",
  requires = "moll/vim-bbye",
  config = function() require "plugin.appearance.nvim-bufferline" end
}

insert {
  "famiu/feline.nvim",
  config = function()
    -- require('feline').setup()
    require "plugin.appearance.feline"
  end
}


insert {
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "nvim-telescope/telescope-project.nvim" }
  },
  config = function() require "plugin.appearance.telescope" end
}

return appearance
