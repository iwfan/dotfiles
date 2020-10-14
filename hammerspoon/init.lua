-- https://github.com/wangshub/hammerspoon-config
require "clipboard.clipboard"

local config = require "config"

-- Logger
local logger = hs.logger.new('eventtap', 'debug')

-- Auto reload config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config reloaded")

-- Hints
hs.hints.style="vimperator"
hs.hints.fontName="Source Code Pro Medium"
hs.hints.fontSize=20
hs.hotkey.bind({"alt",}, '\\', function()
    -- API: hs.hints.windowHints([windows, callback, allowNonStandard])
    hs.hints.windowHints(nil, nil, false)
end)

-- Window resizing
hs.hotkey.bind({"cmd", "alt",}, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "j", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + max.h / 2
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "f9", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 2 / 3
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "f10", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local width = max.w * 2 / 3
  f.x = max.x + (max.w - width)
  f.y = max.y
  f.w = width
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "f11", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt",}, "f12", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local width = max.w / 3
  f.x = max.x + (max.w - width)
  f.y = max.y
  f.w = width
  f.h = max.h
  win:setFrame(f)
end)

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
    if not (
            (frame.w < fullScreenFrame.w + 10 and frame.w >= fullScreenFrame.w - 10) or 
            (frame.h < fullScreenFrame.h + 10 and frame.h >= fullScreenFrame.h - 10) or 
            (frame.x == fullScreenFrame.x) or
            (frame.y == fullScreenFrame.y)
        )then
        return getFullscreenFrame(currentWin)
    else
        return getCenterFrame(currentWin)
    end
end

-- Toggle full screen between window-center
hs.hotkey.bind({"cmd", "alt",}, "c", function()
  local win = hs.window.focusedWindow()
  win:setFrame(toggleFullAndCenter(win))
end)

-- move a window to other screen
hs.hotkey.bind({"cmd", "alt",}, "left", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
end) 
hs.hotkey.bind({"cmd", "alt",}, "right", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
end) 

-- find the mouse
function mouseHighlight()
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    mousepoint = hs.mouse.getRelativePosition()
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    mouseCircleTimer = hs.timer.doAfter(0.3, function() mouseCircle:delete() end)
end

-- move mouse though windows
eventtapOneClick = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown}, function(e)
    -- logger.d(e:getProperty(hs.eventtap.event.properties["mouseEventClickState"]))
    b_fn = hs.eventtap.checkKeyboardModifiers()["fn"]
    if b_fn and e:getProperty(hs.eventtap.event.properties["mouseEventClickState"]) == 1 then
        local win = hs.window.focusedWindow()
        local frame = win:frame()

        local target = {}
        target.x = frame.x + frame.w / 2
        target.y = frame.y + frame.h / 2
        -- logger.d(target.x, target.y)
        -- logger.d(frame.x, frame.y)
        hs.mouse.setAbsolutePosition(target)

        mouseHighlight()
        return true
    else
        return false
    end
end)
eventtapOneClick:start()

-- -- interactive window resize
-- hs.grid.setGrid('7x5', nil, nil)
-- hs.grid.setMargins({0, 0})
-- hs.hotkey.bind({"shift",}, 'space', function()
--     hs.grid.show()
-- end)


REPEAT_DELAY = 200

-- Delete a word before the cursor
fn_delete_a_word = function()
    hs.eventtap.keyStroke('{"alt", }', 'delete', REPEAT_DELAY)
end
bn_delete_a_word = hs.hotkey.bind('{"ctrl",}', 'w', fn_delete_a_word, nil, fn_delete_a_wold)

function enableBinds()
    bn_delete_a_word:enable()
    bn_up:enable()
    bn_down:enable()
    bn_left:enable()
    bn_right:enable()
    bn_esc:enable()
end
function disableBinds()
    bn_delete_a_word:disable()
    bn_up:disable()
    bn_down:disable()
    bn_left:disable()
    bn_right:disable()
    bn_esc:disable()
end

local wf = hs.window.filter

wf_vim = wf.new({'MacVim', 'iTerm2'})
wf_vim:subscribe(wf.windowFocused, disableBinds)
wf_vim:subscribe(wf.windowUnfocused, enableBinds)


-- TODO: Check-> Warning:   wfilter: No accessibility access to app GoldenDict (no watcher pid)
-- all_wf = wf.new(true)
-- all_wf:subscribe(wf.windowFocused, function(win, name, en) logger.d(win, name) end)

