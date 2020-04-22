inoremap <silent><buffer> # #<Esc>:call InsertInterpolation()<cr>a
map <silent><buffer> grs <Plug>SplitString

function! InsertInterpolation()
  let before = getline('.')[col('^'):col('.')]
  let after  = getline('.')[col('.'):col('$')]
  if before =~# '"' && after =~# '"'
    exe "normal! a{}\<Esc>h"
  endif
endfunction

function! SplitString()
  let current_char = getline('.')[col('.')-1]
  if current_char != ' '
    exe "normal! f "
  endif
  let before = getline('.')[col('^'):col('.')]
  if before =~# "'"
    exe "normal! a' \\ \<cr>'"
  elseif before =~# '"'
    exe "normal! a\" \\ \<cr>\""
  endif
  silent! call repeat#set("\<Plug>SplitString", 1)
endfunction
nnoremap <silent><buffer> <Plug>SplitString :<c-u>call SplitString()<cr>
