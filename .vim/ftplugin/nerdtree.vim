map <buffer> J 5j
map <buffer> K 5k
map <buffer> <silent> o :call functions#PreviewNERDTreeNode()<cr>
map <buffer> <silent> p :call functions#PreviewNERDTreeNode()<cr>
map <buffer> <esc> :let t:escaped_nerdtree = 1<cr>q
map <buffer> <f1> q

if exists('t:last_bufnum')
  let t:nerdtree_original_bufnum = t:last_bufnum
endif
