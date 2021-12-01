-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1
-- avoid stupid menu.vim (saves ~100ms)
vim.g.did_install_default_menus = 1

-- Options

-- general opt
vim.opt.fileformats = "unix,mac,dos"
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.errorbells = true
vim.opt.visualbell = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10
vim.opt.redrawtime = 1500

-- behavior opt
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = false
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.joinspaces = false
vim.opt.jumpoptions = "stack"
vim.opt.hidden = true
vim.opt.switchbuf = { "useopen", "uselast" }
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.pumheight = 20
vim.opt.wildignorecase = true

-- tabs & indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.showmatch = true
vim.opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
vim.opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]

-- line break
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "+1"
vim.opt.virtualedit = "block"
vim.opt.wrap = false
vim.opt.whichwrap:append "<>hl"
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
    diff = "╱",
}
-- disable nvim intro
vim.opt.shortmess:append "sI"
vim.opt.sessionoptions:append { "options", "resize", "winpos", "terminal" }

vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"