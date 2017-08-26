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
" Originally based on the RailsCasts TextMate theme (http://railscasts.com/about).
" Designed to work on 24-bit color terminals, with termguicolors on.

set background=dark
highlight clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'railscasts_custom'

hi Normal guifg=#e6e1dc guibg=#2f2f2f gui=NONE
hi Cursor guifg=#000000 guibg=#ebebeb gui=NONE
hi Visual guifg=NONE guibg=#336699 gui=NONE
hi Cursorline gui=NONE guibg=NONE
hi CursorColumn guifg=NONE guibg=#3e3d3d gui=NONE
hi ColorColumn guibg=#454545
hi FoldColumn guifg=#8A8885 guibg=#e3e3e3
hi SignColumn guibg=#e3e3e3
hi LineNr guifg=#8A8885 guibg=#e3e3e3
hi CursorLineNr guifg=#8A8885 guibg=#e3e3e3 gui=none
hi MatchParen guifg=NONE guibg=NONE gui=underline
hi StatusLine guifg=fg guibg=#61605e gui=bold
hi StatusLineNC guifg=fg guibg=#61605e gui=NONE
hi Pmenu guifg=#333333 guibg=#ffffff gui=NONE
hi PmenuSel guifg=#ffffff guibg=#5d90cf gui=bold
hi PmenuThumb guibg=#999999
hi PmenuSbar guibg=#d6d6d6
hi IncSearch guifg=#000000 guibg=#ffe792 gui=NONE
hi Search guifg=NONE guibg=#336699 gui=NONE
hi Directory guifg=#6d9cbe guibg=NONE gui=NONE
" hi Folded guifg=#bc9458 guibg=NONE
hi Folded guifg=fg guibg=NONE
hi VertSplit guifg=bg guibg=NONE
hi Error guibg=#902020 gui=NONE

hi Boolean guifg=#6e9cbe guibg=NONE gui=NONE
hi Character guifg=#6d9cbe guibg=NONE gui=NONE
hi Comment guifg=#bc9458 guibg=NONE gui=italic
hi Conditional guifg=#cc7833 guibg=NONE gui=NONE
hi Constant guifg=#6d9cbe guibg=NONE gui=NONE
hi Define guifg=#cc7833 guibg=NONE gui=NONE
hi DiffAdd guifg=fg guibg=#47840d gui=bold
hi DiffDelete guifg=#8c0909 guibg=NONE gui=NONE
hi DiffChange guifg=fg guibg=#263b59 gui=NONE
hi DiffText guifg=fg guibg=#204a87 gui=bold
" hi ErrorMsg guifg=#ffffff guibg=#990000 gui=NONE
hi ErrorMsg guifg=#ffffff guibg=bg gui=NONE
" hi WarningMsg guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg guifg=#ffffff guibg=bg gui=NONE
hi Float guifg=#a5c261 guibg=NONE gui=NONE
hi Function guifg=#ffc66d guibg=NONE gui=NONE
hi Identifier guifg=NONE guibg=NONE gui=NONE
hi Keyword guifg=#cc7833 guibg=NONE gui=NONE
hi Label guifg=#a5c261 guibg=NONE gui=NONE
hi NonText guifg=#404040 guibg=NONE gui=NONE
hi Number guifg=#a5c261 guibg=NONE gui=NONE
hi Operator guifg=#cc7833 guibg=NONE gui=NONE
hi PreProc guifg=#cc7833 guibg=NONE gui=NONE
hi Special guifg=fg guibg=NONE gui=NONE
hi SpecialKey guifg=#404040 guibg=#3e3d3d gui=NONE
hi Statement guifg=#cc7833 guibg=NONE gui=NONE
hi StorageClass guifg=#cc7833 guibg=NONE gui=NONE
hi String guifg=#a5c261 guibg=NONE gui=NONE
hi Tag guifg=#e8bf6a guibg=NONE gui=NONE
hi Title guifg=NONE guibg=NONE gui=NONE
hi Todo cterm=inverse,bold guifg=#bc9458 guibg=NONE gui=inverse,bold,italic
hi Type guifg=#ffffff guibg=NONE gui=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline

hi qfLineNr guifg=#8A8885 guibg=NONE

hi rubyClass guifg=#cc7833 guibg=NONE gui=NONE
hi rubyFunction guifg=#ffc66d guibg=NONE gui=NONE
hi rubyInterpolationDelimiter guifg=#519f50 guibg=NONE gui=NONE
hi rubyInterpolation guifg=#519f50 guibg=NONE gui=NONE
hi rubySymbol guifg=#6d9cbe guibg=NONE gui=NONE
hi rubyConstant guifg=NONE guibg=NONE gui=NONE
hi rubyConstantCustom guifg=#da4a39 guibg=NONE gui=NONE
hi rubyStringDelimiter guifg=#a5c261 guibg=NONE gui=NONE
hi rubyBlockParameter guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable guifg=#d0d0ff guibg=NONE gui=NONE
hi rubyInclude guifg=#cc7833 guibg=NONE gui=NONE
hi rubyGlobalVariable guifg=#d0d0ff guibg=NONE gui=NONE
hi rubyRegexp guifg=#a5c261 guibg=NONE gui=NONE
hi rubyRegexpDelimiter guifg=#a5c261 guibg=NONE gui=NONE
hi rubyEscape guifg=#519f50 guibg=NONE gui=NONE
hi rubyControl guifg=#cc7833 guibg=NONE gui=NONE
hi rubyClassVariable guifg=NONE guibg=NONE gui=NONE
hi rubyOperator guifg=#cc7833 guibg=NONE gui=NONE
hi rubyException guifg=#cc7833 guibg=NONE gui=NONE
hi rubyPseudoVariable guifg=#d0d0ff guibg=NONE gui=NONE
hi rubyRailsUserClass guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod guifg=#da4939 guibg=NONE gui=NONE
hi rubyRailsARMethod guifg=#da4939 guibg=NONE gui=NONE
hi rubyRailsRenderMethod guifg=#da4939 guibg=NONE gui=NONE
hi rubyStringEscape guifg=#519f50
hi link rubyRegexpSpecial String
hi link rubyHereDocText String

