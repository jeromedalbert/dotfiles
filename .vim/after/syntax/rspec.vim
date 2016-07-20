runtime! syntax/ruby.vim

syn keyword rspecMethods
    \ describe
    \ context
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
    \ subject
    \ fixtures
    \ controller_name
    \ helper_name
    \ scenario
    \ feature
    \ background
    \ given
    \ described_class

hi link rspecMethods Statement
