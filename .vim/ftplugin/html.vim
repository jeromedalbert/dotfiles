let b:delimitMate_matchpairs = "(:),[:],{:}"

imap <buffer> <expr> / CloseTag()

function! CloseTag()
  let previous_char = getline('.')[col('.')-2]

  if previous_char == '<'
    return "\<bs>\<c-_>"
  else
    return "/"
  endif
endfunction
