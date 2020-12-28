--
-- ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
-- ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║██╔══██╗██╔════╝
-- ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║██████╔╝██║
-- ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
-- ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
-- ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
-- Author:   Zi莱卷 <i.wangfancn@gmail.com>
-- Github:   https://github.com/iwfan
-- License:  MIT License

require 'settings'
require 'keymaps'

local VIM_SCRIPT_PATH = vim.fn.expand('<sfile>:p:h')
vim.fn['helpers#source_dir'](VIM_SCRIPT_PATH .. '/general/plug-conf')

require 'plugins'
require 'plugs'
require 'functions'
