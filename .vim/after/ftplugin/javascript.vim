setlocal suffixesadd=.js,.jsx
setlocal include=from
" setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)

iabbrev <buffer> con const

inoremap <silent><buffer> $ $<Esc>:call InsertInterpolation()<Cr>a
function! InsertInterpolation()
  let before = getline('.')[col('^'):col('.')]
  let after  = getline('.')[col('.'):col('$')]

  if before =~# '`' && after =~# '`'
    execute "normal! a{}\<Esc>h"
  endif
endfunction

" setlocal foldenable
" setlocal foldmethod=expr
" setlocal foldexpr=FoldImports()
" setlocal foldtext=GetImportsFoldText()

" function! FoldImports()
"   let line = getline(v:lnum)
"   if line =~ '^import'
"     return '1'
"   elseif line =~ '^\s*$'
"     return '-1'
"   else
"     return '0'
"   end
" endfunction

" function! GetImportsFoldText()
"   if &foldmethod != 'expr'
"     let comment = getline(v:foldstart)
"   else
"     let comment = 'imports ...'
"   endif
"   let width = winwidth(0) - &foldcolumn - strwidth(comment)
"   return comment . repeat(' ', width)
" endfunction
