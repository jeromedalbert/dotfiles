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
" Designed for 24-bit color terminals, with termguicolors on.
"
" Originally based on the RailsCasts TextMate theme
" (http://railscasts.com/about) and the Sublime Text 2 RailsCasts Theme
" (https://github.com/tdm00/sublime-theme-railscasts).
"
" Sublime Text colors are in the native 'Color LCD' color space on MacOS Sierra.
" But iTerm2+Vim colors are in the sRGB color space.
" For some colors, there is no difference between the two color spaces.
" When there is a difference, some colors can look slightly washed out if not
" properly converted.
" ColorSync Utility's Calculator tab can be used to manually convert, although
" it is sometimes not perfect.
" Reference Conversion Table
" +---------+---------+-------------+
" | NATIVE  | SRGB    | Not perfect |
" +---------+---------+-------------+
" | #e8bf6a | #e9c063 |             |
" +---------+---------+-------------+
" | #336699 | #30659b |             |
" +---------+---------+-------------+
" | #bc9458 | #bd9553 |             |
" +---------+---------+-------------+
" | #cc7833 | #ce7829 |             |
" +---------+---------+-------------+
" | #ffc66d | #ffc765 | x           |
" +---------+---------+-------------+
" | #a5c261 | #a4c35b |             |
" +---------+---------+-------------+
" | #d0d0ff | #d0cfff | x           |
" +---------+---------+-------------+
" | #6d9cbe | #6b9bc0 |             |
" +---------+---------+-------------+
" | #DA4939 | #DC4832 |             |
" +---------+---------+-------------+
" | #519f50 | #4ea04c |             |
" +---------+---------+-------------+
" | #a57706 | #a67806 | x           |
" +---------+---------+-------------+
" | #cb4b16 | #cd4a00 | x           |
" +---------+---------+-------------+
" | #586e75 | #576e75 |             |
" +---------+---------+-------------+
" | #657b83 | #647b83 |             |
" +---------+---------+-------------+
" | #ffe792 | #ffe88c | x           |
" +---------+---------+-------------+
" | #900000 | #9b0000 | x           |
" +---------+---------+-------------+
" For better fidelity, completely disable iTerm2's 'Minimum contrast' option
" and set 'Use thin strokes for anti-aliased text' to 'Never'.

set background=dark
highlight clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'railscasts_custom'

