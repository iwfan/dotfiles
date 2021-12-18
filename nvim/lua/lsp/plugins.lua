-- LSP
use { "neovim/nvim-lspconfig", config = "require('lsp.config')" }

-- LSP Cmp
use { "hrsh7th/cmp-nvim-lsp" }
use { "hrsh7th/cmp-nvim-lua" }
use { "hrsh7th/cmp-buffer" }
use { "hrsh7th/cmp-path" }
use { "hrsh7th/cmp-calc" }
use { "L3MON4D3/LuaSnip" }
use { "saadparwaiz1/cmp_luasnip" }
use { "rafamadriz/friendly-snippets" }
use { "hrsh7th/nvim-cmp", event = "InsertEnter", config = "require('lsp.cmp')" }

-- LSP Addons
use { "williamboman/nvim-lsp-installer", config = "require('lsp.installer')" }
use { "onsails/lspkind-nvim" }
use { "kosayoda/nvim-lightbulb" }
use { "folke/lsp-trouble.nvim", config = "require('trouble').setup {}" }
use { "jose-elias-alvarez/nvim-lsp-ts-utils", after = { "nvim-treesitter" } }
use {
    "simrat39/symbols-outline.nvim",
    setup = function()
        vim.g.symbols_outline = {
            width = 40,
        }
    end,
    cmd = "SymbolsOutline",
}
