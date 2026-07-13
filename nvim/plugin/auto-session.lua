-- ============================================================================
-- auto-session — automatic session management
-- ============================================================================

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        require("auto-session").setup {
            log_level = "error",
            auto_session_suppress_dirs = {
                "~/",
                "~/Downloads",
                vim.fn.has('win32') == 1 and "C:\\" or "/",
            },
        }
    end,
})
