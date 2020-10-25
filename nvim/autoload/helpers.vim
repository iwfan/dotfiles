function! helpers#source_file(file_path)
  if (filereadable(a:file_path))
    exe 'source' a:file_path
  endif
endfunction


function! helpers#source_dir(file_path)
  for l:fpath in split(globpath(a:file_path, '*.vim'), '\n')
    call helpers#source_file(l:fpath)
  endfor
endfunction


function! helpers#ensure_machine_environment(base_dir)
  if empty(glob(a:base_dir . '/autoload/machine_environment.vim'))
    silent! exec "!cp " . a:base_dir . "/template/machine_environment.vim "
                      \ . a:base_dir . "/autoload/machine_environment.vim"
  endif
endfunction

