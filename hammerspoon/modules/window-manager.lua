-- Window resizing
hs.hotkey.bind(
    {"cmd", "alt"},
    "h",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    end
)

hs.hotkey.bind(
    {"cmd", "alt"},
    "l",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    end
)

hs.hotkey.bind(
    {"cmd", "alt"},
    "k",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h / 2
        win:setFrame(f)
    end
)

hs.hotkey.bind(
    {"cmd", "alt"},
    "j",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + max.h / 2
        f.w = max.w
        f.h = max.h / 2
        win:setFrame(f)
    end
)

function getFullscreenFrame(currentWin)
    return currentWin:screen():frame()
end

function getCenterFrame(currentWin)
    local centerFrame = currentWin:frame()

    local fullscreenFrame = getFullscreenFrame(currentWin)
    centerFrame.w = fullscreenFrame.w * 4 / 5
    centerFrame.h = fullscreenFrame.h * 4 / 5
    centerFrame.x = fullscreenFrame.x + (fullscreenFrame.w - centerFrame.w) / 2
    centerFrame.y = fullscreenFrame.y + (fullscreenFrame.h - centerFrame.h) / 2
    return centerFrame
end

function toggleFullAndCenter(currentWin)
    local frame = currentWin:frame()
    local fullScreenFrame = getFullscreenFrame(currentWin)
    if
    not ((frame.w < fullScreenFrame.w + 10 and frame.w >= fullScreenFrame.w - 10) or
        (frame.h < fullScreenFrame.h + 10 and frame.h >= fullScreenFrame.h - 10) or
        (frame.x == fullScreenFrame.x) or
        (frame.y == fullScreenFrame.y))
    then
        return getFullscreenFrame(currentWin)
    else
        return getCenterFrame(currentWin)
    end
end

-- Toggle full screen between window-center
hs.hotkey.bind(
    {"cmd", "alt"},
    "c",
    function()
        local win = hs.window.focusedWindow()
        win:setFrame(toggleFullAndCenter(win))
    end
)

-- move a window to other screen
hs.hotkey.bind(
    {"cmd", "alt"},
    "left",
    function()
        local win = hs.window.focusedWindow()
        win:moveOneScreenWest()
    end
)
hs.hotkey.bind(
    {"cmd", "alt"},
    "right",
    function()
        local win = hs.window.focusedWindow()
        win:moveOneScreenEast()
    end
)
