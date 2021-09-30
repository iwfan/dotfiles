local languages = {}
local insert = _G.insert(languages)

insert({
    "williamboman/nvim-lsp-installer",
    cmd = {
        "LspInstallInfo",
        "LspInstall",
        "LspUninstall",
        "LspUninstallAll",
        "LspPrintInstalled",
    },
})

insert({
    "neovim/nvim-lspconfig",
    config = function()
        require("plugin.languages.lsp-config")
    end,
})

insert({
    "glepnir/lspsaga.nvim",
    config = function()
        require("plugin.languages.lsp-saga")
    end,
})

insert({
    "folke/lsp-trouble.nvim",
    config = function()
        require("plugin.languages.lsp-trouble")
    end,
})

insert({
    "folke/todo-comments.nvim",
    config = function()
        require("todo-comments").setup({ signs = false })
        map_cmd("n|<leader>ft", "TodoTelescope")
    end,
})

-- insert({
--     "hrsh7th/nvim-compe",
--     event = "InsertEnter",
--     config = function()
--         require("plugin.languages.lsp-compe")
--     end,
--     wants = "vim-vsnip",
--     requires = {
--         { "rafamadriz/friendly-snippets" },
--         { "hrsh7th/vim-vsnip-integ" },
--         {
--             "hrsh7th/vim-vsnip",
--             wants = "friendly-snippets",
--             event = "InsertCharPre",
--             config = function()
--                 vim.g.vsnip_snippet_dir = config_path .. "/snippets"
--             end,
--         },
--     },
-- })

insert({
    "ms-jpq/coq_nvim",
    branch = "coq",
    config = function()
        vim.g.coq_settings = { auto_start = true }
    end,
})
insert({ "ms-jpq/coq.artifacts", branch = "artifacts" }) -- 9000+ Snippets

insert({
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({ disable_filetype = { "TelescopePrompt" } })
    end,
})

insert({
    "onsails/lspkind-nvim",
    event = "BufEnter",
    config = function()
        require("plugin.languages.lsp-kind")
    end,
})

insert("jose-elias-alvarez/nvim-lsp-ts-utils")

insert({
    "simrat39/symbols-outline.nvim",
    config = function()
        vim.g.symbols_outline = {
            keymaps = {
                close = { "<Esc>", "q" },
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "K",
                rename_symbol = "r",
                code_actions = "a",
            },
        }
        map_cmd("n|<leader>2", "SymbolsOutline")
    end,
})

insert({
    "mattn/emmet-vim",
    event = "InsertEnter",
    ft = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "vue",
        "typescript",
        "typescriptreact",
    },
    config = function()
        vim.g.user_emmet_complete_tag = 0
        vim.g.user_emmet_install_global = 0
        vim.g.user_emmet_install_command = 0
        vim.g.user_emmet_mode = "i"
    end,
})

return languages
