setlocal colorcolumn=

map <buffer> J 5j
map <buffer> K 5k
map <buffer> <f1> q
map <buffer> i <cr>

nnoremap <silent><buffer> o :call NERDTreePreviewOrOpen()<cr>
nnoremap <silent><buffer> <esc> :call EscapeNERDTree()<cr>
nnoremap <silent><buffer> <leader>q :call CloseNERDTree()<cr>
