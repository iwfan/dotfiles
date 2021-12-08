function! LF(path)
    let current_path = expand(a:path)
    let s:choice_file_path = tempname()
    let lf_callback = {}
    function! lf_callback.on_exit(job_id, code, event)
      if a:code == 0
        bd!
      endif
      " stopinsert
      " exe 'bdelete! ' . expand('<abuf>')
      try
        if filereadable(s:choice_file_path)
          for f in readfile(s:choice_file_path)
            exec "edit " . f
          endfor
          call delete(s:choice_file_path)
        endif
      endtry
    endfunction
    tabedit
    call termopen('lf' . ' -selection-path=' . s:choice_file_path . ' "' . current_path . '"', lf_callback)
    startinsert
endfunction

command! -bar LF call LF('.')
command! -bar LFD call LF('%:p:h')
command! -bar LFC call LF('%')
