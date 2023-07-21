-- Options {{{
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 600
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.virtualedit = "block"
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes"
vim.opt.shortmess:append({ W = true, I = true, C = true, c = true })
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
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
vim.opt.showbreak = "↪ "
vim.opt.list = true
vim.opt.listchars = {
    tab = " ",
    trail = "•",
    extends = "",
    precedes = "",
    nbsp = "⦸",
}
vim.opt.fillchars = {
    eob = " ",
    diff = " ",
    fold = " ",
    foldclose = "",
    foldopen = "",
    -- foldclose = " ",
}

-- spell check
-- vim.opt.spell = true
vim.opt.spelllang = "en,en_us,cjk"
vim.opt.spelloptions = "camel"
-- }}}
