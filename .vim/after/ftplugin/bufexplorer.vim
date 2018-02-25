if !exists('b:config_defined')
  setlocal colorcolumn=
  map <buffer> <esc> q
  let b:config_defined = 1
endif
