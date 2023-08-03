--[[
Simulate Escape Key down when single Control key Release
--]]
_G.ESC_CTRL = {
    hasKeyDownEventAfterControlPressed = false,
    INNER_LISTENER = nil,
    KEYBOARD_LISTENER = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(e)
        local keyCode = e:getKeyCode()
        local whichFlags = e:getFlags()
        local count = 0
        hs.fnutils.each(whichFlags, function()
            count = count + 1
        end)

        if keyCode == 59 or keyCode == 62 then
            if count == 0 then
                if not _G.ESC_CTRL.hasKeyDownEventAfterControlPressed then
                    hs.eventtap.event.newKeyEvent(hs.keycodes.map.escape, true):post()
                end
            else
                _G.ESC_CTRL.hasKeyDownEventAfterControlPressed = false
                _G.ESC_CTRL.INNER_LISTENER = hs.eventtap
                    .new({ hs.eventtap.event.types.keyDown }, function()
                        _G.ESC_CTRL.hasKeyDownEventAfterControlPressed = true
                        _G.ESC_CTRL.INNER_LISTENER:stop()
                    end)
                    :start()
            end

            return keyCode == 62
        end
    end),
}

_G.ESC_CTRL.KEYBOARD_LISTENER:start()
