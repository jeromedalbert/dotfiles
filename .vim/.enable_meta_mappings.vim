"#####################
"### Vim + alt=alt ###
"#####################
" let keys = split(
"   \ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
"   \ . '`1234567890-=[]\;' . "'" . ',./~!@#$%^&*()_+{}|:"<>?'
"   \ , '\zs')
" let vals = split(
"   \ 'å∫ç∂´ƒ©˙ˆ∆˚¬µ˜øπœ®ß†¨√∑≈¥ΩÅıÇÎ´Ï˝ÓˆÔÒÂ˜Ø∏Œ‰Íˇ¨◊„˛Á¸'
"   \ . '`¡™£¢∞§¶•ªº–≠“‘«…æ≤≥÷`⁄€‹›ﬁﬂ‡°·‚—±”’»ÚÆ¯˘¿'
"   \ , '\zs')
" for i in range(len(keys))
"   exe 'map ' . vals[i] . ' <m-' . keys[i] . '>'
"   exe 'imap ' . vals[i] . ' <m-' . keys[i] . '>'
"   exe 'cmap' . vals[i] . ' <m-' . keys[i] . '>'
" endfor

"######################
"### Vim + alt=meta ###
"######################
" Works out of the box.

"#####################
"### Vim + alt=esc ###
"#####################
let ascii_nums = [33] + range(35, 61) + range(63, 78) + range(80, 90)
  \ + range(92, 123) + [125, 126]
for num in ascii_nums
  let key = nr2char(num)
  exe 'map <esc>' . key . ' <m-' . key . '>'
endfor

"######################
"### Neovim + alt=alt #
"######################
" Does NOT work.

"#######################
"### Neovim + alt=meta #
"#######################
" let keys = split(
"   \ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
"   \ . '`1234567890=[]\;' . "'" . ',./~!@#$%^&*()+{}:"<>?'
"   \ , '\zs')
" let vals = split(
"   \ 'áâãäåæçèéêëìíîïðñòóôõö÷øùúÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚ'
"   \ . 'à±²³´µ¶·¸¹°½ÛÝÜ»§¬®¯þ¡À£¤¥Þ¦ª¨©«ûýº¢¼¾¿'
"   \ , '\zs')
" for i in range(len(keys))
"   exe 'map ' . vals[i] . ' <m-' . keys[i] . '>'
"   exe 'imap ' . vals[i] . ' <m-' . keys[i] . '>'
"   exe 'cmap' . vals[i] . ' <m-' . keys[i] . '>'
" endfor

"######################
"### Neovim + alt=esc #
"######################
" Works out of the box.
