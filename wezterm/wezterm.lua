local wezterm = require "wezterm"

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
    color_scheme = "Gruvbox Dark",
    font = wezterm.font_with_fallback {
        "Cascadia Code PL",
        "IBM Plex Mono",
        "JetBrains Mono",
        "Fira Code",
        "DengXian",
    },
    font_size = 14,
    line_height = 1.15,
    window_padding = {
        left = "1cell",
        right = "1cell",
        top = "0",
        bottom = "0",
    },
    window_close_confirmation = "AlwaysPrompt",
    use_fancy_tab_bar = false,
    keys = {
        {
            key = "D",
            mods = "CMD",
            action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
        },
        {
            key = "D",
            mods = "CMD|SHIFT",
            action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
        },
        { key = "Enter", mods = "CMD", action = "QuickSelect" },
    },
}
