-- Environment
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/local/bin/python3"

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

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

-- behavior opt
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = false
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.virtualedit = "block"
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.joinspaces = false
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10
vim.opt.foldlevelstart = 99
vim.opt.inccommand = "nosplit"
vim.opt.updatetime = 300
vim.opt.redrawtime = 1500
vim.opt.shortmess:append "casI" -- disable intro
vim.opt.jumpoptions = "stack"

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
vim.opt.grepprg = "rg --vimgrep --no-heading --hidden"

-- line break
vim.opt.colorcolumn = "+1"
vim.opt.wrap = false
vim.opt.whichwrap:append "<>hl" -- clean aligned wraps
vim.opt.showbreak = "↪ "
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }

vim.opt.list = true
vim.opt.listchars = {
    tab = " ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "␣",
}
vim.opt.fillchars = { fold = "", eob = " " }
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.pumheight = 20
vim.opt.hidden = true
vim.opt.switchbuf = { "useopen", "vsplit" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.wildignorecase = true
vim.opt.wildignore = {
    ".git",
    ".hg",
    ".svn",
    "*.pyc",
    "*.o",
    "*.out",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.zip",
    "**/tmp/**",
    "*.DS_Store",
    "**/node_modules/**",
}
vim.opt.sessionoptions:append { "options", "resize", "winpos", "terminal" }

-- autocmd
vim.cmd "au BufEnter * set formatoptions-=cro formatoptions+=j1"
