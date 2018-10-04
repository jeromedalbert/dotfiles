setlocal colorcolumn=

map <buffer> J 5j
map <buffer> K 5k
map <buffer> i <cr>

nnoremap <silent><buffer> o :call NERDTreePreviewOrOpen()<cr>
nnoremap <silent><buffer> <esc> :call EscapeNERDTree()<cr>
nnoremap <silent><buffer> <leader>q :call QuitNERDTree()<cr>
nnoremap <silent><buffer> cd :call NERDTreeCD()<cr>

map <buffer> ? <Plug>(incsearch-backward)
" nnoremap <silent><buffer> <m-?> :call nerdtree#ui_glue#invokeKeyMap("?")<cr>
