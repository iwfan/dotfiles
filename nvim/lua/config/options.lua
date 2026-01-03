-- === 外观设置 ===
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes"                         -- Always show sign column
vim.opt.showmode = false                           -- Don't show mode in command line
vim.opt.ruler = false                           -- Don't show mode in command line

-- === 显示和滚动 ===
vim.opt.wrap = false                               -- Don't wrap long lines
vim.opt.scrolloff = 5                              -- Keep 5 lines above/below cursor
vim.opt.sidescrolloff = 5                          -- Keep 5 columns left/right of cursor

-- === 搜索设置 ===
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- Don't highlight search results
vim.opt.incsearch = true                           -- Show matches as you type

-- === 文件搜索和忽略 ===
vim.opt.path:append("**")                          -- Include subdirectories in search

-- 使用 ripgrep 如果可用，否则回退到默认
if vim.fn.executable('rg') == 1 then
    vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

vim.opt.wildmenu = true
vim.opt.wildmode="longest:full,full"
vim.opt.wildignore:append {
    "*.o", "*.obj", "*.pyc", "*.pyo",               -- Compiled files
    "*.jpg", "*.png", "*.pdf", "*.gif",             -- Binary files
    "*/node_modules/*", "*/.git/*", "*/.venv/*",    -- Common directories
    "*/build/*", "*/dist/*", "*/.next/*",           -- Build directories
    "*/coverage/*", "*/target/*", "*/__pycache__/*" -- Cache directories
}

-- === 缩进设置 ===
vim.opt.tabstop = 2                                -- Tab width
vim.opt.shiftwidth = 2                             -- Indent width
vim.opt.softtabstop = 2                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.autoindent = true                          -- Copy indent from current line

-- === 折叠设置 ===
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- 仅当 nvim-treesitter 可用且配置 foldexpr 时，才启用 expr 折叠
local has_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
if has_ts then
    -- treesitter 可用：使用 nvim-treesitter 的 foldexpr（更稳定）
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

-- === 文件处理 ===
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.undofile = true                            -- Persistent undo

-- === 性能和响应 ===
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration

-- === 行为设置 ===
vim.opt.confirm = true                             -- Get alert when quit on an unsaved buffer
vim.opt.splitright = true                          -- Configure how new splits should be opened
vim.opt.splitbelow = true                          -- Open horizontal splits below
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.splitkeep = "screen"                       -- Keep the same relative cursor position when splitting
vim.opt.jumpoptions = "stack,view"                 -- Jump list behavior
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.whichwrap:append("<>[]hl")

-- === 特殊字符显示 ===
vim.opt.list = true                                -- Show invisible characters
vim.opt.listchars = {
    tab      = "▸ ",                               -- tab: 用 ▸ 指示缩进方向
    trail    = "·",                                -- trailing space: 用点表示空格
    nbsp     = "⍽",                                -- non-breaking space: 用 ⍽ 表示特殊空格
    extends  = "»",                                -- 行右超出: 用 » 表示溢出
    precedes = "«",                                -- 行左超出: 用 « 表示溢出
}
vim.opt.fillchars = {
    eob = " ",                                     -- Remove ~ at end of buffer
    diff = " "                                     -- Better diff separator
}

-- === 剪贴板设置 ===
-- SSH 环境检测，避免在远程环境中使用系统剪贴板
if not os.getenv("SSH_TTY") then
    vim.schedule(function()
        vim.opt.clipboard = 'unnamedplus'
    end)
end

-- === 将 mason bin 添加到 PATH ===
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
local mason_bin = table.concat({vim.fn.stdpath("data"), "mason", "bin"}, sep)
if vim.fn.isdirectory(mason_bin) ~= 0 then
    vim.env.PATH = mason_bin .. delim .. vim.env.PATH
end
