; #######################
; ### Ruby highlights ###
; #######################
;
; Original highlights from https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/ruby/highlights.scm,
; with certain parts commented out to allow for overriding.
; See bottom of this file for overrides.

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

(constant) @constant

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

; (comment) @comment @spell

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

; Operators
[
  "!"
  "="
  "=="
  "==="
  "<=>"
  "=>"
  "->"
  ">>"
  "<<"
  ">"
  "<"
  ">="
  "<="
  "**"
  "*"
  "/"
  "%"
  "+"
  "-"
  "&"
  "|"
  "^"
  "&&"
  "||"
  "||="
  "&&="
  "!="
  "%="
  "+="
  "-="
  "*="
  "/="
  "=~"
  "!~"
  "?"
  ":"
  ".."
  "..."
] @operator

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

; #################
; ### Overrides ###
; #################

; Keywords
(nil) @boolean
(super) @keyword
(begin_block) @keyword
(end_block) @keyword
(call
  method: (identifier) @keyword.control
  (#any-of? @keyword.control "abort" "at_exit" "exit" "fork" "loop" "trap"))
(call
  method: (identifier) @keyword
  (#any-of? @keyword "proc" "lambda" "caller" "callcc"))
(call
  method: (identifier) @keyword.function
  (#any-of? @keyword.function
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

; Fixed require
((call
  !receiver
  method: (identifier) @keyword.import)
  (#any-of? @keyword.import "require" "require_relative" "load" "autoload" "gem"))

; Fixed identifiers
((identifier) @function.builtin
  (#any-of? @function.builtin "attr_reader" "attr_writer" "attr_accessor" "module_function"))
((call
  !receiver
  method: (identifier) @function.builtin)
  (#any-of? @function.builtin "include" "extend" "prepend" "refine" "using"))

; Shebang
((comment) @comment @spell
  (#not-lua-match? @comment "^#!/"))
((program
  .
  (comment) @keyword.directive)
  (#lua-match? @keyword.directive "^#!/"))

; %w and %i as dedicated highlights
(string_array "%w(" @punctuation.bracket.special ")" @punctuation.bracket.special)
(symbol_array "%i(" @punctuation.bracket.special ")" @punctuation.bracket.special)

; Highlight constants in certain cases.
; For constants like Abc::Def, only Def is highlighted.
((constant) @constant ; Constants not inside a class/module definition and not doing any calls
  (#lua-match? @constant "^[A-Z][a-zA-Z0-9_]*$")
  (#not-has-ancestor? @constant class module)
  (#not-has-parent? @constant call method_call scope_resolution))
((call ; Constants as arguments (to method calls, include, extend, etc)
  arguments: (argument_list
    (scope_resolution name: (constant) @constant)))
  (#not-has-parent? @constant class module))
  (#lua-match? @constant "^[A-Z][a-zA-Z0-9_]*$")
((rescue ; Constants inside a rescue block
  exceptions: (exceptions
    [
      (constant) @constant
      (scope_resolution name: (constant) @constant)
    ]))
  (#lua-match? @constant "^[A-Z][a-zA-Z0-9_]*$"))
(call ; Methods that look like constants, for example Array(...)
  method: (constant) @constant
  (#lua-match? @constant "^[A-Z][a-zA-Z0-9_]*$"))

; Keyword parameters, for example `a:` and `b:` in `my_method(a: 1, b: 2)`
(keyword_parameter
  (identifier) @variable.parameter.symbol)
