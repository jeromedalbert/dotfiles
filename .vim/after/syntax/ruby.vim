syn match rubyOperator "[~!^&*+-]\|<<\|<=>\|<=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\*\*"
syn match rubyOperator "->\|-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!="

syn match rubyOperator "\%(class\s*[[:alnum:]:]\+\s*\)\@<!<"

syn match rubyOperator "=>\@!"
syn match rubyOperator "\s\@= ?\S\@!"

syn match rubyOperator "%\%([[:punct:]]\|[qwrsxQWRS][[:punct:]]\?\)\@!"

syn match rubyOperator "\%([[:alnum:]]\s*\)\@<=/"

syn match rubyOperator "\%(do\s*\)\@<!|"

syn match rubyNil "nil[?!]\@!"
hi link rubyNil rubyBoolean

syn match rubyConstantOther "\<\%(\(class\|module\)\s\+.\+\)\@<!\u\w*\>\%(\.\|::\)\@!"

syn keyword rubyNew new
hi link rubyNew Keyword

syntax region rubyHereDocText matchgroup=String start=+<<[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=NONE
