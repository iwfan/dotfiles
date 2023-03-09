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
-- Author:   Zi莱卷 <i.wangfancn@gmail.com>
-- Github:   https://github.com/iwfan/dotfiles

require "f/_global"
require "f/option"
require "f/keymap"

if vim.g.vscode then
    require "p/plugin-vscode"
else
    require "f/autocmd"
    require "f/command"
    require "p/plugin"
end
