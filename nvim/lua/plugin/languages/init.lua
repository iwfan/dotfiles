local languages = {}
local insert = _G.insert(languages)

insert {
  "neovim/nvim-lspconfig",
  config = function()
    require 'plugin.languages.lsp-config'
  end
}

insert {
  'glepnir/lspsaga.nvim',
  config = function()
    require 'plugin.languages.lsp-saga'
  end
}

insert {
  'folke/lsp-trouble.nvim',
  config = function()
    require 'plugin.languages.lsp-trouble'
  end
}

insert {
  'folke/todo-comments.nvim',
  config = function()
    require("todo-comments").setup {
      signs = false
    }
    map_cmd("n|<leader>ft", "TodoTelescope")
  end
}

insert {
  "hrsh7th/nvim-compe",
  config = function()
    require "plugin.languages.lsp-compe"
  end
}

insert {
  'onsails/lspkind-nvim',
  config = function()
    require "plugin.languages.lsp-kind"
  end
}

insert {
  "simrat39/symbols-outline.nvim",
  config = function ()
    vim.g.symbols_outline = {
      keymaps = {
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "K",
        rename_symbol = "r",
        code_actions = "a",
      },
    }
    map_cmd("n|<leader>2", "SymbolsOutline")
  end
}

insert {
  "mattn/emmet-vim",
  config = function()
    -- vim.g.user_emmet_mode = 'a'
  end
}

insert {
  "hrsh7th/vim-vsnip",
  config = function()
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
  end
}
insert 'hrsh7th/vim-vsnip-integ'
insert 'rafamadriz/friendly-snippets'

insert 'jose-elias-alvarez/nvim-lsp-ts-utils'

return languages
