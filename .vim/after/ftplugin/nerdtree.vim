setlocal colorcolumn=

map <buffer> J 5j
map <buffer> K 5k
map <buffer> i <cr>

nnoremap <silent><buffer> o :call NERDTreePreviewOrOpen()<cr>
nnoremap <silent><buffer> <esc> :call EscapeNERDTree()<cr>
nnoremap <silent><buffer> <leader>q :call QuitNERDTree()<cr>
nnoremap <silent><buffer> cd :call NERDTreeCD()<cr>

noremap <buffer> ? ?
" map <buffer> ? <Plug>(incsearch-backward)
noremap <silent><buffer> <m-?> :call nerdtree#ui_glue#invokeKeyMap("?")<cr>
