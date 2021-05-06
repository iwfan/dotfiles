-- hs.hotkey.alertDuration = 0
-- hs.hints.showTitleThresh = 0
-- hs.window.animationDuration = 0

_G.config_path = os.getenv("HOME") .. "/.hammerspoon/"
_G.hyper = {"cmd", "ctrl", "shift"}

-- 定义默认加载的 Spoons
hspoon_list = {
    "ModalMgr",
    "ClipShow", -- 剪切板
    "WinWin", -- 窗口管理
}

-- 加载 Spoons
for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

require('modules/config-reload')
-- require('modules/app-hints')
-- require('modules/network')
require('modules/window-manager')
-- require('modules/clipboard')
-- require('modules/pomodoro')spoon.ModalMgr.supervisor:enter()
-- require('modules.markdown')


spoon.ModalMgr.supervisor:enter()
