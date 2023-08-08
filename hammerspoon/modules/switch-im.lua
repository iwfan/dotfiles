-- local function Chinese()
--     local current_source_id = hs.keycodes.currentSourceID()
--     local shuangpin_source_id = "com.apple.inputmethod.SCIM.Shuangpin"
--
--     if current_source_id ~= shuangpin_source_id then
--         hs.keycodes.currentSourceID(shuangpin_source_id)
--     end
-- end
--
-- local function English()
--     local current_source_id = hs.keycodes.currentSourceID()
--     local abc_source_id = "com.apple.keylayout.ABC"
--
--     if current_source_id ~= abc_source_id then
--         hs.keycodes.currentSourceID(abc_source_id)
--     end
-- end
--
-- local app_with_im = {
--     { "/Applications/kitty.app", "English" },
--     { "/Applications/iTerm.app", "English" },
--     { "/Applications/Visual Studio Code.app", "English" },
--     { "/Applications/Xcode.app", "English" },
--     { "/Applications/Google Chrome.app", "English" },
--     { "/System/Library/CoreServices/Finder.app", "English" },
--     { "/Applications/System Preferences.app", "English" },
-- }
--
-- function updateFocusAppInputMethod()
--     local ime = "English"
--     local focusAppPath = hs.window.frontmostWindow():application():path()
--     for index, app in pairs(app_with_im) do
--         local appPath = app[1]
--         local expectedIme = app[2]
--
--         if focusAppPath == appPath then
--             ime = expectedIme
--             break
--         end
--     end
--
--     if ime == "English" then
--         English()
--     else
--         Chinese()
--     end
-- end

-- hs.hotkey.bind({ "ctrl", "cmd" }, ".", function()
--     hs.alert.show(
--         "App path:        "
--             .. hs.window.focusedWindow():application():path()
--             .. "\n"
--             .. "App name:      "
--             .. hs.window.focusedWindow():application():name()
--             .. "\n"
--             .. "IM source id:  "
--             .. hs.keycodes.currentSourceID()
--     )
-- end)

_G.appWatcher = hs.application.watcher.new(function(appName, eventType)
    if eventType == hs.application.watcher.activated or eventType == hs.application.watcher.launched then
        local current_source_id = hs.keycodes.currentSourceID()
        local squirrel = "im.rime.inputmethod.Squirrel.Hans"

        if current_source_id ~= squirrel then
            hs.keycodes.currentSourceID(squirrel)
        end
    end
end)
_G.appWatcher:start()
