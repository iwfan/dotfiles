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
vim.opt.signcolumn = "yes"
vim.opt.virtualedit = "block"
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.joinspaces = false
vim.opt.inccommand = "split"
vim.opt.jumpoptions = "stack"
vim.opt.hidden = true
vim.opt.switchbuf = { "useopen", "uselast" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }

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
vim.opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }

-- line break
vim.opt.colorcolumn = "+1"
vim.opt.wrap = false
vim.opt.whichwrap:append "<>hl"
vim.opt.showbreak = "↪ "
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }

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
}
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.pumheight = 20
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
vim.opt.shortmess = {
    t = true, -- truncate file messages at start
    A = true, -- ignore annoying swap file messages
    o = true, -- file-read message overwrites previous
    O = true, -- file-read message overwrites previous
    T = true, -- truncate non-file messages in middle
    f = true, -- (file x of x) instead of just (x of x
    F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
    s = true,
    c = true,
    W = true, -- Don't show [w] or written when writing
}
vim.opt.sessionoptions:append { "options", "resize", "winpos", "terminal" }
vim.opt.formatoptions = {
    ["1"] = true,
    ["2"] = true, -- Use indent from 2nd line of a paragraph
    q = true, -- continue comments with gq"
    c = true, -- Auto-wrap comments using textwidth
    r = true, -- Continue comments when pressing Enter
    n = true, -- Recognize numbered lists
    t = false, -- autowrap lines using text width value
    j = true, -- remove a comment leader when joining lines.
    -- Only break if the line was not longer than 'textwidth' when the insert
    -- started and only at a white character that has been entered during the
    -- current insert command.
    l = true,
    v = true,
}

vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
