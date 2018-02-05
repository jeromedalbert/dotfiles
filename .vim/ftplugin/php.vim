setlocal shiftwidth=4
setlocal tabstop=4

" inoremap <buffer> .. ->

function! InsertDollarOrFour()
  " let before = getline('.')[col('^'):max([col('.')-2,0])]
  let previous_char = getline('.')[max([col('.')-2,0])]

  " if before =~ '^\s*$' || previous_char =~ ' \|('
  if previous_char == '$'
    normal! x
    " if col('.') > 1 | exe 'normal! h' | endif
    normal! s4
  elseif previous_char !~ '[[:alnum:]]'
    normal! s$
  else
    normal! s4
  endif
endfunction
inoremap <silent><buffer> 4 <space><Esc>:call InsertDollarOrFour()<Cr>a

function! InsertArrowOrDot()
  let before = getline('.')[col('^'):col('.')-2]
  let previous_line = getline(line('.')-1)

  if before =~ '\$[[:alpha:]_][[:alnum:]_\[\]]*$'
    normal! s->
  elseif before =~ '^\s*$'
    if previous_line =~ '[[:alnum:]_)]$'
      normal s->
    else
      normal! s$this->
    endif
  elseif before =~ '[^ ] $'
    normal! s$this->
  else
    normal! s.
  endif
endfunction
inoremap <silent><buffer> . <space><Esc>:call InsertArrowOrDot()<Cr>a
