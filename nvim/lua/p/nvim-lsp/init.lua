local lsp_installer = require "nvim-lsp-installer"
local enhance_attach = require "p.nvim-lsp.enhance_attach"
local capabilities = require "p.nvim-lsp.capabilities"
local setup_sumneko_lua = require "p.nvim-lsp.servers-conf.sumneko_lua"
local setup_diagnosticls = require "p.nvim-lsp.servers-conf.diagnosticls"
local setup_tsserver = require "p.nvim-lsp.servers-conf.tsserver"

local M = {}

local function setup_handlers()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            spacing = 5,
            prefix = "",
        },
        signs = false, -- rely on highlight styles instead, don't want to clobber signcolumn
    })
end

M.setup = function()
    setup_handlers()
    vim.cmd [[command! LspLog tabnew|lua vim.cmd('e'..vim.lsp.get_log_path()) ]]

    lsp_installer.settings {
        log_level = vim.log.levels.DEBUG,
    }

    lsp_installer.on_server_ready(function(server)
        local default_opts = {
            on_attach = enhance_attach,
            capabilities = capabilities.create {
                with_snippet_support = server.name ~= "eslintls",
            },
        }

        local server_opts = {
            ["tsserver"] = setup_tsserver,
            ["eslintls"] = function()
                default_opts.settings = {
                    format = { enable = true },
                }
                return default_opts
            end,
            ["diagnosticls"] = setup_diagnosticls,
            ["sumneko_lua"] = setup_sumneko_lua,
            ["gopls"] = function()
                default_opt.init_options = { usePlaceholders = true, completeUnimported = true }
            end,
        }

        server:setup(server_opts[server.name] and server_opts[server.name](default_opts) or default_opts)
        vim.cmd [[ do User LspAttachBuffers ]]
    end)
end

return M