-- Map ctrl + [ to escape
fn_escape = function()
    hs.eventtap.keyStroke(nil, 'escape')
end
bn_esc = hs.hotkey.bind('{"ctrl",}', '[', fn_escape, nil, fn_escape)

-- simulate vim mode
-- fn_left = function()
--     hs.eventtap.keyStroke(nil, 'left', REPEAT_DELAY)
-- end
-- bn_left = hs.hotkey.bind('{"ctrl",}', 'h', fn_left, nil, fn_left)

-- fn_down = function()
--     hs.eventtap.keyStroke(nil, 'down', REPEAT_DELAY)
-- end
-- bn_down = hs.hotkey.bind('{"ctrl",}', 'j', fn_down, nil, fn_down)

-- fn_up = function()
--     hs.eventtap.keyStroke(nil, 'up', REPEAT_DELAY)
-- end
-- bn_up = hs.hotkey.bind('{"ctrl",}', 'k', fn_up, nil, fn_up)

-- fn_right = function()
--     hs.eventtap.keyStroke(nil, 'right', REPEAT_DELAY)
-- end
-- bn_right = hs.hotkey.bind('{"ctrl",}', 'l', fn_right, nil, fn_right)

-- Inspired by Linux alt-drag or Better Touch Tools move/resize functionality
-- from https://gist.github.com/kizzx2/e542fa74b80b7563045a
-- Command-shift-move: move window under mouse
-- Alt-Shift-move: resize window under mouse
function get_window_under_mouse()
   local my_pos = hs.geometry.new(hs.mouse.getAbsolutePosition())
   local my_screen = hs.mouse.getCurrentScreen()
   return hs.fnutils.find(hs.window.orderedWindows(), function(w)
                             return my_screen == w:screen() and
                                w:isStandard() and
                                (not w:isFullScreen()) and
                                my_pos:inside(w:frame())
   end)
end

dragging = {}                   -- global variable to hold the dragging/resizing state

drag_event = hs.eventtap.new({ hs.eventtap.event.types.mouseMoved }, function(e)
      if not dragging then return nil end
      if dragging.mode==3 then -- just move
         local dx = e:getProperty(hs.eventtap.event.properties.mouseEventDeltaX)
         local dy = e:getProperty(hs.eventtap.event.properties.mouseEventDeltaY)
         dragging.win:move({dx, dy}, nil, false, 0)
      else -- resize
         local pos=hs.mouse.getAbsolutePosition()
         local w1 = dragging.size.w + (pos.x-dragging.off.x)
         local h1 = dragging.size.h + (pos.y-dragging.off.y)
         dragging.win:setSize(w1, h1)
      end
end)

flags_event = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(e)
      local flags = e:getFlags()
      local mode=(flags.shift and 1 or 0) + (flags.cmd and 2 or 0) + (flags.alt and 4 or 0)
      if mode==3 or mode==5 then -- valid modes
         if dragging then
            if dragging.mode == mode then return nil end -- already working
         else
            -- only update window if we hadn't started dragging/resizing already
            dragging={win = get_window_under_mouse()}
            if not dragging.win then -- no good window
               dragging=nil
               return nil
            end
         end
         dragging.mode = mode   -- 3=drag, 5=resize
         if mode==5 then
            dragging.off=hs.mouse.getAbsolutePosition()
            dragging.size=dragging.win:size()
         end
         drag_event:start()
      else                      -- not a valid mode
         if dragging then
            drag_event:stop()
            dragging = nil
         end
      end
      return nil
end)
--flags_event:start()

function connect_tw_vpn(region)

  hs.execute("killall 'Cisco AnyConnect Secure Mobility Client'", true)

  local username = config.username
  local password = config.password
  local secret_key = config.secret_key
  local connection_adress = string.format("%s.vpn.thoughtworks.com", region)
  local authentication_method_index = "2"

  local command_of_get_code = string.format("oathtool --totp -b %s", secret_key)
  local code = hs.execute(command_of_get_code, true)
  local user_info = string.format("printf '%s\n%s\n%s\n%s\n'", username, password, authentication_method_index, code)
  local connection_info = string.format("/opt/cisco/anyconnect/bin/vpn -s connect %s", connection_adress)

  hs.execute("/opt/cisco/anyconnect/bin/vpn disconnect", true)
  hs.execute(user_info .. " | " .. connection_info, true)
  hs.execute("open -g '/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app'", true)
end

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "v", function()
  hs.execute("say 'Ready to connect'")
  connect_tw_vpn("xdc")
  hs.alert.show("Xian VPN successful connection")
  hs.execute("say 'Xian VPN successful connection'")
end)
