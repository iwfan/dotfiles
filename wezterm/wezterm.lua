local wezterm = require "wezterm"

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
    color_scheme = "GitHub Dark",
    font = wezterm.font_with_fallback {
        "Cascadia Code PL",
        "JetBrains Mono",
        "PingFang SC",
        "IBM Plex Mono",
        "Fira Code",
    },
    font_size = 14,
    line_height = 1.2,
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
        { key = "[", mods = "CMD", action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "]", mods = "CMD", action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "Enter", mods = "CMD", action = "QuickSelect" },
    },
}
