local config = require 'config'
local helpers = require 'helpers'

local function setup_runtime_env()
  vim.g.python_host_prog  = config.python_host_prog
  vim.g.python3_host_prog = config.python3_host_prog
end

local function disable_distribution_plugins()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

local function setup_options()
  local general_options = {
    encoding       = "utf-8";
    fileencoding   = "utf-8";
    fileformats    = "unix,mac,dos";

    timeout        = true;
    ttimeout       = true;
    timeoutlen     = 500;
    ttimeoutlen    = 10;
    updatetime     = 100;
    redrawtime     = 1500;

    autowrite      = true;
    autowriteall   = true;

    backup         = false;
    writebackup    = false;
    swapfile       = false;
    undofile       = true;

    backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
    shada          = "!,'300,<50,@100,s10,h";
    history        = 2000;

    clipboard      = "unnamedplus";
    mouse          = "nv";
    magic          = true;
    confirm        = true;

    errorbells     = true;
    visualbell     = true;
  }

  local behavior_options = {
    termguicolors  = true;

    relativenumber = true;
    number         = true;
    cursorline     = true;
    showmode       = false;
    showcmd        = false;
    showtabline    = 2;

    -- Always show the signcolumn, otherwise it would shift the text each time
    signcolumn     = "yes";
    scrolloff      = 5;
    sidescrolloff  = 5;

    virtualedit    = "block";
    conceallevel   = 2;
    concealcursor  = "niv";

    splitbelow     = true;
    splitright     = true;

    -- Tabs And Indent
    tabstop        = 2;
    softtabstop    = -1;
    shiftwidth     = 2;
    smarttab       = true;
    expandtab      = true;
    smartindent    = true;
    autoindent     = true;
    shiftround     = true;

    -- Search
    ignorecase     = true;
    smartcase      = true;
    infercase      = true;
    incsearch      = true;
    hlsearch       = true;

    -- Line break
    colorcolumn    = "+1";
    textwidth      = 100;
    wrap           = false;
    whichwrap      = "h,l,<,>,[,],~";
    linebreak      = true;
    showbreak      = "↪ ";
    breakat        = [[\ \	;:,!?]];
    breakindentopt = "shift:2,min:20";

    list           = true;
    listchars      = "tab:»·,trail:·,extends:→,precedes:←,nbsp:␣";
    -- do not show ~ before empty lines at the end of a buffer
    fillchars      = "fold:-,eob: ";

    wildignorecase = true;
    wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,\z
                      *.zip,**/tmp/**,*.DS_Store,**/node_modules/**";

    pumblend       = 10;
    winblend       = 10;

    hidden         = true;
    switchbuf      = "useopen,vsplit";
    backspace      = "indent,eol,start";

    complete       = ".,w,b,k";
    completeopt    = "menu,menuone,noselect,noinsert";
    inccommand     = "nosplit";

    grepformat     = "%f:%l:%c:%m";
    grepprg        = 'rg --hidden --vimgrep --smart-case --';

    display        = "lastline";
    shortmess      = "aoOTIcF";
    synmaxcol      = 2500;

    diffopt        = "filler,iwhite,internal,algorithm:patience";
    jumpoptions    = "stack";
    viewoptions    = "folds,cursor,curdir,slash,unix";
    sessionoptions = "curdir,help,tabpages,winsize";
    formatoptions  = "1jcroql";

    foldmethod     = "expr";
    foldexpr       = "nvim_treesitter#foldexpr()"
  }

  local options_table = helpers.table_merge(
    general_options,
    behavior_options
  )

  for key, value in pairs(options_table) do
    helpers.bind_option(key, value)
  end
end

setup_runtime_env()
setup_options()
disable_distribution_plugins()

