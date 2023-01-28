local cmp = require "cmp"
local luasnip = require "luasnip"
local types = require "luasnip.util.types"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    formatting = {
        format = function(entry, vim_item)
            local icons = require "lsp.lspkind_icons"
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                buffer = "[BUF]",
            })[entry.source.name]

            return vim_item
        end,
    },

    sources = {
        { name = "luasnip", keyword_length = 2, max_item_count = 6 },
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "nvim_lua", keyword_length = 2 },
        { name = "buffer", keyword_length = 2 },
        { name = "path", keyword_length = 2 },
    },
}

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").lazy_load {
    paths = { vim.fn.stdpath "config" .. "/snippets", vim.fn.stdpath "data" .. "/lazy/friendly-snippets" },
}
