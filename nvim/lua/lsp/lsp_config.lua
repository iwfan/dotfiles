local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "None" })
end

function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("tabedit " .. path)
end

vim.cmd "command! -nargs=0 LspLog call v:lua.open_lsp_log()"