hi Normal guifg=#e6e1dc guibg=#2f2f2f gui=NONE
hi Visual guifg=NONE guibg=#30659b gui=NONE
hi Cursor guifg=#000000 guibg=#ffe88c gui=NONE
hi LineNr guifg=#8A8885 guibg=#e3e3e3 gui=NONE
hi FoldColumn guifg=#8A8885 guibg=#e3e3e3 gui=NONE
hi CursorLineNr guifg=#8A8885 guibg=#e3e3e3 gui=NONE
hi SignColumn guifg=#8A8885 guibg=#e3e3e3 gui=NONE
hi TabLine guifg=#e6e1dc guibg=#a9a9a9 gui=NONE
hi TabLineFill guifg=NONE guibg=#e6e1dc gui=NONE
hi Cursorline guifg=NONE guibg=#3e3d3d gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#3e3d3d gui=NONE
hi ColorColumn guifg=NONE guibg=#454545 gui=NONE
hi MatchParen guifg=NONE guibg=NONE gui=underline cterm=underline
hi ModeMsg guifg=#e6e1dc guibg=NONE gui=NONE
hi StatusLine guifg=fg guibg=#61605e gui=bold cterm=bold
hi StatusLineNC guifg=fg guibg=#61605e gui=NONE cterm=NONE
hi StatusLineTerm guifg=fg guibg=#61605e gui=bold cterm=bold
hi StatusLineTermNC guifg=fg guibg=#61605e gui=NONE cterm=NONE
hi Pmenu guifg=#333333 guibg=#ffffff gui=NONE
hi PmenuSel guifg=#ffffff guibg=#5d90cf gui=bold cterm=bold
hi PmenuThumb guibg=#999999
hi PmenuSbar guibg=#d6d6d6
hi IncSearch guifg=#000000 guibg=#ffe88c gui=NONE cterm=NONE
hi Search guifg=NONE guibg=#336699 gui=NONE
hi Directory guifg=#6b9bc0 guibg=NONE gui=NONE
hi Folded guifg=fg guibg=NONE
hi VertSplit guifg=bg guibg=NONE
hi Error guibg=#9b0000 gui=NONE
hi link Character String
hi Comment guifg=#bd9553 guibg=NONE gui=italic cterm=italic
hi link SpecialComment Comment
hi Constant guifg=#6b9bc0 guibg=NONE gui=NONE
hi DiffAdd guifg=fg guibg=#47840d gui=bold cterm=bold
hi DiffDelete guifg=#dc322f guibg=NONE gui=NONE
hi DiffChange guifg=fg guibg=#204a87
hi DiffText guifg=fg guibg=#507ab7 gui=NONE cterm=NONE
hi link Float Number
hi Function guifg=#ffc765 guibg=NONE gui=NONE
hi Identifier guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#404040 guibg=NONE gui=NONE
hi link Number String
hi PreProc guifg=#ce7829 guibg=NONE gui=NONE
hi Special guifg=fg guibg=NONE gui=NONE
hi SpecialChar guifg=#4ea04c guibg=NONE gui=NONE
hi SpecialKey guifg=#61605e guibg=NONE gui=NONE
hi Statement guifg=#ce7829 guibg=NONE gui=NONE
hi link StorageClass Statement
hi String guifg=#a4c35b guibg=NONE gui=NONE
hi Tag guifg=#e9c063 guibg=NONE gui=NONE
hi Title guifg=NONE guibg=NONE gui=NONE
hi Todo guifg=#bd9553 guibg=NONE gui=inverse,bold,italic cterm=inverse,bold,italic
hi Type guifg=fg guibg=NONE gui=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline cterm=underline
hi ErrorMsg guifg=#ffffff guibg=bg gui=NONE
hi WarningMsg guifg=#ffffff guibg=bg gui=NONE
" hi ErrorMsg guifg=#ffffff guibg=#990000 gui=NONE
" hi WarningMsg guifg=#000000 guibg=#DDDD00 gui=NONE
hi link Whitespace Normal
hi link qfLineNr NONE
hi link qfFilename NONE
hi link qfSeparator NONE
hi link QuickfixLine NONE
if has('nvim')
  hi @variable guifg=#e6e1dc guibg=#2f2f2f gui=NONE

  hi link @function.call Normal
  hi link @function.method.call @function.call
  hi link @string.special.symbol Constant
  hi link @punctuation.special SpecialChar
  hi link @punctuation.delimiter.regex String
  hi link @string.special.url NONE
  hi link @keyword.conditional.ternary Operator
end

hi link rubyInterpolation SpecialChar
hi link rubyInterpolationDelimiter rubyInterpolation
hi link rubyStringDelimiter String
hi rubyBlockParameter guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable guifg=#d0cfff guibg=NONE gui=NONE
hi link rubyGlobalVariable rubyInstanceVariable
hi link rubyRegexp String
hi link rubyRegexpDelimiter rubyRegexp
hi link rubyEscape rubyInterpolation
hi link rubyStringEscape rubyEscape
hi rubyClassVariable guifg=NONE guibg=NONE gui=NONE
hi link rubyPseudoVariable rubyInstanceVariable
hi rubyRailsUserClass guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARMethod guifg=#dc4832 guibg=NONE gui=NONE
hi link rubyRailsARAssociationMethod rubyRailsARMethod
hi link rubyRailsRenderMethod rubyRailsARMethod
hi link rubyConstantOther rubyRailsARMethod
hi link rubyRegexpSpecial String
hi link rubyHereDocText String
if has('nvim')
  hi link @variable.member.ruby rubyInstanceVariable
  hi link @variable.builtin.ruby rubyPseudoVariable
  hi link @constant.ruby rubyRailsARMethod
  hi link @constant.regex Normal
  hi link @constant.builtin.ruby rubyPseudoVariable
  hi link @constant.builtin.nil.ruby rubyNil
  hi link @string.regexp.ruby String
end

hi link erubyComment Comment
hi link erubyRailsMethod rubyRailsARMethod
hi erubyRailsHelperMethod guifg=fg
syn keyword erubyRender render
hi link erubyRender Statement
hi link erubyDelimiter NONE
hi erubyExpression guifg=NONE

