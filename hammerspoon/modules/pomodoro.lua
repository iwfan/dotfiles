--[[

pomodoro.lua

A simple timer that is displayed on the status bar :)

]]--


local NOTIFICATION_TITLE = "Pomodoro Timer"

local menu = hs.menubar.new()
local time = 0

-- Function declarations
local updateTimer, resume, pause, cancel, begin, initTimer, notify, start

notify = function(title, info)
    hs.notify.new({title=title, informativeText=info}):send()
end

updateTimer = function()
    local min = time // 60
    local sec = time % 60
    local disp = string.format ("🍅 %02d:%02d ", min, sec)

    time = time - 1

    menu:setTitle(disp)

    if time == 0 then
        cancel()
        notify(NOTIFICATION_TITLE, "Time's up!")
    end
end

resume = function()
    watch:start()
    menu:setMenu({{title="Pause", fn=pause}, {title="Cancel", fn=cancel}})
end

pause = function()
    watch:stop()
    menu:setMenu({{title="Resume", fn=resume}, {title="Cancel", fn=cancel}})
end

cancel = function()
    if watch ~= nil then
        watch:stop()
        watch = nil
        time = nil
        initTimer()
    end
end

begin = function()
    notify(NOTIFICATION_TITLE, "Starting timer!")

    time = 25 * 60

    menu:setMenu({{title="Pause", fn=pause}, {title="Cancel", fn=cancel}})

    if watch == nil then
        watch = hs.timer.new(1, updateTimer)
    end

    watch:start()
end

initTimer = function()
    menu:setTitle("🍅")
    menu:setMenu({{title="Start", fn=begin}})
end

initTimer()

start = function()
    if watch == nil then
        begin()
    elseif watch:running() then
        pause()
    else
        resume()
    end
end


hs.hotkey.bind(leader, "t", start)
hs.hotkey.bind({ "alt", "shift" }, "t", cancel)
