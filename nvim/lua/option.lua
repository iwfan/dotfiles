local function disable_distribution_plugins()
  g.loaded_gzip              = 1
  g.loaded_tar               = 1
  g.loaded_tarPlugin         = 1
  g.loaded_zip               = 1
  g.loaded_zipPlugin         = 1
  g.loaded_getscript         = 1
  g.loaded_getscriptPlugin   = 1
  g.loaded_vimball           = 1
  g.loaded_vimballPlugin     = 1
  g.loaded_matchit           = 1
  g.loaded_matchparen        = 1
  g.loaded_2html_plugin      = 1
  g.loaded_logiPat           = 1
  g.loaded_rrhelper          = 1
  g.loaded_netrw             = 1
  g.loaded_netrwPlugin       = 1
  g.loaded_netrwSettings     = 1
  g.loaded_netrwFileHandlers = 1
end

local function setup_options()
  local general_options = {
    encoding     = "utf-8",
    fileencoding = "utf-8",
    fileformats  = "unix,mac,dos",
    timeout      = true,
    ttimeout     = true,
    timeoutlen   = 500,
    ttimeoutlen  = 10,
    updatetime   = 100,
    redrawtime   = 1500,
    autowrite    = true,
    autowriteall = true,
    backup       = false,
    writebackup  = false,
    swapfile     = false,
    undofile     = true,
    backupskip   = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    shada        = "!,'300,<50,@100,s10,h",
    history      = 2000,
    clipboard    = "unnamedplus",
    mouse        = "nv",
    magic        = true,
    exrc         = true,
    secure       = true,
    errorbells   = true,
    visualbell   = true
  }

  local behavior_options = {
    background     = 'dark',
    termguicolors  = true,
    relativenumber = true,
    number         = true,
    cursorline     = true,
    showmode       = false,
    showcmd        = false,
    showtabline    = 2,
    -- Always show the signcolumn, otherwise it would shift the text each time
    signcolumn     = "yes",
    scrolloff      = 5,
    sidescrolloff  = 5,
    virtualedit    = "block",
    conceallevel   = 2,
    concealcursor  = "niv",
    splitbelow     = true,
    splitright     = true,
    -- Tabs And Indent
    tabstop        = 2,
    softtabstop    = -1,
    shiftwidth     = 2,
    expandtab      = true,
    smartindent    = true,
    shiftround     = true,
    -- Search
    ignorecase     = true,
    smartcase      = true,
    infercase      = true,
    incsearch      = true,
    hlsearch       = true,
    -- Line break
    colorcolumn    = "+1",
    textwidth      = 100,
    wrap           = false,
    whichwrap      = "h,l,<,>,[,],~",
    linebreak      = true,
    showbreak      = "↪ ",
    breakat        = [[\ \	;:,!?]],
    breakindentopt = "shift:2,min:20",
    list           = true,
    listchars      = "tab:»·,trail:·,extends:→,precedes:←,nbsp:␣",
    -- do not show ~ before empty lines at the end of a buffer
    fillchars      = "fold:-,eob: ",
    wildignorecase = true,
    wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,\z
                      *.zip,**/tmp/**,*.DS_Store,**/node_modules/**",
    pumblend       = 10,
    winblend       = 10,
    pumheight      = 20,
    hidden         = true,
    switchbuf      = "useopen,vsplit",
    completeopt    = "menuone,noselect",
    -- inccommand     = "nosplit",
    grepprg        = "rg --hidden --vimgrep --smart-case --",
    jumpoptions    = "stack",
    viewoptions    = "folds,cursor,curdir,slash,unix",
    sessionoptions = "curdir,help,tabpages,winsize",
    foldlevelstart = 99
  }

  local options_table = vim.tbl_extend("force", general_options, behavior_options)

  for key, value in pairs(options_table) do
    opt(key, value)
  end
end

disable_distribution_plugins()
setup_options()