hi link htmlTag Tag
hi link htmlEndTag htmlTag
hi link htmlTagName htmlTag
hi link htmlArg htmlTag
hi link htmlSpecialChar Constant
hi link htmlTagN htmlTag
hi link htmlSpecialTagName htmlTag
hi link htmlError NONE
if has('nvim')
  hi link @keyword.embedded_template Normal
  hi link @operator.html htmlTag
  hi link @constant.html htmlTag
  hi link @string.special.url.html String
end

hi link hamlTag Tag
hi link hamlClass hamlTag
hi link hamlClassChar hamlTag
hi link hamlId hamlTag
hi link hamlIdChar hamlTag
hi link hamlFilter NONE

hi link xmlTag Tag
hi link xmlEndTag xmlTag
hi link xmlTagName xmlTag
hi link xmlAttrib xmlTag
hi link xmlEqual xmlTag
hi link xmlProcessingDelim xmlTag
hi link xmlEntity Constant
hi link xmlEntityPunct xmlEntity

hi link yamlKey Tag
hi link yamlAnchor rubyInstanceVariable
hi link yamlAlias Statement
hi link yamlDocumentHeader String
hi link yamlBlockMappingKey yamlKey
hi link yamlBlockMappingMerge yamlKey
hi link yamlBlockCollectionItemStart String
hi link yamlKeyValueDelimiter yamlKey
hi link yamlPlainScalar String
hi link yamlBool String
hi link yamlFlowMappingKey String
if has('nvim')
  hi link @property.yaml yamlKey
  hi link @punctuation.delimiter.yaml yamlKey
  hi link @punctuation.special.yaml Statement
  hi link @boolean.yaml yamlBool
end

hi link gotplAction NONE
hi link gotplVariable NONE
hi link gotplFunctions NONE
hi link goSprigFunctions NONE

hi cssURL guifg=NONE guibg=NONE gui=NONE
hi link cssClassName Tag
hi link cssPseudoClassId cssClassName
hi link cssValueLength String
hi link cssCommonAttr String
hi link cssBraces NONE
hi link cssIdentifier cssClassName
hi cssVendor guifg=NONE
hi cssInclude guifg=NONE
hi link cssFunctionName NONE
hi link cssProp Constant
hi link cssAttr String
hi link cssUnitDecorators Constant

hi link sassClass Tag
hi link sassClassChar sassClass
hi sassVariable guifg=NONE
hi link sassCssAttribute Constant
hi link sassAmpersand cssTagName
hi link scssAmpersand cssTagName
hi link scssSelectorName sassClass
hi link scssSelectorChar sassClass
hi scssFunctionName guifg=NONE

hi link stylusClass Tag
hi link stylusClassChar stylusClass
hi link stylusId stylusClass
hi link stylusIdChar stylusClass
hi link stylusProperty cssProp

hi markdownheadingdelimiter guifg=#cd4a00
hi markdownBold guifg=#576e75 gui=bold cterm=bold
hi markdownItalic guifg=#576e75 gui=italic cterm=italic
hi markdownlinebreak guibg=#a67806
hi link markdownLinkText String
hi markdownLinkTextDelimiter guifg=#647b83
hi link markdownLinkDelimiter markdownLinkTextDelimiter
hi markdownUrl guifg=#839496
hi link markdownListMarker htmlTagName
if has('nvim')
  hi link @punctuation.special.markdown markdownBlockQuote
  hi link @markup.heading markdownheadingdelimiter
  hi link @spell.markdown Normal
  hi link @character.special.markdown_inline Constant
end

hi link mkdListItem markdownListMarker
hi link mkdCode NONE
hi link mkdLink markdownLinkText
hi link mkdUrl markdownUrl
hi link mkdDelimiter markdownLinkTextDelimiter
hi link mkdBold markdownBold
hi link htmlBold mkdBold
hi link mkdItalic markdownItalic
hi link htmlItalic mkdItalic
hi link mkdLineBreak markdownlinebreak
hi link mkdBlockQuote NONE
hi link mkdCodeStart NONE
hi link mkdCodeEnd mkdCodeStart
hi link mkdHeading markdownheadingdelimiter

