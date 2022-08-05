local signs = { Error = FONT_ICON.error, Warn = FONT_ICON.warn, Hint = FONT_ICON.hint, Info = FONT_ICON.info }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    underline = true,
    virtual_text = {
        prefix = "",
        format = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return "  " .. diagnostic.message
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                return "  " .. diagnostic.message
            end
            return nil
        end,
    },

    signs = {
        severity = vim.diagnostic.severity.ERROR,
    },
    float = { severity_sort = true },
    update_in_insert = true,
    severity_sort = true,
}

vim.api.nvim_create_user_command("LspLog", function()
    local path = vim.lsp.get_log_path()
    vim.cmd("tabedit " .. path)
end, { force = true, nargs = 0 })
