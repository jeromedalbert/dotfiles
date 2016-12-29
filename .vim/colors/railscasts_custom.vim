" Vim color file
"
"  "   ____       _ _                   _          "
"  "  |  _ \ __ _(_) |___  ___ __ _ ___| |_ ___    "
"  "  | |_) / _` | | / __|/ __/ _` / __| __/ __|   "
"  "  |  _ < (_| | | \__ \ (_| (_| \__ \ |_\__ \   "
"  "  |_| \_\__,_|_|_|___/\___\__,_|___/\__|___/   "
"  "                                               "
"  "      ____          _                          "
"  "     / ___|   _ ___| |_ ___  _ __ ___          "
"  "    | |  | | | / __| __/ _ \| '_ ` _ \         "
"  "    | |__| |_| \__ \ || (_) | | | | | |        "
"  "     \____\__,_|___/\__\___/|_| |_| |_|        "
"  "                                               "
"
" File:         railscasts_custom.vim
" Maintainer:   Jerome Dalbert (jerome.dalbert@gmail.com)
" License:      MIT
"
" Based on the RailsCasts TextMate theme [1] converted with Coloration 0.3.2
" [2]. Optimized for true color terminal Vim/Neovim and tailored to my taste.
"
" [1] http://railscasts.com/about
" [2] https://github.com/sickill/coloration

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "railscasts_custom"

hi Cursor ctermfg=235 ctermbg=15 cterm=NONE guifg=#2b2b2b guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#336699 gui=NONE
hi Cursorline gui=NONE guibg=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3e3d3d gui=NONE
hi ColorColumn guibg=#454545
" hi FoldColumn guifg=#8A8885 guibg=#E3E3E3
hi FoldColumn guifg=#8A8885 guibg=#2f2f2f
hi SignColumn guibg=#e3e3e3
hi LineNr guifg=#8A8885 guibg=#E3E3E3
hi CursorLineNr guifg=#8A8885 guibg=#E3E3E3 gui=none
hi MatchParen ctermfg=173 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi StatusLine ctermfg=188 ctermbg=241 cterm=bold guifg=#e6e1dc guibg=#61605e gui=bold
hi StatusLineNC ctermfg=188 ctermbg=241 cterm=NONE guifg=#e6e1dc guibg=#61605e gui=NONE
hi Pmenu ctermfg=15 ctermbg=NONE cterm=NONE guifg=#333333 guibg=#ffffff gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=#ffffff guibg=#5d90cf gui=bold
hi PmenuThumb guibg=#999999
hi PmenuSbar guibg=#d6d6d6

hi IncSearch ctermfg=235 ctermbg=143 cterm=NONE guifg=#000000 guibg=#ffe792 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=#336699 gui=NONE
hi Directory ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6d9cbe guibg=NONE gui=NONE
hi Folded ctermfg=137 ctermbg=235 cterm=NONE guifg=#bc9458 guibg=#2b2b2b gui=NONE
hi VertSplit guifg=#2f2f2f guibg=#2f2f2f

hi Normal ctermfg=188 ctermbg=235 cterm=NONE guifg=#e6e1dc guibg=#2f2f2f gui=NONE
hi Boolean ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6e9cbe guibg=NONE gui=NONE
hi Character ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6d9cbe guibg=NONE gui=NONE
hi Comment ctermfg=137 ctermbg=NONE cterm=NONE guifg=#bc9458 guibg=NONE gui=italic
hi Conditional ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi Constant ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6d9cbe guibg=NONE gui=NONE
hi Define ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi DiffAdd ctermfg=188 ctermbg=64 cterm=bold guifg=#e6e1dc guibg=#47840d gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8c0909 guibg=NONE gui=NONE
hi DiffChange ctermfg=188 ctermbg=23 cterm=NONE guifg=#e6e1dc guibg=#263b59 gui=NONE
hi DiffText ctermfg=188 ctermbg=24 cterm=bold guifg=#e6e1dc guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi Float ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi Function ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffc66d guibg=NONE gui=NONE
hi Identifier ctermfg=173 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Keyword ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi Label ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi NonText ctermfg=238 ctermbg=236 cterm=NONE guifg=#404040 guibg=#2f2f2f gui=NONE
hi Number ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi Operator ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi Special ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e6e1dc guibg=NONE gui=NONE
hi SpecialKey ctermfg=238 ctermbg=237 cterm=NONE guifg=#404040 guibg=#3e3d3d gui=NONE
hi Statement ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi StorageClass ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi String ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi Tag ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi Title ctermfg=188 ctermbg=NONE cterm=bold guifg=NONE guibg=NONE gui=NONE
hi Todo ctermfg=137 ctermbg=NONE cterm=inverse,bold guifg=#bc9458 guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi rubyFunction ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffc66d guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#519f50 guibg=NONE gui=NONE
hi rubyInterpolation ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#519f50 guibg=NONE gui=NONE
hi rubySymbol ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6d9cbe guibg=NONE gui=NONE
hi rubyConstant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyConstantCustom ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#da4a39 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#d0d0ff guibg=NONE gui=NONE
hi rubyInclude ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#d0d0ff guibg=NONE gui=NONE
hi rubyRegexp ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi rubyEscape ctermfg=71 ctermbg=NONE cterm=NONE guifg=#519f50 guibg=NONE gui=NONE
hi rubyControl ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi rubyException ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#d0d0ff guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da4939 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da4939 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da4939 guibg=NONE gui=NONE
hi erubyComment ctermfg=137 ctermbg=NONE cterm=NONE guifg=#bc9458 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da4939 guibg=NONE gui=NONE
hi htmlTag ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlEndTag ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlTagName ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlArg ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6d9cbe guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=173 ctermbg=NONE cterm=NONE guifg=#cc7833 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da4939 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi yamlAnchor ctermfg=189 ctermbg=NONE cterm=NONE guifg=#d0d0ff guibg=NONE gui=NONE
hi yamlAlias ctermfg=189 ctermbg=NONE cterm=NONE guifg=#d0d0ff guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi cssURL ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da4939 guibg=NONE gui=NONE
hi cssColor ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6d9cbe guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi cssClassName ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi cssValueLength ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=143 ctermbg=NONE cterm=NONE guifg=#a5c261 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi helpHyperTextJump guifg=#cc7833
hi rubyStringEscape guifg=#519f50

hi link rubyRegexpSpecial String
hi link rubyHereDocText String

hi link cssIdentifier Tag
hi cssVendor guifg=NONE
hi cssInclude guifg=NONE
hi cssFunctionName guifg=NONE
hi cssProp guifg=#6d9cbe
hi cssAttr guifg=#a5c261
hi cssUnitDecorators guifg=#6d9cbe
hi link sassClass Tag
hi link sassClassChar Tag
hi sassVariable guifg=NONE
hi sassCssAttribute guifg=#6d9cbe
hi link sassAmpersand cssTagName
hi link scssAmpersand cssTagName
hi link scssSelectorName Tag
hi link scssSelectorChar Tag
hi scssFunctionName guifg=NONE

hi link htmlTagN htmlTag
hi link htmlLink NONE
hi link htmlSpecialTagName htmlTag

hi erubyRailsHelperMethod guifg=#e6e1dc
syn keyword erubyRender render
hi link erubyRender rubyDefine
hi erubyDelimiter guifg=NONE
hi erubyExpression guifg=NONE

hi link yamlBlockMappingKey Tag
hi link yamlKeyValueDelimiter Tag
hi link yamlPlainScalar String
hi link yamlBool String

hi CtrlPMatch guifg=#cc7833
hi link bufExplorerCurBuf String

hi markdownHeadingDelimiter guifg=#cb4b14
hi markdownBold guifg=#586e75 gui=bold
hi markdownItalic guifg=#586e75 gui=italic
hi markdownLineBreak guibg=#A57706

hi diffRemoved guifg=#d32020 guibg=#eae3ca
hi diffAdded guifg=#118714 guibg=#eae3ca

hi link jsonQuote String

hi pythonBuiltIn guifg=#6d9cbe

hi NeomakeErrorSign guibg=#e3e3e3
hi NeomakeWarningSign guibg=#e3e3e3
hi NeomakeMessageSign guibg=#e3e3e3
hi NeomakeInfoSign guibg=#e3e3e3
