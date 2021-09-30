local tools = {}
local insert = _G.insert(tools)

insert({
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            auto_session_enabled = false,
            auto_save_enabled = true,
            auto_restore_enabled = false,
        })
    end,
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
