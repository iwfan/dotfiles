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


lua require 'settings'
lua require 'keymaps'

let VIM_SCRIPT_PATH = expand('<sfile>:p:h')
call helpers#source_dir(VIM_SCRIPT_PATH . '/general')

call helpers#source_dir(VIM_SCRIPT_PATH . '/general/plug-conf')
lua require 'plugs'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
