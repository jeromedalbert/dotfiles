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
" Designed for 24-bit color terminals with termguicolors on.
" Supports Vim traditional and Neovim treesitter highlights.
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
hi TabLine guifg=#e6e1dc guibg=#a9a9a9 gui=NONE
hi TabLineSel guifg=#e6e1dc guibg=#2f2f2f gui=NONE
hi TabLineFill guifg=NONE guibg=#e6e1dc gui=NONE
hi Cursorline guifg=NONE guibg=#3e3d3d gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#3e3d3d gui=NONE
hi ColorColumn guifg=NONE guibg=#454545 gui=NONE
hi ModeMsg guifg=#e6e1dc guibg=NONE gui=NONE
hi StatusLine guifg=fg guibg=#61605e gui=bold cterm=bold
hi StatusLineNC guifg=fg guibg=#61605e gui=NONE cterm=NONE
hi Pmenu guifg=#333333 guibg=#ffffff gui=NONE
hi PmenuSel guifg=#ffffff guibg=#5d90cf gui=bold cterm=bold
hi PmenuThumb guibg=#999999
hi PmenuSbar guibg=#d6d6d6
hi IncSearch guifg=#000000 guibg=#ffe88c gui=NONE cterm=NONE
hi Search guifg=NONE guibg=#336699 gui=NONE
hi Symbol guifg=#6b9bc0 guibg=NONE gui=NONE
hi Folded guifg=fg guibg=NONE
hi VertSplit guifg=bg guibg=NONE
hi Error guibg=#9b0000 gui=NONE
hi Comment guifg=#bd9553 guibg=NONE gui=italic cterm=italic
hi DiffAdd guifg=fg guibg=#47840d gui=bold cterm=bold
hi DiffDelete guifg=#dc322f guibg=NONE gui=NONE
hi DiffChange guifg=fg guibg=#204a87
hi DiffText guifg=fg guibg=#507ab7 gui=NONE cterm=NONE
hi Function guifg=#ffc765 guibg=NONE gui=NONE
hi Identifier guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#404040 guibg=NONE gui=NONE
hi Special guifg=fg guibg=NONE gui=NONE
hi SpecialChar guifg=#4ea04c guibg=NONE gui=NONE
hi SpecialKey guifg=#61605e guibg=NONE gui=NONE
hi Statement guifg=#ce7829 guibg=NONE gui=NONE
hi String guifg=#a4c35b guibg=NONE gui=NONE
hi Tag guifg=#e9c063 guibg=NONE gui=NONE
hi Title guifg=NONE guibg=NONE gui=NONE
hi Todo guifg=#bd9553 guibg=NONE gui=inverse,bold,italic cterm=inverse,bold,italic
hi Type guifg=fg guibg=NONE gui=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline cterm=underline
hi WildMenu guifg=Black guibg=Yellow
hi ErrorMsg guifg=#ffffff guibg=bg gui=NONE
hi! Prompt guifg=#ffffff guibg=bg gui=NONE
hi MoreMsg guifg=#ffffff guibg=bg gui=NONE
hi link Character String
hi link SpecialComment Comment
hi link FoldColumn LineNr
hi link CursorLineNr LineNr
hi link SignColumn LineNr
hi! link Constant Normal
hi! link Directory Symbol
hi link Float Number
hi! link MatchParen Underlined
hi link Number String
hi link StorageClass Statement
hi link Whitespace Normal
hi link qfLineNr NONE
hi link qfFilename NONE
hi link qfSeparator NONE
hi! link QuickFixLine Normal
hi! link PreProc Statement
hi! link WarningMsg ErrorMsg
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi! link Operator Statement
hi! link Question Normal

if has('nvim')
  hi @variable guifg=#e6e1dc guibg=#2f2f2f gui=NONE
  hi link @boolean.ruby Symbol
  hi! link @comment.note Todo
  hi link @constant.regex String
  hi link @function.call Normal
  hi link @function.method.call @function.call
  hi link @keyword.conditional.ternary Operator
  hi link @number.comment Comment
  hi link @operator.regex String
  hi link @punctuation.bracket.regex String
  hi link @punctuation.delimiter.regex String
  hi link @punctuation.special SpecialChar
  hi link @string.special SpecialChar
  hi link @string.special.symbol Symbol
  hi link @string.special.url String
  hi link @string.special.url.comment NONE
  hi link @variable.builtin.regex NONE
endif

