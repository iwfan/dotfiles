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
vim.o.autowrite = true
vim.o.autowriteall = true
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.showtabline = 2
vim.o.laststatus = 3
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.pumblend = 10
vim.o.winblend = 10
vim.o.pumheight = 20
vim.bo.swapfile = false
vim.bo.undofile = true
vim.wo.number = true

-- tabs & indent
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.wo.breakindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.bo.matchpairs = "(:),{:},[:],<:>"

-- line break
vim.wo.signcolumn = "yes"
vim.wo.virtualedit = "block"
vim.wo.showbreak = "↪ "
vim.wo.list = true
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
}

-- spell check
-- vim.opt.spell = true
vim.bo.spelllang = "en,en_us,cjk"
vim.bo.spelloptions = "camel"
-- }}}
