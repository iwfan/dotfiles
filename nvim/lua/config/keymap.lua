-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better up/down
vim.keymap.set("n", "k", [[(v:count == 0 ? 'gk' : 'k')]], { expr = true, silent = true })
vim.keymap.set("n", "j", [[(v:count == 0 ? 'gj' : 'j')]], { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Emacs-like keybinding for insert mode
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Jump to first non-blank character of current line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Jump to last non-blank character of current line" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move backward" })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move forward" })
vim.keymap.set("i", "<C-p>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-n>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-h>", "<BS>", { desc = "Backspace" })
vim.keymap.set("i", "<C-d>", "<Del>", { desc = "Delete" })
vim.keymap.set("i", "<C-v>", "<C-r>*", { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-k>", '<C-o>"_d$', { desc = "Kill characters after cusor" })
vim.keymap.set("i", "<C-z>", "<C-o><Cmd>undo<CR>", { desc = "Kill characters after cusor" })
vim.keymap.set("i", "<S-Tab>", "<BS>", { desc = "Backspace" })
vim.keymap.set(
    "i",
    "<C-l>",
    [[(&spell == 0 ? '' : '<c-g>u<Esc>[s1z=`]a<c-g>u')]],
    { expr = true, desc = "Spelling correction" }
)
vim.keymap.set("i", "<C-s>", "<c-g>u<C-o><Cmd>w<CR><ESC>", { desc = "Save file" })
-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Emacs-like keybinding for command-line mode
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Jump to line start" })
vim.keymap.set("c", "<C-e>", "<End>", { desc = "Jump to line end" })
vim.keymap.set("c", "<C-h>", "<BS>", { desc = "Backspace" })
vim.keymap.set("c", "<C-d>", "<Del>", { desc = "Delete" })
vim.keymap.set("c", "<C-v>", "<C-r>*", { desc = "Paste from system clipboard" })

-- Emacs-like keybinding for normal mode
-- for short finger
vim.keymap.set({ "n", "v", "o" }, "H", "_")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR><ESC>", { desc = "Save file" })

-- Move line Up / Down
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- window management
vim.keymap.set("n", "<C-h>", [[<c-w>h]])
vim.keymap.set("n", "<C-l>", [[<c-w>l]])
vim.keymap.set("n", "<C-j>", [[<c-w>j]])
vim.keymap.set("n", "<C-k>", [[<c-w>k]])
vim.keymap.set("t", "<C-H>", [[<c-\><c-n><c-w>h]])
vim.keymap.set("t", "<C-L>", [[<c-\><c-n><c-w>l]])
vim.keymap.set("t", "<C-J>", [[<c-\><c-n><c-w>j]])
vim.keymap.set("t", "<C-K>", [[<c-\><c-n><c-w>k]])
vim.keymap.set("t", "<C-]>", [[<C-\><C-n>]])

-- 获取操作系统类型
local is_windows = vim.fn.has "win32" == 1
local is_unix = vim.fn.has "unix" == 1

-- 根据操作系统设置终端命令
local shell_cmd
if is_windows then
    shell_cmd = "pwsh" -- Windows 上使用 PowerShell
elseif is_unix then
    shell_cmd = "$SHELL" -- Linux/macOS 上使用默认 Shell
else
    shell_cmd = "$SHELL" -- 其他情况使用默认 Shell
end

-- 垂直分割窗口并打开终端，宽度为 50 列
vim.keymap.set("n", "<C-w>t", function()
    vim.cmd("50vsplit term://" .. shell_cmd)
end, { noremap = true, silent = true })

-- 水平分割窗口并打开终端，高度为 20 行
vim.keymap.set("n", "<C-w>b", function()
    vim.cmd("20split term://" .. shell_cmd)
end, { noremap = true, silent = true })

vim.keymap.set("n", "<A-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- misc
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "gq", "<Nop>", { desc = "Do not open operation mode" })
vim.keymap.set("n", "gQ", "Q", { desc = "Do not open Ex mode" })
vim.keymap.set("n", "<esc>", "<esc><Cmd>noh<CR><Cmd>call feedkeys(':','nx')<CR>", { desc = "Clear all" })
vim.keymap.set("x", "p", [[p:let @+=@0<CR>:let @"=@0<CR>]], { desc = "Dont copy replaced text" })
vim.keymap.set("n", "qr", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<space><bs>", [["_dd]])
vim.keymap.set("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[", { silent = true })
vim.keymap.set("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>", { silent = true })

vim.keymap.set("n", "<C-q>", "<Nop>")
vim.keymap.set("n", "<C-y>", "<Nop>")
vim.keymap.set("n", "<C-t>", "<Nop>")
vim.keymap.set("n", "<C-;>", ":echo 1<cr>")
vim.keymap.set("n", "<C-'>", ":echo 2<cr>")
vim.keymap.set("n", "<C-,>", ":echo 3<cr>")
vim.keymap.set("n", "<C-.>", ":echo 4<cr>")
