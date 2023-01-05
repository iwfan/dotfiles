return function(on_attach, capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require("lspconfig").beancount.setup {
    init_options = {
      journal_file = "/Users/f/code/bookkeeping/main.bean",
    },
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
