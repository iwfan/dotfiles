local languages = {}
local insert = _G.insert(languages)

insert {
  "neovim/nvim-lspconfig",
  requires = "glepnir/lspsaga.nvim"
}

insert {
  "hrsh7th/nvim-compe",
  event = "InsertEnter",
  config = function()
    require "plugin.languages.compe"
  end,
  requires = {
    "hrsh7th/vim-vsnip",
    config = function()
      vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
    end
  }
}

insert "kabouzeid/nvim-lspinstall"

insert {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
  end
}

return languages
