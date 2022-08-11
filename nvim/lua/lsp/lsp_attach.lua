local set_saga_keymap = require "lsp.lsp_saga"
local lsp_status = require "lsp-status"

local function buf_autocmd_document_highlight()
    local LspDocumentHighlightGroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
        group = LspDocumentHighlightGroup,
        buffer = 0,
        callback = function()
            vim.lsp.buf.document_highlight()
        end,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        group = LspDocumentHighlightGroup,
        buffer = 0,
        callback = function()
            vim.lsp.buf.clear_references()
        end,
    })
end

local function buf_autocmd_document_formatting()
    local LspDocumentFormattingGroup = vim.api.nvim_create_augroup("LspDocumentFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = LspDocumentFormattingGroup,
        buffer = 0,
        callback = function()
            -- 0.7
            vim.lsp.buf.formatting_sync(nil, 2000) -- 2 seconds

            -- 0.8
            -- vim.lsp.buf.format { timeout_ms = 2000 }
        end,
    })
end

return function(client, bufnr)
    lsp_status.on_attach(client)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        buf_autocmd_document_highlight()
    end

    if client.resolved_capabilities.document_formatting then
        buf_autocmd_document_formatting()
    end

    set_saga_keymap(bufnr)
end
