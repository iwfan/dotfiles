return function(opts)
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    opts.cmd = {'node', os.getenv('HOME') .. '/code/emmet-ls/out/server.js', '--stdio'}
    opts.filetypes = { "html", "css", "scss", "sass", "vue", "typescriptreact", "javascriptreact" }
    opts.settings = {
      html_filetypes = {'html', "typescriptreact", "javascriptreact" },
      css_filetypes = {'css','sass','scss'},
    }

    return opts
end
