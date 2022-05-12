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
            vim.lsp.buf.formatting_seq_sync(nil, 1000)
        end,
    })
end

return function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        buf_autocmd_document_highlight()
    end

    if client.resolved_capabilities.document_formatting then
        buf_autocmd_document_formatting()
    end

    -- Mappings.
    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gx", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space><enter>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("v", "<space><enter>", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

    buf_set_keymap("n", "\\d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "[D", "<cmd>lua vim.diagnostic.goto_prev({severity_limit = 'Error'})<CR>", opts)
    buf_set_keymap("n", "]D", "<cmd>lua vim.diagnostic.goto_next({severity_limit = 'Error'})<CR>", opts)

    buf_set_keymap("n", "<c-s>", "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 2000)<CR><cmd>w<CR>", opts)
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, { desc = "Format file with LSP" })
end
