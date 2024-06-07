-- Options {{{
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "+1"
vim.opt.shortmess:append({ W = true, I = true, C = true, c = true })
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.pumheight = 20
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.fillchars = {
    eob = " ",
    diff = " ",
}

-- spell check
-- vim.opt.spell = true
vim.opt.spelllang = "en,en_us,cjk"
vim.opt.spelloptions = "camel"
-- }}}
