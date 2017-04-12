" Vim color file
"
"  "   ____                                  _       _      "
"  "  / ___| _ __   ___  __ _ _ __ _ __ ___ (_)_ __ | |_    "
"  "  \___ \| '_ \ / _ \/ _` | '__| '_ ` _ \| | '_ \| __|   "
"  "   ___) | |_) |  __/ (_| | |  | | | | | | | | | | |_    "
"  "  |____/| .__/ \___|\__,_|_|  |_| |_| |_|_|_| |_|\__|   "
"  "        |_|                                             "
"  "           ____          _                              "
"  "          / ___|   _ ___| |_ ___  _ __ ___              "
"  "         | |  | | | / __| __/ _ \| '_ ` _ \             "
"  "         | |__| |_| \__ \ || (_) | | | | | |            "
"  "          \____\__,_|___/\__\___/|_| |_| |_|            "
"  "                                                        "
"
" File:         spearmint_custom.vim
" Maintainer:   Jerome Dalbert (jerome.dalbert@gmail.com)
" License:      MIT
"
" Based on the Spearmint TextMate theme converted with Coloration 0.3.2 [1].
" Optimized for true color terminal Vim/Neovim and tailored to my taste.
"
" [1] https://github.com/sickill/coloration

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "spearmint_custom"

hi Cursor ctermfg=NONE ctermbg=231 cterm=NONE guifg=NONE guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#c4e0ff gui=NONE
hi CursorLine ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#d6e7e5 gui=NONE
hi CursorLine cterm=NONE guibg=#CEEBE7
hi CursorColumn ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#d6e7e5 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#d6e7e5 gui=NONE
hi ColorColumn guibg=#C5D9D7
hi SignColumn guibg=#e1f0ee
hi LineNr ctermfg=145 ctermbg=188 cterm=NONE guifg=#a9c3c0 guibg=#e1f0ee gui=NONE
hi CursorLineNr guifg=#A9C3C0 guibg=#ceebe7 gui=NONE
hi MatchParen ctermfg=73 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=underline
hi StatusLine ctermfg=66 ctermbg=152 cterm=bold guifg=#719692 guibg=#c1d6d3 gui=bold
hi StatusLineNC ctermfg=66 ctermbg=152 cterm=NONE guifg=#719692 guibg=#c1d6d3 gui=NONE
hi Pmenu ctermfg=15 ctermbg=NONE cterm=NONE guifg=#333333 guibg=#ffffff gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=#ffffff guibg=#5d90cf gui=bold
hi IncSearch ctermfg=235 ctermbg=143 cterm=NONE guifg=#000000 guibg=#ffe792 gui=NONE
hi Search ctermfg=NONE ctermbg=152 cterm=NONE guifg=NONE guibg=#b1d8d3 gui=NONE
hi Directory ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi Folded ctermfg=115 ctermbg=195 cterm=NONE guifg=#93c7c0 guibg=#e1f0ee gui=NONE
hi VertSplit ctermfg=152 ctermbg=152 cterm=NONE guifg=#c1d6d3 guibg=#C5D9D7 gui=NONE

hi Normal ctermfg=66 ctermbg=195 cterm=NONE guifg=#719692 guibg=#e1f0ee gui=NONE
hi Boolean ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi Character ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi Comment ctermfg=115 ctermbg=NONE cterm=NONE guifg=#93c7c0 guibg=NONE gui=NONE
hi Conditional ctermfg=73 ctermbg=NONE cterm=NONE guifg=#50a89c guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi ErrorMsg ctermfg=231 ctermbg=38 cterm=NONE guifg=#f8f8f0 guibg=#00a8c6 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=38 cterm=NONE guifg=#f8f8f0 guibg=#00a8c6 gui=NONE
hi Float ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi Function ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4dd7e0 guibg=NONE gui=NONE
hi Identifier ctermfg=73 ctermbg=NONE cterm=NONE guifg=#69adb5 guibg=NONE gui=italic
hi Keyword ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi Label ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4cd7e0 guibg=NONE gui=NONE
hi NonText ctermfg=15 ctermbg=188 cterm=NONE guifg=#ffffff guibg=#e1f0ee gui=NONE
hi Number ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi Operator ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi PreProc ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi Special ctermfg=66 ctermbg=NONE cterm=NONE guifg=#719692 guibg=NONE gui=NONE
hi SpecialKey ctermfg=15 ctermbg=188 cterm=NONE guifg=#ffffff guibg=#d6e7e5 gui=NONE
hi Statement ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi StorageClass ctermfg=73 ctermbg=NONE cterm=NONE guifg=#69adb5 guibg=NONE gui=italic
hi String ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4dd7e0 guibg=NONE gui=NONE
hi Tag ctermfg=30 ctermbg=NONE cterm=NONE guifg=#25808a guibg=NONE gui=NONE
hi Title ctermfg=66 ctermbg=NONE cterm=bold guifg=#719692 guibg=NONE gui=bold
hi Todo ctermfg=115 ctermbg=NONE cterm=inverse,bold guifg=#93c7c0 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi rubyFunction ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4cd7e0 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi rubyConstant ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4cd7e0 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4cd7e0 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4cd7e0 guibg=NONE gui=NONE
hi rubyEscape ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi rubyControl ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi rubyException ctermfg=73 ctermbg=NONE cterm=NONE guifg=#4fa89c guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=115 ctermbg=NONE cterm=NONE guifg=#93c7c0 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=73 ctermbg=NONE cterm=NONE guifg=#69adb5 guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=30 ctermbg=NONE cterm=NONE guifg=#25808a guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=80 ctermbg=NONE cterm=NONE guifg=#4cd7e0 guibg=NONE gui=NONE
hi cssURL ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=italic
hi cssFunctionName ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi cssColor ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=73 ctermbg=NONE cterm=NONE guifg=#69adb5 guibg=NONE gui=NONE
hi cssClassName ctermfg=73 ctermbg=NONE cterm=NONE guifg=#69adb5 guibg=NONE gui=NONE
hi cssValueLength ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=37 ctermbg=NONE cterm=NONE guifg=#199fa8 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" Custom
hi Identifier gui=NONE
hi jsFunction guifg=#69adb5 gui=italic
hi jsArrowFunction guifg=#69adb5 gui=italic
hi jsObjectKey guifg=#4dd7e0
hi jsGlobalObjects guifg=#199fa8 gui=italic
hi link jsClass Keyword
hi link jsClassKeywords jsClass
hi link jsThis Identifier
hi link jsTemplateVar String
hi link jsTemplateBraces String

" hi jsxRegion guibg=#2f2f2f guifg=#719692
hi link xmlEndTag xmlTag
