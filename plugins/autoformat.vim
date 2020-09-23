fun! AutoFormatSpecificFiles()
  if &ft !~ 'java' && &ft !~ 'nim'
    :Autoformat
  endif
endfun

" Autoformat on writes
autocmd BufWrite * :call AutoFormatSpecificFiles()


