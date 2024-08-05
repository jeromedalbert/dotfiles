syn match rubyOperator "[~!^&*+-]\|<<\|<=>\|<=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\*\*"
syn match rubyOperator "->\|-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!="

syn match rubyOperator "\%(class\s*[[:alnum:]:]\+\s*\)\@<!<"

syn match rubyOperator "=>\@!"
syn match rubyOperator "\s\@= ?\S\@!"

syn match rubyOperator "%\%([[:punct:]]\|[qwrsxQWRS][[:punct:]]\?\)\@!"

syn match rubyOperator "\%([[:alnum:]]\s*\)\@<=/"

" syn match rubyOperator "\%(do\s*\)\@<!|"

syn match rubyNil "nil[?!]\@!"
hi link rubyNil rubyBoolean

syn match rubyConstantOther "\<\%(\(class\|module\)\s\+.\+\)\@<!\u\w*\>\%(\.\|::\)\@!"

syn keyword rubyNew new
hi link rubyNew Keyword

syn region rubyHereDocText matchgroup=String start=+<<[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=NONE

syn region rubyString matchgroup=rubyStringDelimiter start="%[qwiI]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1"
syn region rubyString matchgroup=rubyStringDelimiter start="%[qwiI]{"				     end="}"   skip="\\\\\|\\}"	  contains=rubyNestedCurlyBraces,rubyDelimiterEscape
syn region rubyString matchgroup=rubyStringDelimiter start="%[qwiI]<"				     end=">"   skip="\\\\\|\\>"	  contains=rubyNestedAngleBrackets,rubyDelimiterEscape
syn region rubyString matchgroup=rubyStringDelimiter start="%[qwiI]\["				     end="\]"  skip="\\\\\|\\\]"  contains=rubyNestedSquareBrackets,rubyDelimiterEscape
syn region rubyString matchgroup=rubyStringDelimiter start="%[qwiI]("				     end=")"   skip="\\\\\|\\)"	  contains=rubyNestedParentheses,rubyDelimiterEscape
