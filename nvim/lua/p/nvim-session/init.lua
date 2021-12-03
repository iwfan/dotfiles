local M = {}

local rootFolder = string.match(vim.loop.cwd(), "[^%/]+$")

M.setup = function()
    require("auto-session").setup {
        log_level = "info",
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
        auto_session_enabled = false,
        auto_save_enabled = true,
        auto_restore_enabled = nil,
        auto_session_suppress_dirs = nil,
    }
end

M.save = function()
    print "Saving session..."
    vim.notify("Saving session... " .. rootFolder)
end

M.restore = function()
    print "Restore session..."
    vim.notify("Restore session... " .. rootFolder)
end

return M
