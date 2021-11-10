-- Environment
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/local/bin/python3"

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- Disable built-in plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

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
vim.opt.shortmess:append { c = true }
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
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
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
