local home       = os.getenv('HOME')
local os_name    = vim.loop.os_uname().sysname
local is_windows = os_name == 'Windows'
local path_sep   = is_windows and '\\' or '/'

local context    = {
  is_mac     = os_name == 'Darwin',
  is_linux   = os_name == 'Linux',
  is_windows = is_windows,
  stdpath    = vim.fn.stdpath('data'),
  home       = home,
  vim_path   = home .. path_sep .. '.config' .. path_sep .. 'nvim'
  cache_path = home .. path_sep .. '.cache'  .. path_sep .. 'vim' .. path_sep
}

return context
