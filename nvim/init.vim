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
call helpers#source_dir(VIM_SCRIPT_PATH . '/general')
call helpers#source_dir(VIM_SCRIPT_PATH . '/plugins')
call helpers#source_dir(VIM_SCRIPT_PATH . '/themes')
lua require'bufferline'.setup()
