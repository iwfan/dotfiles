-- Disable Built-in Function {{{
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_spec = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
-- }}}

-- Options {{{
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.autowrite = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 10
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.pumheight = 20
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- tabs & indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.matchpairs:append "<:>"

-- line break
vim.opt.signcolumn = "yes"
vim.opt.virtualedit = "block"
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
    fold = " ",
    eob = " ",
    diff = " ",
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
}
-- }}}
