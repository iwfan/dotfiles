return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lsp.lsp_config"
        end,
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {}
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require "plugins.configs.lsp.mason-lspconfig"
                end,
            },
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                opts = {}
            },
            "jose-elias-alvarez/typescript.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require "plugins.configs.lsp.cmp"
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
