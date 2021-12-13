augroup sleuthcompat
    autocmd!
    autocmd FileType
          \ html,css,scss,sass,javascript,typescript,javascriptreact,typescriptreact,vim,sh,zsh,markdown,lua,graphql
          \ silent if len(findfile('.editorconfig', '.;')) == 0 | Sleuth | endif
augroup END
