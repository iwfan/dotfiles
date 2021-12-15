local signs = { Error = font_icon.error, Warn = font_icon.warn, Hint = " ", Info = font_icon.info }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.fn.sign_define("LightBulbSign", { text = "💡" })

function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("tabedit " .. path)
end

vim.cmd "command! -nargs=0 LspLog call v:lua.open_lsp_log()"
