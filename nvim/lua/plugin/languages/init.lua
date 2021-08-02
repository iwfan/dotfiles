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
  end,
  requires = {
    {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      config = function()
        local luasnip = require("luasnip")
        luasnip.config.set_config(
          {
            history = true,
            updateevents = "TextChanged,TextChangedI"
          }
        )
        require("luasnip/loaders/from_vscode").load()
      end
    },
    "rafamadriz/friendly-snippets",
    {
      "hrsh7th/vim-vsnip",
      config = function()
        vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
      end
    },
    'hrsh7th/vim-vsnip-integ'
  }
}

insert {
  "windwp/nvim-autopairs",
  after = "hrsh7th/nvim-compe",
  config = function()
    require("nvim-autopairs").setup({
      disable_filetype = { "TelescopePrompt" , "vim" }
    })
    require("nvim-autopairs.completion.compe").setup({
      map_cr = true, --  map <CR> on insert mode
      map_complete = true -- it will auto insert `(` after select function or method item
    })
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

insert 'jose-elias-alvarez/nvim-lsp-ts-utils'

return languages
