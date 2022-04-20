local signs = { Error = FONT_ICON.error, Warn = FONT_ICON.warn, Hint = FONT_ICON.hint, Info = FONT_ICON.info }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    virtual_text = true,
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- Jump directly to the first available definition every time.
vim.lsp.handlers["textDocument/definition"] = function(_, result)
    if not result or vim.tbl_isempty(result) then
        print "[LSP] Could not find definition"
        return
    end

    if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1], "utf-8")
    else
        vim.lsp.util.jump_to_location(result, "utf-8")
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.handlers["textDocument/publishDiagnostics"],
    {
        signs = {
            severity_limit = "Error",
        },
        underline = {
            severity_limit = "Warning",
        },
        virtual_text = true,
    }
)

function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("tabedit " .. path)
end

vim.cmd "command! -nargs=0 LspLog call v:lua.open_lsp_log()"
