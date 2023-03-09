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
require "f/autocmd"
require "f/command"

if vim.g.vscode then
    require "p/plugin-vscode"
    vim.keymap.set("n", "/", "<cmd>call VSCodeNotify('actions.find', { 'query': expand('<cword>')})<CR>")
    vim.keymap.set("n", "?", "<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>")


    vim.keymap.set("n", "<C-n>", "<cmd>call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>")
    vim.keymap.set("v", "<C-n>", "<cmd>call VSCodeNotifyVisual('editor.action.addSelectionToNextFindMatch', 1)<CR>")


    vim.keymap.set("n", "[c", "<cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")
    vim.keymap.set("n", "]c", "<cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")
    vim.keymap.set("n", "\\c", "<cmd>call VSCodeNotify('editor.action.dirtydiff.next')<CR>")


    vim.keymap.set("n", "gr", "<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>")

    vim.keymap.set("n", "[s", "<cmd>call VSCodeNotify('bookmarks.jumpToPrevious')<CR>")
    vim.keymap.set("n", "]s", "<cmd>call VSCodeNotify('bookmarks.jumpToNext')<CR>")
    vim.keymap.set("n", "m", "<cmd>call VSCodeNotify('bookmarks.toggleLabeled')<CR>")
    vim.keymap.set("n", "<space>m", "<cmd>call VSCodeNotify('bookmarks.list')<CR>")
else
    require "p/plugin"
end
