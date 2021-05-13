local languages = {}
local insert = _G.insert(languages)

insert "neovim/nvim-lspconfig"
insert 'glepnir/lspsaga.nvim'
insert {
  'onsails/lspkind-nvim',
  config = function()
    require('lspkind').init({
      with_text = true,
      symbol_map = {
          Text = '',
          Method = 'ƒ',
          Function = '',
          Constructor = '',
          Variable = '',
          Class = '',
          Interface = 'ﰮ',
          Module = '',
          Property = '',
          Unit = '',
          Value = '',
          Enum = '',
          Keyword = '',
          Snippet = '﬌',
          Color = '',
          File = '',
          Folder = '',
          EnumMember = '',
          Constant = '',
          Struct = ''
      }
    })
  end
}

insert {
  'folke/lsp-trouble.nvim',
  config = function()
    require("trouble").setup {
      height = 7, -- height of the trouble list
      icons = true, -- use devicons for filenames
      mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      action_keys = { -- key mappings for actions in the trouble list
          close = "q", -- close the list
          cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r", -- manually refresh
          jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
          jump_close = {"o"}, -- jump to the diagnostic and close the list
          toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = "P", -- toggle auto_preview
          hover = "K", -- opens a small poup with the full multiline message
          preview = "p", -- preview the diagnostic location
          close_folds = {"zM", "zm"}, -- close all folds
          open_folds = {"zR", "zr"}, -- open all folds
          toggle_fold = {"zA", "za"}, -- toggle fold of current file
          previous = "k", -- preview item
          next = "j" -- next item
      },
      indent_lines = true, -- add an indent guide below the fold icons
      auto_open = true, -- automatically open the list when you have diagnostics
      auto_close = true, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = true, -- automatically fold a file trouble list at creation
      signs = {
          -- icons / text used for a diagnostic
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠"
      },
      use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
  end
}
insert {
  'ray-x/lsp_signature.nvim',
  config = function()
    require('lsp_signature').on_attach()
  end
}

insert {
  "hrsh7th/nvim-compe",
  event = "InsertEnter",
  config = function()
    require "plugin.languages.compe"
  end
}
insert {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
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

insert "kabouzeid/nvim-lspinstall"

return languages
