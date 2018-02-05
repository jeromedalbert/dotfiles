" if exists('b:did_indent') | finish | endif
" if exists('s:doing_indent_inits') | finish | endif

" let s:doing_indent_inits = 1
" runtime! indent/html.vim
" unlet b:did_indent
" runtime! indent/php.vim
" unlet s:doing_indent_inits

" function! GetPhpHtmlIndent(lnum)
"   if exists('*HtmlIndent')
"     let html_ind = HtmlIndent()
"   else
"     let html_ind = HtmlIndentGet(a:lnum)
"   endif
"   let php_ind = GetPhpIndent()
"   if php_ind > -1
"     return php_ind
"   endif
"   if html_ind > -1
"     if getline(a:num) =~ "^<?" && (0< searchpair('<?', '', '?>', 'nWb')
"           \ || 0 < searchpair('<?', '', '?>', 'nW'))
"       return -1
"     endif
"     return html_ind
"   endif
"   return -1
" endfunction

" setlocal indentexpr=GetPhpHtmlIndent(v:lnum)
" setlocal indentkeys+=<>>
