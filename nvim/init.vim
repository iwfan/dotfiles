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

function! SourceDirectory(file_path)
  for l:fpath in split(globpath(a:file_path, '*.vim'), '\n')
    exe 'source' l:fpath
  endfor
endfunction

if empty(glob(VIM_SCRIPT_PATH . '/general/machine_environment.vim'))
  silent! exec "!cp " . VIM_SCRIPT_PATH . "/template/machine_environment.vim " . VIM_SCRIPT_PATH . "/general/machine_environment.vim"
endif

call SourceDirectory(VIM_SCRIPT_PATH . '/general')
call SourceDirectory(VIM_SCRIPT_PATH . '/advanced')

" setup themes
" call appearance#theme()
call appearance#oceanic_material_theme()

" Free memory
delfunction appearance#theme
delfunction SourceDirectory
unlet PLATFORM
unlet VIM_SCRIPT_PATH

