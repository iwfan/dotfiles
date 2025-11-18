-- === 外观设置 ===
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.number = true                              -- Line numbers
vim.opt.numberwidth = 2
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.showtabline = 1                            -- Show tabline only if there are at least two tab pages
vim.opt.laststatus = 3                             -- Global statusline
vim.opt.cursorline = true                          -- Highlight current line
vim.opt.cursorlineopt = "number"
vim.opt.ruler = false                              -- Disable default ruler
vim.opt.signcolumn = "yes"                         -- Always show sign column
vim.opt.colorcolumn = "+1"                         -- Highlight column after 'textwidth'
vim.opt.showmode = false                           -- Don't show mode in command line
vim.opt.showmatch = true                           -- Highlight matching brackets
vim.opt.matchtime = 2                              -- How long to show matching bracket
vim.opt.winborder = 'rounded'

-- === 命令行和菜单 ===
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options

-- === 显示和滚动 ===
vim.opt.wrap = false                               -- Don't wrap long lines
vim.opt.linebreak = true                           -- Break lines at word boundaries
vim.opt.scrolloff = 10                             -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor

-- === 搜索设置 ===
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- Don't highlight search results
vim.opt.incsearch = true                           -- Show matches as you type

-- 使用 ripgrep 如果可用，否则回退到默认
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- === 缩进设置 ===
vim.opt.tabstop = 2                                -- Tab width
vim.opt.shiftwidth = 2                             -- Indent width
vim.opt.softtabstop = 2                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Copy indent from current line
vim.opt.breakindent = true                         -- Enable break indent
vim.opt.breakindentopt = 'shift:2,min:40,sbr'      -- Configure break indent


-- === 折叠设置 ===
vim.wo.foldmethod = 'expr'                         -- Use expression for folding
vim.wo.foldlevel = 999                             -- Start with all folds open
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folding

-- === 文件处理 ===
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save
vim.opt.backup = false                             -- Don't create backup files
vim.opt.writebackup = false                        -- Don't create backup before writing
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.undofile = true                            -- Persistent undo

-- === 性能和响应 ===
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration
vim.opt.ttimeoutlen = 0                            -- Key code timeout

-- === 行为设置 ===
vim.opt.inccommand = 'nosplit'                     -- Preview substitutions live
vim.opt.jumpoptions = "stack,view"                 -- Jump list behavior
vim.opt.virtualedit = 'block'                      -- Useful for block selections
vim.opt.splitright = true                          -- Configure how new splits should be opened
vim.opt.splitbelow = true                          -- Open horizontal splits below
vim.opt.splitkeep = "screen"                       -- Keep the same relative cursor position when splitting
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.selection = "exclusive"                    -- Selection behavior
vim.opt.mouse = "a"                                -- Enable mouse support
vim.opt.confirm = true                             -- Get alert when quit on an unsaved buffer
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"
vim.opt.shortmess:append("csI")                      -- Don't show completion messages
vim.opt.whichwrap:append("<>[]hl")

-- === 文件搜索和忽略 ===
vim.opt.path:append("**")                          -- Include subdirectories in search
vim.opt.wildignore:append {
  "*.o", "*.obj", "*.pyc", "*.pyo",               -- Compiled files
  "*.jpg", "*.png", "*.pdf", "*.gif",             -- Binary files
  "*/node_modules/*", "*/.git/*", "*/.venv/*",    -- Common directories
  "*/build/*", "*/dist/*", "*/.next/*",           -- Build directories
  "*/coverage/*", "*/target/*", "*/__pycache__/*" -- Cache directories
}

-- === 特殊字符显示 ===
vim.opt.list = true                                -- Show invisible characters
vim.opt.listchars = {
  tab = '» ',                                      -- Show tabs
  trail = '·',                                     -- Show trailing spaces
  nbsp = '⦸',                                      -- Show non-breaking spaces
  extends = '→',                                   -- Show when line extends beyond screen
  precedes = '←',                                  -- Show when line precedes screen
}
vim.opt.fillchars = {
  eob = " ",                                       -- Remove ~ at end of buffer
  diff = "╱"                                       -- Better diff separator
}

-- === 剪贴板设置 ===
-- SSH 环境检测，避免在远程环境中使用系统剪贴板
if not os.getenv("SSH_TTY") then
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)
end

vim.g.health = { style = 'float' }
-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
