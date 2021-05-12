local nvim_lsp = require("lspconfig")
local set_lsp_config = require("lsp/set_config")

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {
  cmd = {
    "node",
    stdpath ..
      "/lspinstall/html" .. "/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
    "--stdio"
  },
  filetypes = {
    -- html
    "aspnetcorerazor",
    "blade",
    "django-html",
    "edge",
    "ejs",
    "erb",
    "gohtml",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "html-eex",
    "jade",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    -- mixed
    "vue",
    "svelte"
  },
  root_dir = require "lspconfig".util.root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    provideFormatter = false
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client, bufnr)
  end,
  capabilities = capabilities
}
