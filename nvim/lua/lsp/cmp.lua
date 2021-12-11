local cmp = require "cmp"

cmp.setup {
    mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },

    formatting = {
        format = require("lspkind").cmp_format {
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                calc = "[Calc]",
                path = "[Path]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
                ultisnips = "[Ultisnips]",
                treesitter = "  ",
                zsh = "[ZSH]",
            },
        },
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "calc" },
        { name = "nvim_lua" },
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
