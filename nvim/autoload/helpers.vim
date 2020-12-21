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

