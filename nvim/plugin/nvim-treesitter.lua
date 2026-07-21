-- ============================================================================
-- nvim-treesitter
-- ============================================================================

-- Use tree-sitter for indentation and folding on supported filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter-folding", { clear = true }),
    callback = function()
        if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"
        end
    end,
})
