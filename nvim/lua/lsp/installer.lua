local lsp_installer = require "nvim-lsp-installer"
local lsp_installer_servers = require "nvim-lsp-installer.servers"

local server_opts = {
    cssls = require "lsp.servers.css",
    -- eslint = require "lsp.servers.eslint",
    gopls = require "lsp.servers.go",
    html = require "lsp.servers.html",
    jsonls = require "lsp.servers.json",
    sumneko_lua = require "lsp.servers.luals",
    tailwindcss = require "lsp.servers.tailwind",
    tsserver = require "lsp.servers.typescript",
}

for server_name in pairs(server_opts) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        if not server:is_installed() then
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    local opts = {
        on_attach = require "lsp.enhance_attach",
        capabilities = capabilities,
    }

    server:setup(server_opts[server.name] and server_opts[server.name](opts) or opts)
end)
