map <buffer> J 5j
map <buffer> K 5k
map <silent><buffer> o :call PreviewNERDTreeFile()<cr>
map <buffer> i <cr>
map <buffer> <f1> q
map <silent><buffer> <leader>q :call CloseNERTreeAndMaybeTab()<cr>

let t:nerdtree_winnr = bufwinnr('%')
