local M = {}

M.setup = function()
    -- Setup nvim-cmp.
    local cmp = require "cmp"

    cmp.setup {
        snippet = {
            expand = function(args)
                -- For `vsnip` user.
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

                -- For `luasnip` user.
                -- require('luasnip').lsp_expand(args.body)

                -- For `ultisnips` user.
                -- vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ["<Tab>"] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
                    -- elseif require("luasnip").expand_or_jumpable() then
                    --     vim.fn.feedkeys(
                    --         vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                    --         ""
                    --     )
                else
                    fallback()
                end
            end,
            ["<S-Tab>"] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
                    -- elseif require("luasnip").jumpable(-1) then
                    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
        },
    }

    -- -- Setup lspconfig.
    -- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
    --   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- }

    -- you need setup cmp first put this after cmp.setup()
    require("nvim-autopairs.completion.cmp").setup {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = true, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = { -- modifies the function or method delimiter by filetypes
            all = "(",
            tex = "{",
        },
    }
end

return M
