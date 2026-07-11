-- Visual Multi
vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
    ["Exit"] = "<Esc>",
    ["Find Under"] = "<C-n>",
    ["Find Subword Under"] = "<C-n>",
    ["Add Cursor Down"] = "<A-n>",
    ["Add Cursor Up"] = "<A-p>",
}

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd "nvim-treesitter"
            end
            vim.cmd "TSUpdate"
        end
    end,
})

vim.pack.add {
    -- Core
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/neovim/nvim-lspconfig", version = "master" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/mg979/vim-visual-multi", version = "master" },
}

-- Diagnostic Config
vim.diagnostic.config {
    severity_sort = true,
    float = { severity_sort = true, border = "rounded", source = "if_many" },
    underline = true,
    signs = false,
    virtual_text = false,
    virtual_lines = false,
}

local function setup_lspconfig()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            vim.bo[event.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.name == "mini.snippets" then
                return
            end

            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end

            -- FzfLua picker mappings
            -- local fzf = require "fzf-lua"
            -- map("gd", fzf.lsp_definitions, "[G]oto [D]definition")
            -- map("grr", fzf.lsp_references, "[G]oto [R]references")
            -- map("gri", fzf.lsp_implementations, "[G]oto [I]mplementation")
            -- map("grd", fzf.lsp_declarations, "[G]oto [D]eclaration")
            -- map("grt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")
            -- map("gO", fzf.lsp_document_symbols, "Open Document Symbols")
            -- map("gW", fzf.lsp_live_workspace_symbols, "Open Workspace Symbols")
            --
            -- map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
            -- map("<space><enter>", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
            -- map("\\d", vim.diagnostic.open_float, "Hover")
        end,
    })

    local vue_language_server_path = vim.fn.stdpath "data"
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
    }
    local vtsls_config = {
        settings = {
            vtsls = {
                tsserver = {
                    globalPlugins = {
                        vue_plugin,
                    },
                },
            },
        },
        filetypes = tsserver_filetypes,
    }

    local installed_servers = {
        lua_ls = {
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        },
        cssls = {},
        html = {},
        gopls = {},
        astro = {},
        basedpyright = {},
        tailwindcss = {},
        vue_ls = {},
        vtsls = vtsls_config,
    }

    for server, server_opts in pairs(installed_servers) do
        local capabilities = require("mini.completion").get_lsp_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }
        local opts = {
            capabilities = capabilities,
        }

        vim.lsp.config(server, vim.tbl_extend("force", server_opts, opts))
        vim.lsp.enable(server)
    end
end

-- Plugin Setup
require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

require("mason-lspconfig").setup {
    ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "vtsls",
        "lua_ls",
        "gopls",
        "basedpyright",
    },
}

require("lazydev").setup {
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

setup_lspconfig()

-- nvim-lint
local lint = require "lint"
lint.linters_by_ft = {
    javascript = { "biomejs" },
    typescript = { "biomejs" },
    javascriptreact = { "biomejs" },
    typescriptreact = { "biomejs" },
    python = { "ruff" },
    ["*"] = { "typos" },
}

local function debounce(ms, fn)
    local timer = vim.uv.new_timer()
    return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
        end)
    end
end

local function try_lint()
    local names = lint._resolve_linter_by_ft(vim.bo.filetype)
    names = vim.list_extend({}, names)
    if #names == 0 then
        vim.list_extend(names, lint.linters_by_ft["_"] or {})
    end
    vim.list_extend(names, lint.linters_by_ft["*"] or {})

    local ctx = { filename = vim.api.nvim_buf_get_name(0) }
    ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
    names = vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
    end, names)

    if #names > 0 then
        lint.try_lint(names)
    end
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
    callback = debounce(100, try_lint),
})

-- conform.nvim
require("conform").setup {
    notify_on_error = false,
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_format" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        ["*"] = { "typos" },
        ["_"] = { "trim_whitespace" },
    },
}

vim.keymap.set("", "<leader>f", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "[F]ormat buffer" })

-- treesitter-extra
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"
        end
    end,
})
