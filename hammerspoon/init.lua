_G.config_path = os.getenv "HOME" .. "/.config/hammerspoon/"
_G.hyper = { "cmd", "ctrl", "shift" }
_G.leader = { "alt" }

-- 定义默认加载的 Spoons
local hspoon_list = {
    "ModalMgr",
    "WinWin",
    "KSheet",
    "VolumeScroll",
}

-- 加载 Spoons
for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

require "modules.config-reload"
-- require "modules.window-management"
-- require "modules.clipboard"
-- require "modules.app-launcher"
-- require "modules.app-hints"
require "modules.switch-im"
require "modules.search-text"
-- require "modules.cheatsheet"
-- require "modules.pomodoro"
-- require "modules.markdown"

spoon.VolumeScroll:init()
spoon.VolumeScroll:start(leader)

spoon.ModalMgr.supervisor:bind(leader, "H", "查看 Hammerspoon 手册", function()
    hs.urlevent.openURL "https://www.hammerspoon.org/docs/"
end)
spoon.ModalMgr.supervisor:bind(leader, "Z", "Toggle Hammerspoon Console", function()
    hs.toggleConsole()
end)
spoon.ModalMgr.supervisor:enter()
