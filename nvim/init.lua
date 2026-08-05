--
--       ▄▄        ▄▄
--     ▄████       ███▄                                            ▄▄
--   ▄ ▀█████▄     █████                                           ▀▀
--   ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄
--   ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██
--   ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██
--   ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██
--   ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀
--   ▀   ▐      ▀█████ █
--     ▀▄▐       ▀████
--       ▀         ▀
--
-- Author:   Zi莱卷 <iwfan@duck.com>
-- Github:   https://github.com/iwfan/dotfiles

pcall(function()
    require("vim._core.ui2").enable()
end)

require "config.options"
require "config.keymaps"
require "config.autocmds"
require "config.usercmds"
require "config.lazy"

require("modules.buffer-cleanup").setup()
