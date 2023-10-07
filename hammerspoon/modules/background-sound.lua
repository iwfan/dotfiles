_G.is_bg_sound_playing = false

hs.hotkey.bind(HYPER, "b", function ()
    _G.is_bg_sound_playing = not _G.is_bg_sound_playing

    -- @see https://www.reddit.com/r/shortcuts/comments/yjlbi8/comment/j5kez7c/?utm_source=share&utm_medium=web2x&context=3
    hs.execute(string.format([[
        defaults write com.apple.ComfortSounds "comfortSoundsEnabled" -bool "%s"
        launchctl kill SIGHUP gui/501/com.apple.accessibility.heard
    ]], _G.is_bg_sound_playing))

    hs.alert.show(_G.is_bg_sound_playing and "Turn on Background Sound" or "Turn off Background Sound")
end)
