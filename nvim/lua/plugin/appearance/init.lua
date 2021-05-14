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
    { "nvim-telescope/telescope-fzy-native.nvim" }
  },
  config = function() require "plugin.appearance.telescope" end
}

insert {
  "lukas-reineke/indent-blankline.nvim",
  branch = "lua",
  config = function()
    vim.g.indent_blankline_char = "│"
    vim.g.indent_blankline_show_first_indent_level = false
    vim.g.indent_blankline_filetype_exclude = {
      "startify",
      "dashboard",
      "dotooagenda",
      "log",
      "fugitive",
      "gitcommit",
      "packer",
      "vimwiki",
      "markdown",
      "json",
      "txt",
      "vista",
      "help",
      "todoist",
      "NvimTree",
      "peekaboo",
      "git",
      "TelescopePrompt",
      "undotree",
      "flutterToolsOutline",
      "" -- for all buffers without a file type
    }
    vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_context_patterns = {
      "class",
      "function",
      "method",
      "block",
      "list_literal",
      "selector",
      "^if",
      "^table",
      "if_statement",
      "while",
      "for"
    }
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

return appearance