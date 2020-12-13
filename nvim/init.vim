" 
" ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║██████╔╝██║
" ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
" ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" Author:   Zi莱卷 <i.wangfancn@gmail.com>
" Github:   https://github.com/iwfan
" License:  MIT License

scriptencoding utf-8

if has('macunix') || has("unix")
  let PLATFORM = 'unix'
else
  let PLATFORM = 'win'
endif

let VIM_SCRIPT_PATH = expand('<sfile>:p:h')

call helpers#ensure_machine_environment(VIM_SCRIPT_PATH)
call helpers#source_file(VIM_SCRIPT_PATH . '/core/machine_environment.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/disable-built-in-plugin.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/basic.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/keymappings.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/plugins.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/functions.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/plugin_keymappings.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/core/code_run.vim')

" setup themes
call appearance#theme()
