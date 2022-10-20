local set_saga_keymap = require "lsp.lsp_saga"

local function buf_autocmd_document_highlight(bufnr)
    local LspDocumentHighlightGroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
        group = LspDocumentHighlightGroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.document_highlight()
        end,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        group = LspDocumentHighlightGroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.clear_references()
        end,
    })
end

local function buf_autocmd_document_formatting(bufnr)
    vim.api.nvim_create_user_command("F", vim.lsp.buf.formatting, { force = true, nargs = 0 })

    local LspDocumentFormattingGroup = vim.api.nvim_create_augroup("LspDocumentFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = LspDocumentFormattingGroup,
        buffer = bufnr,
        callback = vim.lsp.buf.formatting,
    })
end

return function(client, bufnr)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        buf_autocmd_document_highlight(bufnr)
    end

    if client.server_capabilities.document_formatting then
        buf_autocmd_document_formatting(bufnr)
    end

    set_saga_keymap(bufnr)
end
