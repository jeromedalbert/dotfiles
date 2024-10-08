; ###########################
; ### Original highlights ###
; ###########################
;
; Original highlights from https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/ruby/highlights.scm,
; with certain parts commented out to allow for overriding.


; Variables
[
  (identifier)
  (global_variable)
] @variable

; Keywords
[
  "alias"
  "begin"
  "do"
  "end"
  "ensure"
  "module"
  "rescue"
  "then"
] @keyword

"class" @keyword.type

[
  "return"
  "yield"
] @keyword.return

[
  "and"
  "or"
  "in"
  "not"
] @keyword.operator

[
  "def"
  "undef"
] @keyword.function

(method
  "end" @keyword.function)

[
  "case"
  "else"
  "elsif"
  "if"
  "unless"
  "when"
  "then"
] @keyword.conditional

(if
  "end" @keyword.conditional)

[
  "for"
  "until"
  "while"
  "break"
  "redo"
  "retry"
  "next"
] @keyword.repeat

; (constant) @constant

((identifier) @keyword.modifier
  (#any-of? @keyword.modifier "private" "protected" "public"))

[
  "rescue"
  "ensure"
] @keyword.exception

; Function calls
"defined?" @function

(call
  receiver: (constant)? @type
  method: [
    (identifier)
    (constant)
  ] @function.call)

; (program
;   (call
;     (identifier) @keyword.import)
;   (#any-of? @keyword.import "require" "require_relative" "load"))

; Function definitions
(alias
  (identifier) @function)

(setter
  (identifier) @function)

(method
  name: [
    (identifier) @function
    (constant) @type
  ])

(singleton_method
  name: [
    (identifier) @function
    (constant) @type
  ])

(class
  name: (constant) @type)

(module
  name: (constant) @type)

(superclass
  (constant) @type)

; Identifiers
[
  (class_variable)
  (instance_variable)
] @variable.member

((identifier) @constant.builtin
  (#any-of? @constant.builtin
    "__callee__" "__dir__" "__id__" "__method__" "__send__" "__ENCODING__" "__FILE__" "__LINE__"))

; ((identifier) @function.builtin
;   (#any-of? @function.builtin
;     "include" "extend" "prepend" "attr_reader" "attr_writer" "attr_accessor" "module_function"
;     "refine" "using"))

((identifier) @keyword.exception
  (#any-of? @keyword.exception "raise" "fail" "catch" "throw"))

((constant) @type
  (#not-lua-match? @type "^[A-Z0-9_]+$"))

[
  (self)
  (super)
] @variable.builtin

(method_parameters
  (identifier) @variable.parameter)

(lambda_parameters
  (identifier) @variable.parameter)

(block_parameters
  (identifier) @variable.parameter)

(splat_parameter
  (identifier) @variable.parameter)

(hash_splat_parameter
  (identifier) @variable.parameter)

(optional_parameter
  (identifier) @variable.parameter)

(destructured_parameter
  (identifier) @variable.parameter)

(block_parameter
  (identifier) @variable.parameter)

(keyword_parameter
  (identifier) @variable.parameter)

; TODO: Re-enable this once it is supported
; ((identifier) @function
;  (#is-not? local))
; Literals
[
  (string_content)
  (heredoc_content)
  "\""
  "`"
] @string

[
  (heredoc_beginning)
  (heredoc_end)
] @label

[
  (bare_symbol)
  (simple_symbol)
  (delimited_symbol)
  (hash_key_symbol)
] @string.special.symbol

(regex
  (string_content) @string.regexp)

(escape_sequence) @string.escape

(integer) @number

(float) @number.float

[
  (true)
  (false)
] @boolean

(nil) @constant.builtin

(comment) @comment @spell

(program
  (comment)+ @comment.documentation
  (class))

(module
  (comment)+ @comment.documentation
  (body_statement
    (class)))

(class
  (comment)+ @comment.documentation
  (body_statement
    (method)))

(body_statement
  (comment)+ @comment.documentation
  (method))

; ; Operators
; [
;   "!"
;   "="
;   "=="
;   "==="
;   "<=>"
;   "=>"
;   "->"
;   ">>"
;   "<<"
;   ">"
;   "<"
;   ">="
;   "<="
;   "**"
;   "*"
;   "/"
;   "%"
;   "+"
;   "-"
;   "&"
;   "|"
;   "^"
;   "&&"
;   "||"
;   "||="
;   "&&="
;   "!="
;   "%="
;   "+="
;   "-="
;   "*="
;   "/="
;   "=~"
;   "!~"
;   "?"
;   ":"
;   ".."
;   "..."
; ] @operator

[
  ","
  ";"
  "."
  "&."
  "::"
] @punctuation.delimiter

(regex
  "/" @punctuation.bracket)

(pair
  ":" @punctuation.delimiter)

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  ; "%w("
  ; "%i("
] @punctuation.bracket

(block_parameters
  "|" @punctuation.bracket)

(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special)

; ################################
; ### Extensions and overrides ###
; ################################

; Keywords
(nil) @boolean
(super) @keyword
[
  "BEGIN"
  "END"
] @keyword
(call
  method: (identifier) @function.builtin
  (#any-of? @function.builtin "abort" "at_exit" "exit" "fork" "loop" "trap"))
(call
  method: (identifier) @function.builtin
  (#any-of? @function.builtin "proc" "lambda" "caller" "callcc"))
(call
  method: (identifier) @function.builtin
  (#any-of? @function.builtin
    "alias_method" "define_method" "define_singleton_method" "remove_method" "undef_method"))
(call
  method: (identifier) @keyword.rspec
  (#any-of? @keyword.rspec
    "describe"
    "context"
    "let"
    "it"
    "its"
    "specify"
    "shared_context"
    "shared_examples"
    "shared_examples_for"
    "shared_context"
    "include_examples"
    "include_context"
    "it_should_behave_like"
    "it_behaves_like"
    "before"
    "after"
    "around"
    "subject"
    "fixtures"
    "controller_name"
    "helper_name"
    "scenario"
    "feature"
    "background"
    "given"
    "described_class"))

; Fixed require keywords
((call
  !receiver
  method: (identifier) @keyword.import)
  (#any-of? @keyword.import "require" "require_relative" "load" "autoload" "gem"))

; Fixed identifier keywords
((identifier) @function.builtin
  (#any-of? @function.builtin "attr_reader" "attr_writer" "attr_accessor" "module_function"))
((call
  !receiver
  method: (identifier) @function.builtin)
  (#any-of? @function.builtin "include" "extend" "prepend" "refine" "using"))

; Shebang
((program
  .
  (comment) @keyword.directive @nospell)
  (#lua-match? @keyword.directive "^#!/"))

; Constants
((constant) @constant
  (#not-has-parent? @constant
    class module superclass ; Not inside a class/module definition. Example: `class A < B`
    call method_call ; Not called on. Example: `A.my_method`
    scope_resolution)) ; Not inside a module chain. Example: `A::B::C`
; Last part of a module chain that is an argument to something. Example: `C` in `include A::B::C`
(call
  arguments: (argument_list
    (scope_resolution
      name: (constant) @constant)))
; Last part of a module chain for an uppercase constant. Example: `A::CONSTANT`
(scope_resolution
  name: (constant) @constant
  (#lua-match? @constant "^[A-Z][A-Z0-9_]*$"))

; Methods that look like constants. Example: Array(...)
(call
  method: (constant) @constant
  (#lua-match? @constant "^[A-Z][a-zA-Z0-9_]*$"))

; Operators
[
  "!" "=" "==" "===" "<=>" "->" ">>" "<<" ">" ">=" "<=" "**" "*" "/"
  "%" "+" "-" "&" "^" "&&" "||" "||=" "&&=" "!=" "%=" "+=" "-=" "*=" "/="
  "=~" "!~" "?" "&."
] @operator

; Highlight < when not used for class inheritance
("<" @operator
(#not-has-ancestor? @operator superclass))

; Regex delimiters
(regex
  "/" @punctuation.delimiter.regex
  (string_content)
  "/" @punctuation.delimiter.regex)

; %w and %i
(string_array "%w(" @punctuation.bracket.special ")" @punctuation.bracket.special)
(symbol_array "%i(" @punctuation.bracket.special ")" @punctuation.bracket.special)

; Keyword parameters, for example `a:` and `b:` in `my_method(a: 1, b: 2)`
(keyword_parameter
  (identifier) @variable.parameter.symbol)

; Interpolation
; Low priority so builtins like __dir__ can be highlighted
((interpolation (_) @interpolation) @interpolation (#set! "priority" 90))