hi erubyComment guifg=#bc9458 guibg=NONE gui=italic
hi erubyRailsMethod guifg=#da4939 guibg=NONE gui=NONE
hi erubyRailsHelperMethod guifg=fg
syn keyword erubyRender render
hi link erubyRender rubyDefine
hi link erubyDelimiter NONE
hi erubyExpression guifg=NONE

hi htmlTag guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlEndTag guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlTagName guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlArg guifg=#e8bf6a guibg=NONE gui=NONE
hi htmlSpecialChar guifg=#6d9cbe guibg=NONE gui=NONE
hi link htmlTagN htmlTag
hi link htmlSpecialTagName htmlTag

hi link xmlEndTag xmlTag
hi link xmlTag htmlTag
hi link xmlTagName htmlTag
hi link xmlAttrib xmlTag
hi link xmlEqual xmlTag

hi yamlKey guifg=#e8bf6a guibg=NONE gui=NONE
hi yamlAnchor guifg=#d0d0ff guibg=NONE gui=NONE
hi yamlAlias guifg=#d0d0ff guibg=NONE gui=NONE
hi yamlDocumentHeader guifg=#a5c261 guibg=NONE gui=NONE
hi link yamlBlockMappingKey Tag
hi link yamlKeyValueDelimiter Tag
hi link yamlPlainScalar String
hi link yamlBool String

hi cssURL guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName guifg=#da4939 guibg=NONE gui=NONE
hi cssColor guifg=#6d9cbe guibg=NONE gui=NONE
hi cssPseudoClassId guifg=#e8bf6a guibg=NONE gui=NONE
hi cssClassName guifg=#e8bf6a guibg=NONE gui=NONE
hi cssValueLength guifg=#a5c261 guibg=NONE gui=NONE
hi cssCommonAttr guifg=#a5c261 guibg=NONE gui=NONE
hi cssBraces guifg=NONE guibg=NONE gui=NONE
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

hi markdownHeadingDelimiter guifg=#cb4b14
hi markdownBold guifg=#586e75 gui=bold
hi markdownItalic guifg=#586e75 gui=italic
hi markdownLineBreak guibg=#A57706
hi link markdownLinkText String
hi markdownLinkTextDelimiter guifg=#647b84
hi link markdownLinkDelimiter markdownLinkTextDelimiter
hi markdownUrl guifg=#829496

hi javaScriptFunction guifg=#cc7833 guibg=NONE gui=NONE
hi javaScriptRailsFunction guifg=#da4939 guibg=NONE gui=NONE
hi javaScriptBraces guifg=NONE guibg=NONE gui=NONE
hi jsKeyword2 gui=italic
hi jsClassKeyword guifg=#cc7833
hi link jsClassDefinition NONE
hi jsComment guifg=#797979
hi jsCommentTodo guifg=#797979 gui=inverse,bold,italic
hi link jsFunction jsKeyword2
hi link jsStorageClass jsKeyword2
hi link jsImport NONE
hi link jsFrom NONE
hi link jsExport NONE
hi link jsExportDefault NONE
hi link jsTernaryIfOperator NONE
hi link jsTemplateBraces rubyInterpolationDelimiter
hi link jsArrowFunction jsOperator
hi link jsObject rubySymbol
hi link jsObjectKey jsObject
hi link jsNull jsObject
hi link jsUndefined jsNull
hi link jsSpreadOperator NONE
hi link jsGlobalNodeObjects NONE
hi link jsGlobalObjects NONE
hi jsBuiltins NONE
hi link jsModuleAs NONE
hi link jsRegexpCharClass String
hi link jsRegexpBoundary String
hi link jsRegexpQuantifier String
hi link jsSpecial String
hi link jsLabel Statement

hi link shRange NONE
hi link shQuote String
" hi shShellVariables guifg=#d0d0ff
" hi zshDereferencing guifg=#d0cfff

hi diffRemoved guifg=#d32020 guibg=#eae3ca
hi diffAdded guifg=#118714 guibg=#eae3ca

hi NeomakeErrorSign guibg=#e3e3e3
hi NeomakeWarningSign guibg=#e3e3e3
hi NeomakeMessageSign guibg=#e3e3e3
hi NeomakeInfoSign guibg=#e3e3e3

hi helpHyperTextJump guifg=#cc7833
hi CtrlPMatch guifg=#cc7833
hi link bufExplorerCurBuf String
hi link jsonQuote String
hi pythonBuiltIn guifg=#6d9cbe

hi xxdAddress guifg=#bc9458
hi link xxdSep xxdAddress
hi link xxdAscii NONE

hi link stString String
