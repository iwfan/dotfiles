local tools = {}
local insert = _G.insert(tools)

insert({
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            log_level = "info",
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            auto_session_enabled = true,
            auto_save_enabled = nil,
            auto_restore_enabled = nil,
            auto_session_suppress_dirs = nil,
        })
    end,
})

insert({
    "editorconfig/editorconfig-vim",
    config = [[vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}]],
})

insert({
    "ybian/smartim",
    config = function()
        vim.g.smartim_default = "com.apple.keylayout.ABC"
    end,
})

insert({
    "voldikss/vim-translator",
    cmd = {
        "Translate",
        "TranslateW",
        "TranslateR",
        "TranslateX",
    },
})

return tools
