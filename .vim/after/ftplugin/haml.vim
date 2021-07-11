setlocal path+=app/views
setlocal suffixesadd=.html.haml,.haml,.html.erb
setlocal includeexpr=RailsRenderIncludeExpr(v:fname)
setlocal comments=:-#

function! RailsRenderIncludeExpr(filename)
  if getline('.') =~ 'render '
    return substitute(v:fname, '\([^/]\+\)$', '_\1', '')
  end
endfunction
