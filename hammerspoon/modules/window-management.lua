-- 键位配置
local window_management_keymapping = {
  title     = '🪟 窗口管理',
  modifiers = leader,
  trigger   = 'w',
  mappings  = {
    { '退出',           {},                'ESCAPE', 'exit'        },
    { '退出',           {},                'Q',      'exit'        },
    { '键位提示',       {},                '/',      'cheatsheet'  },
    { '左半屏',         {},                'H',      'halfleft'    },
    { '右半屏',         {},                'L',      'halfright'   },
    { '上半屏',         {},                'K',      'halfup'      },
    { '下半屏',         {},                'J',      'halfdown'    },
    { '左侧40%',        {'shift'},         'H',      'left40'      },
    { '右侧60%',        {'shift'},         'L',      'right60'     },
    { '屏幕左上角',     {'ctrl'},          'H',      'cornerNW'    },
    { '屏幕右上角',     {'ctrl'},          'L',      'cornerNE'    },
    { '屏幕左下角',     {'ctrl'},          'J',      'cornerSW'    },
    { '屏幕右下角',     {'ctrl'},          'K',      'cornerSE'    },
    { '向左收缩窗口',   {'ctrl', 'shift'}, 'H',      'leftResize'  },
    { '向右收缩窗口',   {'ctrl', 'shift'}, 'L',      'rightResize' },
    { '向上收缩窗口',   {'ctrl', 'shift'}, 'K',      'upResize'    },
    { '向下收缩窗口',   {'ctrl', 'shift'}, 'J',      'downResize'  },
    { '向左移动',       {},                'LEFT',   'moveLeft'    },
    { '向右移动',       {},                'RIGHT',  'moveRight'   },
    { '向上移动',       {},                'UP',     'moveUp'      },
    { '向下移动',       {},                'DOWN',   'moveDown'    },
    { '移动到左侧屏幕', {'shift'},         'LEFT',   'screenLeft'  },
    { '移动到右侧屏幕', {'shift'},         'RIGHT',  'screenRight' },
    { '移动到下侧屏幕', {'shift'},         'UP',     'screenUp'    },
    { '移动到上侧屏幕', {'shift'},         'DOWN',   'screenDown'  },
    { '移动到下个屏幕', {'shift'},         'SPACE',  'screenNext'  },
    { '窗口放大',       {},                '=',      'expand'      },
    { '窗口缩小',       {},                '-',      'shrink'      },
    { '撤销',           {},                'U',      'undo'        },
    { '全屏',           {},                'F',      'fullscreen'  },
    { '居中',           {},                'C',      'center'      },
  }
}

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

local function getFullscreenFrame(currentWin)
    return currentWin:screen():frame()
end

local function getCenterFrame(currentWin)
    local centerFrame = currentWin:frame()

    local fullscreenFrame = getFullscreenFrame(currentWin)
    centerFrame.w = fullscreenFrame.w * 4 / 5
    centerFrame.h = fullscreenFrame.h * 4 / 5
    centerFrame.x = fullscreenFrame.x + (fullscreenFrame.w - centerFrame.w) / 2
    centerFrame.y = fullscreenFrame.y + (fullscreenFrame.h - centerFrame.h) / 2
    return centerFrame
end

local function toggleFullAndCenter(currentWin)
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

if spoon.WinWin then
    spoon.ModalMgr:new("window_management")
    local cmodal        = spoon.ModalMgr.modal_list["window_management"]
    local modal_title   = window_management_keymapping.title
    local modifiers     = window_management_keymapping.modifiers
    local modal_trigger = window_management_keymapping.trigger
    local mappings      = window_management_keymapping.mappings

    local window = {
        exit        = function() spoon.ModalMgr:deactivate({"window_management"}) end,
        cheatsheet  = function() spoon.ModalMgr:toggleCheatsheet() end,
        halfleft    = function() spoon.WinWin:moveAndResize("halfleft") end,
        halfright   = function() spoon.WinWin:moveAndResize("halfright") end,
        halfup      = function() spoon.WinWin:moveAndResize("halfup") end,
        halfdown    = function() spoon.WinWin:moveAndResize("halfdown") end,
        cornerNW    = function() spoon.WinWin:moveAndResize("cornerNW") end,
        cornerNE    = function() spoon.WinWin:moveAndResize("cornerNE") end,
        cornerSW    = function() spoon.WinWin:moveAndResize("cornerSW") end,
        cornerSE    = function() spoon.WinWin:moveAndResize("cornerSE") end,
        leftResize  = function() spoon.WinWin:stepResize("left") end,
        rightResize = function() spoon.WinWin:stepResize("right") end,
        upResize    = function() spoon.WinWin:stepResize("up") end,
        downResize  = function() spoon.WinWin:stepResize("down") end,
        moveLeft    = function() spoon.WinWin:stepMove("left") end,
        moveRight   = function() spoon.WinWin:stepMove("right") end,
        moveUp      = function() spoon.WinWin:stepMove("up") end,
        moveDown    = function() spoon.WinWin:stepMove("down") end,
        screenLeft  = function() spoon.WinWin:moveToScreen("left") end,
        screenRight = function() spoon.WinWin:moveToScreen("right") end,
        screenUp    = function() spoon.WinWin:moveToScreen("up") end,
        screenDown  = function() spoon.WinWin:moveToScreen("down") end,
        screenNext  = function() spoon.WinWin:moveToScreen("next") end,
        expand      = function() spoon.WinWin:moveAndResize("expand") end,
        shrink      = function() spoon.WinWin:moveAndResize("shrink") end,
        undo        = function() spoon.WinWin:undo() end,
        fullscreen  = function() spoon.WinWin:moveAndResize("fullscreen") end,
        center      = function()
            local win = hs.window.focusedWindow()
            win:setFrame(toggleFullAndCenter(win))
        end,
        left40      = function()
            local win = hs.window.focusedWindow()
            local f = win:frame()
            local screen = win:screen()
            local max = screen:frame()

            f.x = max.x
            f.y = max.y
            f.w = max.w * 0.4
            f.h = max.h
            win:setFrame(f)
        end,
        right60     = function()
            local win = hs.window.focusedWindow()
            local f = win:frame()
            local screen = win:screen()
            local max = screen:frame()

            f.x = max.x + (max.w * 0.4)
            f.y = max.y
            f.w = max.w * 0.6
            f.h = max.h
            win:setFrame(f)
        end
    }

    for _, mapping in ipairs(mappings) do
        local title, modifier, trigger, winFunction = table.unpack(mapping)
        local repeatableFunction = {
            "leftResize", "rightResize", "upResize", "downResize",
            "moveLeft", "moveRight", "moveUp", "moveDown"
        }

        if hs.fnutils.contains(repeatableFunction, winFunction) then
            cmodal:bind(modifier, trigger, title, window[winFunction], nil, window[winFunction])
        else
            cmodal:bind(modifier, trigger, title, window[winFunction])
            -- cmodal:bind(modifier, trigger, title, window[winFunction], window['exit'])
        end
    end

    -- 定义窗口管理模式快捷键
    spoon.ModalMgr.supervisor:bind(modifiers, modal_trigger, modal_title, function()
        spoon.ModalMgr:deactivateAll()
        -- 显示状态指示器，方便查看所处模式
        spoon.ModalMgr:activate({"window_management"}, "#ff0000")
    end)
end
