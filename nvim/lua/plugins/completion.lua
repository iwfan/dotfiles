return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        opts = {
            keymap = { preset = "super-tab" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                menu = {
                    draw = {
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                            kind = {
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                        },
                    },
                },
                ghost_text = { enabled = true },
            },
            snippets = { preset = "luasnip" },
            signature = { enabled = true },
        },
        config = function(_, opts)
            require("blink.cmp").setup(opts)
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").load { paths = { ".vscode" } }
        end,
    },
}