hi link rubyInterpolation SpecialChar
hi link rubyInterpolationDelimiter rubyInterpolation
hi link rubyStringDelimiter String
hi rubyBlockParameter guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable guifg=#d0cfff guibg=NONE gui=NONE
hi link rubyGlobalVariable rubyInstanceVariable
hi link rubySymbol Symbol
hi link rubyBoolean Symbol
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
  hi link @variable.parameter.symbol.ruby Symbol
  hi link @constant.ruby rubyRailsARMethod
  hi link @constant.builtin.ruby rubyPseudoVariable
  hi link @string.regexp.ruby String
  hi link @punctuation.bracket.special.ruby String
  hi link @label.ruby String
  hi link @function.builtin.ruby Statement
  " START - Make most code the same color inside an interpolation
  hi link @interpolation.ruby rubyInterpolation
  hi link @function.call.ruby NONE
  hi link @variable.ruby NONE
  hi link @punctuation.delimiter.ruby NONE
  hi link @punctuation.bracket.ruby NONE
  " END
endif

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
hi link htmlSpecialChar Symbol
hi link htmlTagN htmlTag
hi link htmlSpecialTagName htmlTag
hi link htmlError NONE
if has('nvim')
  hi link @keyword.embedded_template Normal
  hi link @operator.html htmlTag
  hi link @constant.html htmlTag
  hi link @string.special.url.html String
endif

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
hi link xmlEntity Symbol
hi link xmlEntityPunct xmlEntity

hi link yamlKey Tag
hi link yamlAnchor rubyInstanceVariable
hi link yamlAlias Statement
hi link yamlDocumentHeader String
hi link yamlBlockMappingKey yamlKey
hi link yamlBlockMappingMerge yamlKey
hi link yamlBlockCollectionItemStart String
hi link yamlBlockString String
hi link yamlKeyValueDelimiter yamlKey
hi link yamlPlainScalar String
hi link yamlBool String
hi link yamlFlowMappingKey String
if has('nvim')
  hi link @property.yaml yamlKey
  hi link @punctuation.delimiter.yaml yamlKey
  hi link @punctuation.special.yaml Statement
  hi link @boolean.yaml yamlBool
  hi link @label.anchor.yaml yamlAnchor
endif

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
hi link cssProp Symbol
hi link cssAttr String
hi link cssUnitDecorators Symbol

hi link sassClass Tag
hi link sassClassChar sassClass
hi sassVariable guifg=NONE
hi link sassCssAttribute Symbol
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
  hi link @character.special.markdown_inline Symbol
  hi link @punctuation.special.markdown markdownBlockQuote
  hi link @spell.markdown Normal
  hi link @markup.heading.1.markdown markdownheadingdelimiter
  hi link @markup.heading.2.markdown markdownheadingdelimiter
  hi link @markup.heading.3.markdown markdownheadingdelimiter
  hi link @markup.heading.4.markdown markdownheadingdelimiter
  hi link @markup.heading.5.markdown markdownheadingdelimiter
  hi link @markup.heading.6.markdown markdownheadingdelimiter
  hi link @markup.italic.markdown_inline markdownItalic
  hi link @markup.link.label.markdown_inline markdownLinkText
  hi link @markup.link.label.markdown markdownIdDeclaration
  hi link @markup.link.markdown_inline markdownLinkTextDelimiter
  hi link @markup.link.url.markdown_inline markdownUrl
  hi link @markup.link.url.markdown markdownUrl
  hi link @markup.list.markdown markdownListMarker
  hi link @markup.strong.markdown_inline markdownBold
endif

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
hi link jsObject Symbol
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
hi link jsRegexpOr String
hi link jsRegexpQuantifier String
hi link jsSpecial String
hi link jsLabel Statement
hi link jsClassProperty Function
if has('nvim')
  hi link @variable.parameter.javascript jsObjectKey
  hi link @comment.javascript jsComment
endif

hi link jsonQuote String
hi link jsonKeyword String
hi link jsonNull Symbol
hi link jsonBoolean Symbol
hi link jsonEscape SpecialChar
if has('nvim')
  hi link @property.json String
  hi link @constant.builtin.json Symbol
  hi link @boolean.json Symbol
endif

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
hi link pythonBuiltIn Symbol

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
hi link phpSuperGlobals Symbol
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
if has('nvim')
  hi link @string.gosum NONE
  hi link @string.special.symbol.gosum NONE
  hi link @attribute.gosum NONE
  hi link @variable.member.go Symbol
end

hi goComment guifg=#797979
" hi link goPointerOperator Symbol
" hi link goPointerRelated Symbol
hi link goBuiltins Symbol
hi link goPredefinedIdentifiers NONE
" hi link goField Symbol
" hi link @type.go Symbol

if has('nvim')
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

  hi link @string.special.path.gitignore NONE
  hi link @character.special.gitignore NONE

  hi link @spell.dockerfile Comment
endif
