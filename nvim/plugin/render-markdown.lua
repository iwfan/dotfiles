-- ============================================================================
-- render-markdown.nvim — live markdown rendering in-buffer
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    once = true,
    callback = function()
        require("render-markdown").setup {}
    end,
})
