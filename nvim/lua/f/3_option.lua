-- Options {{{
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.timeoutlen = 800
vim.opt.updatetime = 1000
vim.opt.lazyredraw = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.inccommand = "split"
vim.opt.jumpoptions = "stack"
vim.opt.switchbuf = { "useopen", "uselast" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.pumheight = 20
vim.opt.wildignorecase = true
vim.opt.wildignore = "*node_modules/**"

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
vim.opt.infercase = true
vim.opt.showmatch = true
vim.opt.matchpairs:append "<:>"
vim.opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]

-- line break
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "+1"
vim.opt.virtualedit = "block"
vim.opt.showbreak = "↪ "
vim.opt.linebreak = true
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
}
vim.opt.shortmess:append "csI"
vim.opt.diffopt:append { "hiddenoff", "algorithm:minimal" }
vim.opt.formatoptions = vim.opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- }}}
