noremap <silent><buffer> <leader>og :call OpenInGithub()<cr>

function! OpenInGithub()
  let word = expand('<cword>')
  if word =~ '^[a-f0-9]\+$' && word =~ '[a-f]' && word =~ '[0-9]'
    call OpenCommitInGithub(expand('%:h'))
  else
    call OpenPrInGithub()
  end
endfunction
