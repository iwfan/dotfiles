-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
    severity_sort = true,
    -- update_in_insert = true,
    float = { severity_sort = true, border = "rounded", source = "if_many" },
    underline = true,
    signs = false,
    -- signs = {
    --     text = {
    --         [vim.diagnostic.severity.ERROR] = '󰅚 ',
    --         [vim.diagnostic.severity.WARN] = '󰀪 ',
    --         [vim.diagnostic.severity.INFO] = '󰋽 ',
    --         [vim.diagnostic.severity.HINT] = '󰌶 ',
    --     },
    -- },
    virtual_text = false,
    virtual_lines = false,
    -- {
    --     -- Only show virtual line diagnostics for the current cursor line
    --     current_line = true,
    -- },

}

local function setup_lspconfig()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            -- NOTE: Remember that Lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end

            -- Jump to the definition of the word under your cursor.
            --  This is where a variable was first declared, or where a function is defined, etc.
            --  To jump back, press <C-t>.
            map("gd", Snacks.picker.lsp_definitions, "[G]oto [D]efinition")

            -- Find references for the word under your cursor.
            map("grr", Snacks.picker.lsp_references, "[G]oto [R]eferences")

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map("gri", Snacks.picker.lsp_implementations, "[G]oto [I]mplementation")

            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map("grd", Snacks.picker.lsp_declarations, "[G]oto [D]eclaration")

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map("grt", Snacks.picker.lsp_type_definitions, "[G]oto [T]ype Definition")

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map('gO', Snacks.picker.lsp_symbols, 'Open Document Symbols')

            -- Fuzzy find all the symbols in your current workspace.
            --  Similar to document symbols, except searches over your entire project.
            map('gW', Snacks.picker.lsp_workspace_symbols, 'Open Workspace Symbols')

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map("<space><enter>", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })


            map("\\d", vim.diagnostic.open_float, "Hover")

            -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
            ---@param client vim.lsp.Client
            ---@param method vim.lsp.protocol.Method
            ---@param bufnr? integer some lsp support methods only in specific files
            ---@return boolean
            local function client_supports_method(client, method, bufnr)
                if vim.fn.has "nvim-0.11" == 1 then
                    return client:supports_method(method, bufnr)
                else
                    return client.supports_method(method, { bufnr = bufnr })
                end
            end

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if
                client
                and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
            then
                local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })

                vim.api.nvim_create_autocmd("LspDetach", {
                    group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                    callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
                    end,
                })
            end

            -- The following code creates a keymap to toggle inlay hints in your
            -- code, if the language server you are using supports them
            --
            -- This may be unwanted, since they displace some of your code
            if
                client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
            then
                map("<leader>th", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                end, "[T]oggle Inlay [H]ints")
            end
        end,
    })

    local installed_servers = require("mason-lspconfig").get_installed_servers()
    for _, server in pairs(installed_servers) do
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local opts = {
            capabilities = capabilities,
        }

        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
    end

    vim.api.nvim_create_user_command("LspLog", function()
        local path = vim.lsp.get_log_path()
        vim.cmd("tabedit " .. path)
    end, { force = true, nargs = 0 })
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = {
                        -- lsps
                        "html",
                        "cssls",
                        "tailwindcss",
                        "vtsls",
                        -- "eslint",
                        "lua_ls",
                        "gopls",
                        "pylsp",
                        "pyright",
                    },
                    automatic_enable = false,
                },
            },
            -- Useful status updates for LSP.
            { "j-hui/fidget.nvim", opts = {} },
            -- Allows extra capabilities provided by blink.cmp
            "saghen/blink.cmp",
        },
        config = setup_lspconfig,
    },
    { -- Autocompletion
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        dependencies = {
            -- Snippet Engine
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = "make install_jsregexp",
                dependencies = {
                    -- `friendly-snippets` contains a variety of premade snippets.
                    --    See the README about individual language/framework/plugin snippets:
                    --    https://github.com/rafamadriz/friendly-snippets
                    {
                        "rafamadriz/friendly-snippets",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load {
                                paths = {
                                    vim.fn.stdpath "config" .. "/snippets",
                                    vim.fn.stdpath "data" .. "/lazy/friendly-snippets",
                                },
                            }
                        end,
                    },
                },
                opts = {},
            },
            "folke/lazydev.nvim",
        },
        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {
            keymap = {
                -- 'default' (recommended) for mappings similar to built-in completions
                --   <c-y> to accept ([y]es) the completion.
                --    This will auto-import if your LSP supports it.
                --    This will expand snippets if the LSP sent a snippet.
                -- 'super-tab' for tab to accept
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- For an understanding of why the 'default' preset is recommended,
                -- you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                --
                -- All presets have the following mappings:
                -- <tab>/<s-tab>: move to right/left of your snippet expansion
                -- <c-space>: Open menu or open docs if already open
                -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
                -- <c-e>: Hide menu
                -- <c-k>: Toggle signature help
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                preset = "none",

                -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            },

            enabled = function()
                return not vim.tbl_contains({ "markdown", "help", "minifiles", "snacks_picker_input" }, vim.bo.filetype)
            end,

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            completion = {
                -- By default, you may press `<c-space>` to show the documentation.
                -- Optionally, set `auto_show = true` to show the documentation after a delay.
                documentation = { auto_show = false, auto_show_delay_ms = 500 },
            },

            sources = {
                default = { "lsp", "path", "snippets", "lazydev" },
                providers = {
                    lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
                },
            },

            snippets = { preset = "luasnip" },

            -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
            -- which automatically downloads a prebuilt binary when enabled.
            --
            -- By default, we use the Lua implementation instead, but you may enable
            -- the rust implementation via `'prefer_rust_with_warning'`
            --
            -- See :h blink-cmp-config-fuzzy for more information
            fuzzy = { implementation = "lua" },

            -- Shows a signature help window while you type arguments for a function
            signature = { enabled = true },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            -- Event to trigger linters
            events = { "BufWritePost", "BufReadPost", "InsertLeave" },
            linters_by_ft = {
                javascript = { "oxlint" },
                typescript = { "oxlint" },
                python = { "ruff" },
                -- Use the "*" filetype to run linters on all filetypes.
                ["*"] = { "typos" },
                -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
                -- ['_'] = { 'fallback linter' },
            },
            -- LazyVim extension to easily override linter options
            -- or add custom linters.
            ---@type table<string,table>
            linters = {
                -- -- Example of using selene only when a selene.toml file is present
                -- selene = {
                --   -- `condition` is another LazyVim extension that allows you to
                --   -- dynamically enable/disable linters based on the context.
                --   condition = function(ctx)
                --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
                --   end,
                -- },
            },
        },
        config = function(_, opts)
            local M = {}

            local lint = require "lint"
            for name, linter in pairs(opts.linters) do
                if type(linter) == "table" and type(lint.linters[name]) == "table" then
                    lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
                    if type(linter.prepend_args) == "table" then
                        lint.linters[name].args = lint.linters[name].args or {}
                        vim.list_extend(lint.linters[name].args, linter.prepend_args)
                    end
                else
                    lint.linters[name] = linter
                end
            end
            lint.linters_by_ft = opts.linters_by_ft

            function M.debounce(ms, fn)
                local timer = vim.uv.new_timer()
                return function(...)
                    local argv = { ... }
                    timer:start(ms, 0, function()
                        timer:stop()
                        vim.schedule_wrap(fn)(unpack(argv))
                    end)
                end
            end

            function M.lint()
                -- Use nvim-lint's logic first:
                -- * checks if linters exist for the full filetype first
                -- * otherwise will split filetype by "." and add all those linters
                -- * this differs from conform.nvim which only uses the first filetype that has a formatter
                local names = lint._resolve_linter_by_ft(vim.bo.filetype)

                -- Create a copy of the names table to avoid modifying the original.
                names = vim.list_extend({}, names)

                -- Add fallback linters.
                if #names == 0 then
                    vim.list_extend(names, lint.linters_by_ft["_"] or {})
                end

                -- Add global linters.
                vim.list_extend(names, lint.linters_by_ft["*"] or {})

                -- Filter out linters that don't exist or don't match the condition.
                local ctx = { filename = vim.api.nvim_buf_get_name(0) }
                ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
                names = vim.tbl_filter(function(name)
                    local linter = lint.linters[name]
                    if not linter then
                        vim.notify("Linter not found: " .. name, vim.log.levels.WARN)
                    end
                    return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
                end, names)

                -- Run linters.
                if #names > 0 then
                    lint.try_lint(names)
                end
            end

            vim.api.nvim_create_autocmd(opts.events, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = M.debounce(100, M.lint),
            })
        end,
    },
    { -- Autoformat
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format { async = true, lsp_format = "fallback" }
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                return nil
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                -- local disable_filetypes = { c = true, cpp = true }
                -- if disable_filetypes[vim.bo[bufnr].filetype] then
                --     return nil
                -- else
                --     return {
                --         timeout_ms = 500,
                --         lsp_format = "fallback",
                --     }
                -- end
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    },
}
