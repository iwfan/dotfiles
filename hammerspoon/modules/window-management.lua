hs.loadSpoon "WinWin"

-- stylua: ignore start
local KEY_BINDINGS = {
    { HYPER, "r", "撤销", function() spoon.WinWin:undo "" end, false, },
    { HYPER, "h", "左半屏", function() spoon.WinWin:moveAndResize "halfleft" end, false, },
    { HYPER, "l", "右半屏", function() spoon.WinWin:moveAndResize "halfright" end, false, },
    { HYPER, "u", "屏幕左上角", function() spoon.WinWin:moveAndResize "cornerNW" end, false, },
    { HYPER, "i", "屏幕左下角", function() spoon.WinWin:moveAndResize "cornerSW" end, false, },
    { HYPER, "o", "屏幕右下角", function() spoon.WinWin:moveAndResize "cornerSE" end, false, },
    { HYPER, "p", "屏幕右上角", function() spoon.WinWin:moveAndResize "cornerNE" end, false, },
    { HYPER, "m", "最大化", function() spoon.WinWin:moveAndResize "maximize" end, false, },
    { HYPER, "=", "窗口放大", function() spoon.WinWin:moveAndResize "expand" end, false, },
    { HYPER, "-", "窗口缩小", function() spoon.WinWin:moveAndResize "shrink" end, false, },
    { HYPER, "left", "向左缩放", function() spoon.WinWin:stepResize "left" end, true, },
    { HYPER, "right", "向右缩放", function() spoon.WinWin:stepResize "right" end, true, },
    { HYPER, "up", "向上缩放", function() spoon.WinWin:stepResize "up" end, true, },
    { HYPER, "down", "向下缩放", function() spoon.WinWin:stepResize "down" end, true, },
    { HYPER_PLUS, "left", "向左移动", function() spoon.WinWin:moveToScreen "left" end, false, },
    { HYPER_PLUS, "right", "向右移动", function() spoon.WinWin:moveToScreen "right" end, false, },
    { HYPER_PLUS, "up", "向上移动", function() spoon.WinWin:moveToScreen "up" end, false, },
    { HYPER_PLUS, "down", "向下移动", function() spoon.WinWin:moveToScreen "down" end, false, },
    { HYPER, "c", "居中", function() spoon.WinWin:moveAndResize "center" end, false, },
    { HYPER, "f", "全屏", function()
        local win = hs.window.focusedWindow()
        win:toggleFullScreen()
    end, false, },
    { HYPER_PLUS, "h", "左侧40%", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w * 0.4
        f.h = max.h
        win:setFrame(f)
    end, false, },
    { HYPER_PLUS, "l", "右侧60%", function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w * 0.4)
        f.y = max.y
        f.w = max.w * 0.6
        f.h = max.h
        win:setFrame(f)
    end, false, },
}
-- stylua: ignore end

for _, mapping in ipairs(KEY_BINDINGS) do
    local modifier, trigger, title, winFunction, isRepeatable = table.unpack(mapping)
    hs.hotkey.bind(modifier, trigger, title, winFunction, nil, isRepeatable and winFunction or nil)
end
