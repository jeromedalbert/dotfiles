setlocal shiftwidth=4
setlocal tabstop=4
let g:inserting_arrow = 0

" inoremap <buffer> .. ->

function! InsertDollarOrThree()
  " let before = getline('.')[col('^'):max([col('.')-2,0])]
  let previous_char = getline('.')[max([col('.')-2,0])]

  " if before =~ '^\s*$' || previous_char =~ ' \|('
  if previous_char == '$'
    normal! x
    " if col('.') > 1 | exe 'normal! h' | endif
    normal! s3
  elseif previous_char !~ '[[:alnum:]]'
    normal! s$
  else
    normal! s3
  endif
endfunction
inoremap <silent><buffer> 3 <space><Esc>:call InsertDollarOrThree()<Cr>a

function! InsertArrowOrDot()
  if g:inserting_arrow | return | endif
  let g:inserting_arrow = 1
  let before = getline('.')[col('^'):col('.')-2]
  let previous_line = getline(line('.')-1)

  if before =~ '\$[[:alpha:]_][[:alnum:]_\[\]]*$'
    normal! s->
  elseif before =~ '^\s*$'
    if previous_line =~ '[[:alnum:]_)]$'
      normal! s->
    else
      normal! s$this->
    endif
  elseif before =~ '[^ ] $'
    normal! s$this->
  else
    normal! s.
  endif
  let g:inserting_arrow = 0
endfunction
inoremap <silent><buffer> . <space><Esc>:call InsertArrowOrDot()<Cr>a

function! InsertArrowOrDash()
  if g:inserting_arrow | return | endif
  let g:inserting_arrow = 1
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
    normal! s-
  endif
  let g:inserting_arrow = 0
endfunction
inoremap <silent><buffer> - <space><Esc>:call InsertArrowOrDash()<Cr>a
