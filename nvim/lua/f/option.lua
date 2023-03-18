-- Disable Built-in Function {{{
-- https://github.com/mhinz/vim-galore#standard-plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zipPlugin = 1
-- }}}

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
vim.opt.completeopt = "menuone,noselect"
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
vim.opt.shortmess:append "sI"
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
vim.opt.showbreak = "↪ "
vim.opt.list = true
vim.opt.listchars = {
    tab = " ",
    trail = "·",
    extends = "",
    precedes = "",
    nbsp = "␣",
}
vim.opt.fillchars = {
    eob = " ",
    diff = " ",
    fold = " ",
    foldclose = "",
    foldopen = "",
}

-- spell check
-- vim.opt.spell = true
vim.opt.spelllang = "en,en_us,cjk"
vim.opt.spelloptions = "camel"
-- }}}
