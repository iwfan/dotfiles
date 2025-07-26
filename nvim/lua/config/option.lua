-- Make line numbers default
vim.opt.number = true

-- You can also add relative line numbers, to help with jumping.
-- Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Diasbale default ruler
vim.opt.ruler = false

-- Save undo history
vim.opt.undofile = true

-- Don't create swap file
vim.opt.swapfile = false

-- Enable auto write
vim.opt.autowrite = true

-- Get alert when quit on an unsaved buffer
vim.opt.confirm = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Always showtabline
vim.opt.showtabline = 2

-- Global statusline
vim.opt.laststatus = 3

-- Highlight column after 'textwidth'
vim.opt.colorcolumn = "+1"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Don't wrap long line
vim.opt.wrap = false

-- Enable break indent
vim.opt.breakindent = true

-- Enable smart indent
vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = { eob = " ", diff = "╱" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'nosplit'

--
vim.opt.jumpoptions = 'view'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"

-- Configure auto-complete window height & opacity
vim.opt.pumheight = 20
vim.opt.pumblend = 10
vim.opt.winblend = 10

-- Enable Spell check
vim.opt.spelllang = { "en" }

-- Misc options
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append({ W = true, I = true, C = true, c = true })

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


vim.wo.foldmethod = 'expr'
vim.wo.foldlevel = 999
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