hi link javaScriptFunction Statement
hi link javaScriptRailsFunction rubyRailsARMethod
hi link javaScriptBraces NONE
hi jsKeyword2 gui=italic cterm=italic
hi link jsClassDefinition NONE
hi jsComment guifg=#797979
hi jsCommentTodo guifg=#797979 gui=inverse,bold,italic cterm=inverse,bold,italic
hi link jsFunction jsKeyword2
hi link jsStorageClass jsKeyword2
hi link jsImport NONE
hi link jsFrom NONE
hi link jsExport NONE
hi link jsExportDefault NONE
hi link jsTernaryIfOperator NONE
hi link jsTemplateBraces SpecialChar
hi link jsArrowFunction jsOperator
hi link jsObject Constant
hi link jsObjectKey jsObject
hi link jsNull jsObject
hi link jsUndefined jsNull
hi link jsSpreadOperator NONE
hi link jsGlobalNodeObjects NONE
hi link jsGlobalObjects NONE
hi link jsBuiltins NONE
hi link jsModuleAs NONE
hi link jsRegexpCharClass String
hi link jsRegexpBoundary String
hi link jsRegexpQuantifier String
hi link jsSpecial String
hi link jsLabel Statement
hi link jsClassProperty Function
if has('nvim')
  hi link @variable.member.javascript jsObjectKey
  hi link @comment.javascript jsComment
end

hi link jsonQuote String
hi link jsonKeyword String
hi link jsonNull Constant
hi link jsonEscape SpecialChar

hi link shRange NONE
hi link shQuote String
hi link shCommandSub String
hi link shCmdSubRegion shCommandSub
hi link shOption NONE
hi link shSpecial SpecialChar
hi link shCtrlSeq shSpecial

hi diffRemoved guifg=#d32020 guibg=#eae3ca
hi diffAdded guifg=#118714 guibg=#eae3ca

hi NeomakeErrorSign guibg=#e3e3e3
hi NeomakeWarningSign guibg=#e3e3e3
hi NeomakeMessageSign guibg=#e3e3e3
hi NeomakeInfoSign guibg=#e3e3e3

hi link helpHyperTextJump Statement
hi link CtrlPMatch Statement
hi link bufExplorerCurBuf String
hi link pythonBuiltIn Constant

hi xxdAddress guifg=#bd9553
hi link xxdSep xxdAddress
hi link xxdAscii NONE

hi link stString String

hi link gitcommitSummary NONE
hi link gitcommitHeader gitcommitComment

hi link swiftMethod NONE

hi link phpMemberSelector NONE
hi link phpStaticClasses NONE
hi link phpFunction Function
hi link phpFunctions NONE
hi link phpClasses rubyConstantOther
hi link phpComment jsComment
hi link phpOperator NONE
hi link phpVarSelector Keyword
hi link phpSuperGlobals Constant
" hi link phpMagicConstants rubyGlobalVariable

hi link bladeDelimiter NONE

hi DbgBreakptLine guibg=#80322f guifg=#ffffff
hi link DbgBreakptSign DbgBreakptLine
hi link DbgCurrentLine DiffText
hi link DbgCurrentSign DbgCurrentLine

hi link NERDTreeDirSlash NERDTreeDir

hi link graphqlConstant NONE
hi link graphqlOperator NONE

hi link sqlKeyword Keyword
hi link sqlSpecial Boolean

hi link rustFuncCall NONE
hi link rustSelf NONE
hi link rustModPath NONE

hi link goEscapeC SpecialChar
hi link goFormatSpecifier String
hi link goPointerOperator Statement
hi link goPointerRelated Statement

hi goComment guifg=#797979
" hi link goPointerOperator Constant
" hi link goPointerRelated Constant
hi link goBuiltins Constant
hi link goPredefinedIdentifiers NONE
" hi link goField Constant

if has('nvim')
  hi link @constant.bash PreProc
  hi link @punctuation.special.bash @constant.bash
  hi link @function.builtin.bash Statement

  hi link @character.special.vim Normal
  hi link @string.special.vim Normal
  hi link @string.special.path.vim Normal
  hi link @punctuation.special.vim Normal
  hi link @function.macro.vim Normal
  hi link @function.vim Normal
  hi link @variable.builtin.vim PreProc
  hi link @constant.vim Normal
  hi link @property.vim PreProc
  hi link vimSetStep Normal
  hi link @label.vim Normal
end
