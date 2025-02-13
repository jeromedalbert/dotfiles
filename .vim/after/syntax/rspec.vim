runtime! syntax/ruby.vim

syn keyword rspecMethods
    \ describe
    \ let
    \ it
    \ its
    \ specify
    \ shared_context
    \ shared_examples
    \ shared_examples_for
    \ shared_context
    \ include_examples
    \ include_context
    \ it_should_behave_like
    \ it_behaves_like
    \ before
    \ after
    \ around
    \ fixtures
    \ controller_name
    \ helper_name
    \ scenario
    \ feature
    \ background
    \ given
    \ subject
    \ described_class
syn match rspecContext "\<context\>\ze\s\+.*\<do\>"
" syn match rspecSubject "\<subject\>\ze\s\+\([{]\|\<do\>\)"

hi link rspecMethods Statement
hi link rspecGroupMethods Statement
hi link rspecMatchers NONE
hi link rspecKeywords NONE
hi link rspecContext Keyword
" hi link rspecSubject Keyword
