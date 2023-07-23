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
    vim.api.nvim_create_user_command("Format", function()
        vim.lsp.buf.format({ async = true })
    end, { force = true, nargs = 0 })

    -- local LspDocumentFormattingGroup = vim.api.nvim_create_augroup("LspDocumentFormatting", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = LspDocumentFormattingGroup,
    --     buffer = bufnr,
    --     callback = function()
    --         vim.lsp.buf.format { timeout_ms = 250 }
    --     end,
    -- })
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

    local bufopts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references theme=ivy<cr>", bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

    vim.keymap.set("n", "<M-r>", vim.lsp.buf.rename, bufopts)

    vim.keymap.set("n", "\\d", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[D", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]D", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "[d", function()
        local prev_diagnostic = vim.diagnostic.get_prev { severity = vim.diagnostic.severity.ERROR }
        if prev_diagnostic ~= nil then
            vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
        else
            vim.diagnostic.goto_prev()
        end
    end, bufopts)
    vim.keymap.set("n", "]d", function()
        local next_diagnostic = vim.diagnostic.get_next { severity = vim.diagnostic.severity.ERROR }
        if next_diagnostic ~= nil then
            vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
        else
            vim.diagnostic.goto_next()
        end
    end, bufopts)

    vim.keymap.set({ "n", "v" }, "<space><enter>", vim.lsp.buf.code_action, bufopts)
end
