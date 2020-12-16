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
call helpers#source_dir(VIM_SCRIPT_PATH . '/before')
call helpers#source_file(VIM_SCRIPT_PATH . '/general/basic.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/general/keymappings.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/general/plugins.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/general/ftsettings.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/general/functions.vim')
call helpers#source_file(VIM_SCRIPT_PATH . '/general/code_run.vim')

" setup themes
call appearance#theme()
