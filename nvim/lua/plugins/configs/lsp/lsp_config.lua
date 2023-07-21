local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

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
                return "  " .. diagnostic.message
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                return "  " .. diagnostic.message
            end
            return nil
        end,
    },

    signs = {
        severity = vim.diagnostic.severity.ERROR,
    },
    float = { severity_sort = true, border = "rounded" },
    update_in_insert = true,
    severity_sort = true,
}

-- Jump directly to the first available definition every time.
vim.lsp.handlers["textDocument/definition"] = function(_, result)
    if not result or vim.tbl_isempty(result) then
        print "[LSP] Could not find definition"
        return
    end

    if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1], "utf-8", true)
    else
        vim.lsp.util.jump_to_location(result, "utf-8", true)
    end
end

vim.api.nvim_create_user_command("LspLog", function()
    local path = vim.lsp.get_log_path()
    vim.cmd("tabedit " .. path)
end, { force = true, nargs = 0 })
