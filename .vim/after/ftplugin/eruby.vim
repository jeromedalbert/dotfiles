setlocal path+=app/views
setlocal suffixesadd=.html.erb,.html.haml,.haml
setlocal includeexpr=RailsRenderIncludeExpr(v:fname)
let b:commentary_format='<%# %s %>'

function! RailsRenderIncludeExpr(filename)
  if getline('.') =~ 'render '
    return substitute(v:fname, '\([^/]\+\)$', '_\1', '')
  end
endfunction
