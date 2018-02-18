syn match markdownError "\w\@<=\w\@="

syn region htmlH1 matchgroup=markdownHeadingDelimiter start="^\s*#"                   end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH2 matchgroup=markdownHeadingDelimiter start="^\s*##"                  end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH3 matchgroup=markdownHeadingDelimiter start="^\s*###"                 end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH4 matchgroup=markdownHeadingDelimiter start="^\s*####"                end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH5 matchgroup=markdownHeadingDelimiter start="^\s*#####"               end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH6 matchgroup=markdownHeadingDelimiter start="^\s*######"              end="$" contains=mkdLink,mkdInlineURL,@Spell
