inoremap <silent><buffer> # #<Esc>:call InsertInterpolation()<Cr>a

function! InsertInterpolation()
  let before = getline('.')[col('^'):col('.')]
  let after  = getline('.')[col('.'):col('$')]

  if before =~# '"' && after =~# '"'
    execute "normal! a{}\<Esc>h"
  endif
endfunction
