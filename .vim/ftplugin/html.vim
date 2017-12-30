imap <silent> <buffer> <expr> / CloseTag()

let b:unaryTagsStack = ""

function! CloseTag()
  let previous_char = getline('.')[col('.')-2]

  if previous_char == '<'
    return "\<bs>\<c-_>"
  else
    return "/"
  endif
endfunction
