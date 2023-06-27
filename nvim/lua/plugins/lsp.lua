return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "lsp.lsp_config"
        end,
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()
                end,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require "lsp.mason-lspconfig"
                end,
            },
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                config = function()
                    require("fidget").setup {}
                end,
            },
            "jose-elias-alvarez/typescript.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require "lsp.cmp"
        end,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
}
