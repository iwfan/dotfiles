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
            map("grr", Snacks.picker.lsp_references, "[G]oto [R]references")

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
            map("gO", Snacks.picker.lsp_symbols, "Open Document Symbols")

            -- Fuzzy find all the symbols in your current workspace.
            --  Similar to document symbols, except searches over your entire project.
            map("gW", Snacks.picker.lsp_workspace_symbols, "Open Workspace Symbols")

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map("<space><enter>", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

            map("\\d", vim.diagnostic.open_float, "Hover")
        end,
    })

    local installed_servers = {
        lua_ls = {
            -- cmd = { ... },
            -- filetypes = { ... },
            -- capabilities = {},
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                    -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                    -- diagnostics = { disable = { 'missing-fields' } },
                },
            },
        },
        cssls = {},
        html = {},
        gopls = {},
        basedpyright = {},
        tailwindcss = {},
        vtsls = {},
    }

    for server, server_opts in pairs(installed_servers) do
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local opts = {
            capabilities = capabilities,
        }

        vim.lsp.config(server, vim.tbl_extend("force", server_opts, opts))
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
                        "html",
                        "cssls",
                        "tailwindcss",
                        "vtsls",
                        "lua_ls",
                        "gopls",
                        "pyright",
                    },
                    automatic_enable = false,
                },
            },
            -- Allows extra capabilities provided by blink.cmp
            "saghen/blink.cmp",
        },
        config = setup_lspconfig,
    },
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
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
        },
        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Tab>'] = {
                    function(cmp)
                        if cmp.snippet_active() then return cmp.accept()
                        else return cmp.select_and_accept() end
                    end,
                    'snippet_forward',
                    'fallback'
                },
            },

            enabled = function()
                return not vim.tbl_contains({ "markdown", "help", "minifiles", "snacks_picker_input" }, vim.bo.filetype)
            end,

            snippets = { preset = "luasnip" },
        },
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufWritePost", "InsertLeave" },
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
                go = { "goimports", "gofmt" },
                python = { "ruff_format" },
                -- Use the "*" filetype to run formatters on all filetypes.
                ["*"] = { "typos" },
                -- Use the "_" filetype to run formatters on filetypes that don't
                -- have other formatters configured.
                ["_"] = { "trim_whitespace" },
            },
        },
    },
    { "nvim-flutter/flutter-tools.nvim", opts = {}, ft = { "dart" } },
}
