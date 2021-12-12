local signs = { Error = font_icon.error, Warn = font_icon.warn, Hint = font_icon.hint, Info = font_icon.info }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        spacing = 5,
        prefix = "",
    },
    signs = false, -- rely on highlight styles instead, don't want to clobber signcolumn
    underline = true,
    update_in_insert = false, -- update diagnostics insert mode
})
