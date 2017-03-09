"############
"### TODO ###
"############
" Watch https://robots.thoughtbot.com/how-to-do-90-of-what-plugins-do-with-just-vim
" Integrate ctags seamlessly
" Switch to Vim 8?
" Why doesn't the unnamed register work after completing with a snippet?
" Map cmd+I to tab os x wide, as well as tab to esc
" Textobj function that works for ES6 JS
" Detect : in ruby symbol syntax
" Repro and fix FullSearch bug when huge amount of results. May have to do with deoplete or neosnippet

"###############
"### Plugins ###
"###############
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jeromedalbert/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'gregsexton/gitv'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'tek/vim-textobj-ruby'
Plug 'kana/vim-textobj-function'
Plug 'tommcdo/vim-exchange'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'nishigori/increment-activator'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'skwp/greplace.vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'kassio/neoterm'
Plug 'kurkale6ka/vim-pairs'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'bkad/CamelCaseMotion'
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/neosnippet.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'jlanzarotta/bufexplorer'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'neomake/neomake'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/mru.vim'
" Plug 'wellle/targets.vim'
" Plug 'thinca/vim-textobj-function-javascript'

call plug#end()

"############################
"### General key mappings ###
"############################
let mapleader = " "

map - :
imap jj <esc>
map ' "
map '' :reg "0123456789<cr>
map '" :reg<cr>

map J 5j
map K 5k
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nmap 0 ^
nnoremap d0 d^
noremap Y y$
noremap Q <nop>

map <silent> <leader>q :q<cr>
map <leader>w :w<cr>
map <leader>z :x<cr>

nmap <leader>`q :q!<CR>
nmap <leader>`a :qa!<CR>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
cmap <up> <nop>
cmap <down> <nop>
cmap <left> <nop>
cmap <right> <nop>
cmap <m-left> <nop>
cmap <m-right> <nop>
map <del> <nop>
imap <del> <nop>
cmap <del> <nop>

inoremap <c-a> <home>
cnoremap <c-a> <home>
inoremap <c-e> <end>
cnoremap <c-e> <end>
inoremap <c-b> <left>
cnoremap <c-b> <left>
inoremap <c-f> <right>
cnoremap <c-f> <right>
inoremap <c-d> <del>
cnoremap <c-d> <del>
inoremap <c-k> <c-o>D
cnoremap <c-k> <c-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
inoremap <m-b> <s-left>
cnoremap <m-b> <s-left>
inoremap <m-f> <s-right>
cnoremap <m-f> <s-right>
inoremap <m-d> <c-o>dw
cnoremap <m-d> <s-right><c-w>
inoremap <m-bs> <c-w>
cnoremap <m-bs> <c-w>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

map <c-t> <esc>:tabnew<cr>
map <m-n> <esc>:tabnew<cr>
map <silent> <m-q> :q<cr>
map <silent> <m-w> :w<cr>
for tab_number in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  execute 'map <m-' . tab_number . '> :tabnext ' . tab_number . '<cr>'
endfor
" <bs> is set as c-h in my iTerm2
" map <bs> gT
map <m-h> gT
" map <c-l> gt
map <m-l> gt
noremap <silent> <m-L> :+tabmove<cr>
map <silent> <leader>tc :tabclose<cr>
map <silent> <m-c> :tabclose<cr>
map <silent> <leader>tp :call MoveToPrevTab()<cr>
map <silent> <leader>tn :call MoveToNextTab()<cr>

map <silent> <m-d> <c-d>
map <silent> <m-u> <c-u>

nmap <leader>e :e $MYVIMRC<CR>
nmap <m-e> :e $MYVIMRC<CR>
nmap <leader>E :source $MYVIMRC<CR><esc>

nnoremap <leader><leader> <C-^>

nnoremap <silent> <esc> :nohlsearch<cr>:match<cr>:<cr>:ccl<cr>:lcl<cr>:silent! Tclose<cr>:NERDTreeClose<cr>
inoremap <silent> <esc> <esc>:NeoSnippetClearMarkers<cr>
snoremap <silent> <esc> <esc>:NeoSnippetClearMarkers<cr>

" f13 is c-; in my iTerm2
noremap <f13> mCA;<Esc>`C
inoremap <f13> <C-o>A;
" f14 is c-, in my iTerm2
noremap <f14> mCA,<Esc>`C
inoremap <f14> <C-o>A,

noremap <leader>n <c-w>w
noremap <leader>p <c-w>W
" map <m-j> <c-w>w
" map <m-k> <c-w>W

tnoremap <Esc> <C-\><C-n>

map <silent> <leader>op :silent! exe '!open ' . getcwd()<cr>
map <silent> <leader>od :silent! exe '!open ' . expand('%:h')<cr>
map <silent> <leader>of :silent! exe '!open %'<cr>
map <silent> <leader>ob :silent! exe '!open -a "Google Chrome" %'<cr>

map <silent> <leader>j mC:join<cr>`C

noremap $ $ze

map <silent> <m-]> :set virtualedit=all<cr>20zl
map <silent> <m-[> 20zh:call SetVirtualEdit()<cr>
nnoremap <silent> ^ ^:set virtualedit=<cr>ze
nnoremap <silent> $ $:set virtualedit=<cr>ze
vmap <silent> <m-]> 20zl
vmap <silent> <m-[> 20zh

map @- @:

map <leader>rr :e config/routes.rb<cr>
map <leader>rR :vnew config/routes.rb<cr>
map <leader>rs :e db/schema.rb<cr>
map <leader>rS :vnew<cr>:e db/schema.rb<cr>
map <leader>rg :e Gemfile<cr>
map <leader>rG :vnew Gemfile<cr>

noremap g; g;zz
noremap g, g,zz
noremap gi gi<c-o>zz

" inoremap <cr> <c-e><cr>
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

map <leader>9 i<space><esc>l
map <leader>0 a<space><esc>h

map <leader>2 @
map <leader>22 @@
" map <leader>1 :!
" cnoremap !1 silent !
map <leader>1 :silent !
map <leader>5 :%!

vnoremap . :normal .<cr>

nnoremap <c-g> :=<cr>

map <c-q> <nop>
map <c-q>x <nop>
map <c-q>" <nop>
map <c-q>% <nop>
for i in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  execute 'map <c-q>' . i . ' <nop>'
endfor

map <leader>ft :set filetype=

" map <m-v> :vsplit<cr>
" map <m-s> :split<cr>

"######################################
"### Plugins/functions key mappings ###
"######################################
imap <expr> <tab> TabComplete()
smap <expr> <tab> TabComplete()
xmap <expr> <tab> TabComplete()

nmap <c-s><c-g> :call ShowHighlightsUnderCursor()<CR>
nmap <c-s><c-a> :call ShowAllHighlights()<CR>

nmap <leader>k :call OpenNERDTreeBuffer()<CR>
nmap <silent> <f1> :NERDTreeToggle<CR>
nmap <silent> <leader><f1> :silent! NERDTreeFind<CR>

map <silent> <f2> :TagbarToggle<CR>
map <silent> <f3> :call ReadUndoFile()<cr>:GundoToggle<cr>
map <silent> <f4> :call BrowseCustomBackups()<cr>

nmap cm <Plug>Commentary
nmap cmm <Plug>CommentaryLine

map <leader>a :w<cr>:call neoterm#test#run('file')<cr>
map <leader>A :call neoterm#test#run('all')<cr>
map <leader>c :w<cr>:call neoterm#test#run('current')<cr>
map <leader>l :w<cr>:call neoterm#test#rerun()<cr>

map <leader>fmo :call MoveCurrentFile()<cr>
map <leader>fmv <leader>fmo
map <leader>fde :call DeleteCurrentFile()<cr>
map <leader>fdu :call DuplicateCurrentFile()<cr>
map <leader>fcp :call CopyCurrentFilePath()<cr>
map <leader>fcfp :call CopyCurrentFileFullPath()<cr>
map <leader>fcn :call CopyCurrentFileName()<cr>
map <leader>fn :call CreateNewFileInCurrentDir()<cr>
map <leader>fN :call CreateNewFile()<cr>

map <leader>fj :set filetype=json<cr>:%!jq '.'<cr>
vmap <leader>fj :!jq '.'<cr>
map <leader>fh :silent %!tidy -qi --show-errors 0<cr>
map <leader>fx :silent %!tidy -qi -xml --show-errors 0<cr>
" https://github.com/beautify-web/js-beautify
map <leader>fb :set filetype=javascript<cr>:%!js-beautify<cr>
vmap <leader>fb :!js-beautify<cr>

nnoremap <leader>m :call ToggleTestInCurrentWindow()<cr>
nnoremap <leader>v :call ToggleTestInSplitWindow()<cr>

noremap <silent> <c-z> :call OnVimSuspend()<cr>:suspend<cr>:call OnVimResume()<cr>

map <m-t> :call ToggleQuotes()<cr>
imap <m-t> <c-o>:call ToggleQuotes()<cr>
cnoremap <m-t> <c-e><c-w>"" <left><left>
" map <m-o> :call ToggleQuotes()<cr>
" imap <m-o> <c-o>:call ToggleQuotes()<cr>

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map <leader>i :CtrlPBufTag<cr>

map <c-j> ]e
map <c-k> [e
xmap <c-j> ]egv
xmap <c-k> [egv

" f15 is c-cr in my iTerm2
map <f15> ]<space>
imap <f15> <end><cr>
" f16 is s-cr in my iTerm2
map <f16> [<space>
imap <f16> <esc>O

nnoremap <leader>ff :FullSearch -Q -i '' <left><left>
nmap <silent> <leader>yf :set opfunc=FullSearchVerb<CR>g@
nmap <leader>fw <leader>yfiw
nmap <leader>fW <leader>yfiW
vmap <leader>ff y:let @/ = GetSelectionForSearches()<cr><leader>ff<c-r>=@/<cr>
cnoremap <c-l> <end><space>-G '\.'<space><left><left>
cnoremap <c-g> <end><space>-G ''<space><left><left>
nmap <leader>fo :Gqfopen<cr>

" map <m-w> <Plug>CamelCaseMotion_w
" map <m-b> <Plug>CamelCaseMotion_b
" map <m-e> <Plug>CamelCaseMotion_e
" map <m-g><m-e> <Plug>CamelCaseMotion_ge

nmap <leader>-- @:
nmap <leader>-b :call DeleteHiddenBuffers()<cr>
nmap <leader>-u :call ClearUndos()<cr>
nmap <leader>-k :call ResetProject()<cr>

map <leader>rm :call ShowLatestMigration()<cr>
map <leader>rM :vnew<cr>:call ShowLatestMigration()<cr>
vmap <leader>rp :<c-u>call ExtractRailsPartial()<cr>

map <leader>rn :call NewPlaygroundBuffer('ruby')<cr>
" map <leader>u :call PreserveView('Topen')<cr>:TREPLSendFile<cr>
map <leader>u :call EvaluateCode()<cr>

map gR gr$

map <silent> <leader>om :call OpenMarkdownPreview()<cr>

nnoremap <m-g> :call FindAllMultipleCursors(0)<cr>
vnoremap <m-g> :call FindAllMultipleCursors(1)<cr>

map <leader>yq :call MakeSession()<cr>:qa<cr>
map <leader>yl :call LoadSession()<cr>

" map <leader>yp "0p
" map <leader>yP "0P

nmap <silent> <leader>h <leader>yghiw
nmap <silent> <leader>H <leader>yhiW
nmap <silent> <leader>yh :set opfunc=HighlightOccurencesVerb<CR>g@
nmap <silent> <leader>ygh :set opfunc=HighlightWholeOccurencesVerb<CR>g@

nmap <silent> <leader>d <leader>ygdiw
nmap <silent> <leader>D <leader>ydiW
nmap <silent> <leader>yd :set opfunc=ChangeOccurenceVerb<CR>g@
nmap <silent> <leader>ygd :set opfunc=ChangeWholeOccurenceVerb<CR>g@

nmap <leader>x :%s/
nmap <leader>X <leader>yxiw
nmap <silent> <leader>yx :set opfunc=GlobalSubstituteVerb<CR>g@
nmap <leader>yX <leader>yxiW
vmap <leader>x <Esc>:%s/<c-r>=GetSelectionForSearches()<cr>/

nmap <leader>s :s/
nmap <leader>S <leader>ysiw
nmap <silent> <leader>ys :set opfunc=SubstituteVerb<CR>g@
nmap <leader>yS <leader>ysiW
vmap <leader>s :s/\%V

nmap <leader>8 *
xmap <leader>8 *
nnoremap <silent> <leader>y8 :set opfunc=SearchNextOccurenceVerb<cr>g@
xnoremap * <Esc>/<c-r>=GetSelectionForSearches()<cr><cr>
xnoremap # <Esc>?<c-r>=GetSelectionForSearches()<cr><cr>

command! -nargs=+ -complete=file FullSearch call FullSearch(<q-args>)
command! Gmodified call GitOpenModifiedFiles()
command! Lint call Lint()

cabbrev plugi PlugInstall
cabbrev plugc PlugClean
cabbrev plugu PlugUpdate
cabbrev goyo Goyo
cabbrev tnew Tnew
cabbrev gblame Gblame
cabbrev gb Gblame
cabbrev glog Glog
cabbrev gdiff Gdiff
cabbrev gd Gdiff
cabbrev gmodif Gmodified
cabbrev gm Gmodified
cabbrev co copen
cabbrev qf copen
cabbrev lo lopen
cabbrev lint Lint
cabbrev vn vnew
cabbrev en enew
cabbrev ne new
cabbrev hn new

xnoremap @ :<C-u>call ExecuteMacroOnSelection()<cr>
xnoremap <leader>2 :<C-u>call ExecuteMacroOnSelection()<cr>

map zs zt
noremap z0 zs
map gs gS
map gj gJ

noremap <silent> <m-.> :call GoToLastActiveTab()<cr>
nnoremap <silent> <Leader>b :BufExplorerHorizontalSplit<cr>

map <m-p> :CtrlP<cr>

"#############################
"### General configuration ###
"#############################
set nocompatible
filetype plugin indent on
if !exists('syntax_on')
  syntax on
endif
" let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
" set completeopt+=noinsert
set fileformat=unix
set number relativenumber numberwidth=5
set expandtab tabstop=2 shiftwidth=2 autoindent smarttab
set incsearch ignorecase smartcase hlsearch
set noshowmatch
set nrformats-=octal
set noerrorbells visualbell t_vb=
set history=500
set backspace=indent,eol,start
set shortmess+=Ic
set laststatus=2
set mouse=a
set title titlestring=%{GetCwd()}
set splitbelow splitright
set nowrap
set noswapfile
set clipboard=unnamed
set hidden
set notimeout
set textwidth=0 colorcolumn=80
set ruler
set tags=./.tags;
set showcmd
set autoread
set nostartofline
set wildmenu
set fillchars+=vert:\ "
set complete=.,w
" set complete=.,w,b,u,t
set grepprg=ag
set nofoldenable
set gdefault

set statusline=\ %<%f
" set statusline+=\ %{GetLintCount()>0?'[!]':''}
set statusline+=\ %{&modified?'[+]':''}
set statusline+=%h%r
set statusline+=%=
set statusline+=%{GetLintMsg()}
set statusline+=\ \ %-14.(%l,%c%)
set statusline+=\ %P

let undodir = expand('~/.vim/tmp/undo')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
set undodir=~/.vim/tmp/undo

let g:terminal_scrollback_buffer_size = 10000
set tabline=%!GetTabLine()
set pumheight=8
set nojoinspaces
set conceallevel=2 concealcursor=niv
set sessionoptions-=options
set sidescroll=1 sidescrolloff=3
set wildignorecase

" set inccommand=nosplit

"#############################
"### Plugins configuration ###
"#############################
let g:ctrlp_user_command = 'ag %s -l --skip-vcs-ignores --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'top,order:ttb,min:45,max:45'
let g:ctrlp_max_height = 45
let g:ctrlp_reuse_window = 'nerdtree\|netrw'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_lazy_update = 100
let g:ctrlp_prompt_mappings = {
      \ 'PrtHistory(1)':        ['<c-p>', '<m-p>'],
      \ 'PrtHistory(-1)':       ['<c-n>', '<m-n>'],
      \ 'AcceptSelection("t")': ['<c-t>', '<m-t>']
      \ }

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

let g:netrw_altfile = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
      \
      \ '\.tags$', '\.tags_sorted_by_file$', '\.gemtags$', '\.pyc$', '\.pyo$',
      \ '\.exe$', '\.dll$', '\.obj$', '\.o$', '\.a$', '\.lib$', '\.so$',
      \ '\.dylib$', '\.ncb$', '\.sdf$', '\.suo$', '\.pdb$', '\.idb$',
      \ '\.DS_Store$', '\.class$', '\.psd$', '\.db$', '\.gitkeep$', '\.keep',
      \
      \ '^\.svn$', '^\.git$', '^\.hg$', '^\CVS$', '^\.idea$', '^\.bundle$',
      \ '^\.sass-cache$', '^tmp$', '^log$', '\^coverage$'
      \ ]
let NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:incsearch#auto_nohlsearch = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 0
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:neoterm_rspec_lib_cmd = 'clear && echo && bin/rspec'
let g:neoterm_keep_term_open = 1
let g:neoterm_size = 11
let g:neoterm_focus_when_tests_fail = 1

let g:tagbar_sort = 0

let g:rails_no_syntax = 1
let g:rails_single_quotes_style = 1
let g:unimpaired_no_toggling = 1

let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory='~/.vim/my-snippets'

let g:user_emmet_mode = 'i'
let g:user_emmet_settings = {
      \ 'variables': {
      \   'charset': 'utf-8',
      \ },
      \ 'css': {
      \   'snippets': {
      \     'pos': 'position:|;',
      \     'pos:s': 'position:static;',
      \     'pos:a': 'position:absolute;',
      \     'posa': 'position:absolute;',
      \     'pos:r': 'position:relative;',
      \     'pos:f': 'position:fixed;',
      \     'd': 'display:|;',
      \     'db': 'display:block|;',
      \     'w100': 'width:100%|;',
      \     'h100': 'height:100%|;',
      \     'v': 'visibility:|;',
      \     'ov': 'overflow:|;',
      \     'ovx': 'overflow-x:|;',
      \     'ovy': 'overflow-y:|;',
      \     'ovs': 'overflow-style:|;',
      \     'bxz': 'box-sizing:|;',
      \     'mar': 'max-resolution:|;',
      \     'mir': 'min-resolution:|;',
      \     'olc': 'outline-color:#|;',
      \     'bdc': 'border-color:#|;',
      \     'bdf': 'border-fit:|;',
      \     'bdt+': 'border-top:|;',
      \     'bdtc': 'border-top-color:#|;',
      \     'bdr+': 'border-right:|;',
      \     'bdrc': 'border-right-color:#|;',
      \     "bdb+": 'border-bottom:|;',
      \     'bdbc': 'border-bottom-color:#|;',
      \     'bdl+': 'border-left:|;',
      \     'bdlc': 'border-left-color:#|;',
      \     'bg': 'background:#|;',
      \     'bg+': 'background:|;',
      \     'bgc': 'background-color:#|;',
      \     'bgp': 'background-position:|;',
      \     'bgcp': 'background-clip:|;',
      \     'c': 'color:#|;',
      \     'c:r': 'color:rgb(|);',
      \     'c:ra': 'color:rgba(|);',
      \     'cm': '/* || */',
      \     'va': 'vertical-align:|;',
      \     'ta': 'text-align:|;',
      \     'td': 'text-decoration:|;',
      \     'tov': 'text-overflow:|;',
      \     'to+': 'text-outline:|;',
      \     'tt': 'text-transform:|;',
      \     'wm': 'writing-mode:|;',
      \     'f+': 'font:|;',
      \     'fs': 'font-style:|;',
      \     'cur': 'cursor:|;',
      \     'us': 'user-select:|;',
      \   },
      \ },
      \ }
let s:emmetElements = [
      \ 'a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article',
      \ 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big',
      \ 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center',
      \ 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details',
      \ 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset',
      \ 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset',
      \ 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input',
      \ 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map',
      \ 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes',
      \ 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p',
      \ 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp',
      \ 'script', 'section', 'select', 'small', 'source', 'span', 'strike',
      \ 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td',
      \ 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track',
      \ 'tt', 'u', 'ul', 'var', 'video', 'wbr',
      \
      \ 'emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd',
      \ 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap',
      \ 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out',
      \ 'det', 'acr', 'opt'
      \ ]

let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSplitHorzSize = 15
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowTabBuffer = 1
let g:bufExplorerShowNoName = 1
hi link bufExplorerAltBuf bufExplorerCurBuf

let g:multi_cursor_insert_maps = { 'j': 1 }

let g:session_directory = '~/.vim/tmp/sessions'
let g:session_lock_enabled = 0
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_menu = 0

let s:repls = {
      \ 'ruby': 'irb --simple-prompt',
      \ 'python': 'python -ic ""'
      \ }

let s:custom_backup_dir='~/.vim_custom_backups'

let g:neomake_verbose = 0
let g:neomake_place_signs = 0
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_highlight_columns = 0

let MRU_Window_Height = 10
hi link MRUFileName String

let s:last_active_tab_number = 1

"#################
"### Functions ###
"#################
function! TabComplete()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  elseif IsEmmetExpandable()
    return "\<plug>(emmet-expand-abbr)"
  else
    return "\<tab>"
  endif
endfunction

function! IsEmmetExpandable()
  if &filetype !~ 'html\|css' | return 0 | endif
  if !emmet#isExpandable() | return 0 | endif
  if &filetype =~ 'css' | return 1 | endif

  let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
  return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
endfunction

function! TrimTrailingWhitespace()
  if &filetype == 'markdown' | return | endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

function! ShowHighlightsUnderCursor()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! ShowAllHighlights()
  redir @z
  silent hi
  redir END
  tabnew
  setlocal buftype=nofile
  normal "zpdd
endfunction

function! ChooseColorScheme()
  if &filetype =~ 'qf\|diff\|gundo\|nerdtree\|tagbar' || expand('%') =~ '^['
    return
  endif

  if &filetype =~ 'javascript'
    call ChangeColorScheme('spearmint_custom')
  else
    call ChangeColorScheme('railscasts_custom')
  end
endfunction

function! ChangeColorScheme(target_color_scheme)
  if !exists('g:colors_name') || a:target_color_scheme != g:colors_name
    exec 'colorscheme ' . a:target_color_scheme
  endif
endfunction

function! OpenNERDTreeBuffer()
  if bufexists('NERD_tree_1')
    buffer NERD_tree_1
  else
    let alternate_buffer = bufnr('%')
    silent edit .
    if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
  end
endfunction

function! DeleteCurrentFile()
  let answer = input('Delete current file? ', 'y')
  if answer == 'y'
    exec ':silent !rm ' . expand('%')
  endif
endfunction

function! MoveCurrentFile()
  let old_file = expand('%')
  let new_file = input('New location: ', old_file, 'file')
  if new_file != '' && new_file != old_file
    let alternate_buffer = @#
    if bufexists(new_file) | exec 'bd! ' . new_file | endif
    exec ':silent !mkdir -p `dirname ' . new_file . '`'
    exec ':silent !mv ' . old_file . ' ' . new_file
    exec ':edit! ' . new_file
    exec 'bd! ' . old_file
    if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
  endif
endfunction

function! RenameCurrentFile()
  let old_name = expand('%:t')
  let new_name = input('New name: ', old_name, 'file')
  if new_name != '' && new_name != old_name
    let dir = expand('%:h')
    let old_file = expand('%')
    let new_file = (dir == '.') ? (new_name) : (dir . '/' . new_name)
    if new_file != old_file
      let alternate_buffer = @#
      if bufexists(new_file) | exec 'bd! ' . new_file | endif
      exec ':silent !mv ' . old_file . ' ' . new_file
      exec ':edit! ' . new_file
      exec 'bd! ' . old_file
      if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
    endif
  endif
endfunction

function! DuplicateCurrentFile()
  let old_file = expand('%')
  let new_file = input('Duplicate as: ', old_file, 'file')
  if new_file != '' && new_file != old_file
    if bufexists(new_file) | exec 'bd! ' . new_file | endif
    exec ':saveas! ' . new_file
  endif
endfunction

function! CopyCurrentFilePath()
  let @+=expand('%')
endfunction

function! CopyCurrentFileFullPath()
  let @+=expand('%:p')
endfunction

function! CopyCurrentFileName()
  let @+=expand('%:t')
endfunction

function! CreateNewFile()
  let new_file = input('New file: ', '', 'file')
  if new_file != ''
    exec ':e ' . new_file
    w
  endif
endfunction

function! CreateNewFileInCurrentDir()
  let path = expand('%:h')
  if path == '.'
    let path = ''
  endif
  if path != ''
    let path .= '/'
  endif

  let new_file = input('New file: ', path, 'file')
  if new_file != '' && new_file != path
    exec ':e ' . new_file
    w
  endif
endfunction

function! ToggleTestForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1
             \ || match(current_file, '\<models\>') != -1
             \ || match(current_file, '\<views\>') != -1
             \ || match(current_file, '\<helpers\>') != -1
             \ || match(current_file, '\<jobs\>') != -1
             \ || match(current_file, '\<mailers\>') != -1
             \ || match(current_file, '\<services\>') != -1
  if going_to_spec
    let new_file = substitute(new_file, '^app/', '', '')
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

function! ToggleTestInCurrentWindow()
  let new_file = ToggleTestForCurrentFile()
  exec ':e ' . new_file
endfunction

function! ToggleTestInSplitWindow()
  let new_file = ToggleTestForCurrentFile()
  exec ':vsplit ' . new_file
endfunction

function! ToggleQuotes()
  let before = getline('.')[col('^'):(col('.')-1)]
  let after = getline('.')[(col('.')):col('$')]
  normal mC
  if before =~ '""$'
    normal hxxi''
  elseif before =~ '"$' && after =~ '^"'
    normal xxi''
  elseif before =~ "''$"
    normal hxxi""
  elseif before =~ "'$" && after =~ "^'"
    normal xxi""
  elseif before =~ '"' && after =~ '"'
    normal cs"'
  elseif before =~ "'" && after =~ "'"
    normal cs'"
  end
  normal `C
endfunction

function! OnVimSuspend()
  silent! wa
endfunction

function! OnVimResume()
  silent! checktime
endfunction

function! OnHelpDisplayed()
  wincmd _
  map <buffer> <cr> <c-]>
  map <buffer> q :bd<cr>
endfunction

function! OnQuickFixDisplayed()
  map <buffer> <cr> <cr>:ccl<cr>
  noremap <buffer> <f30> <cr>
  map <buffer> o <f30><c-w><c-w>
  map <buffer> q :q<cr>
endfunction

function! OnNERDTreeDisplayed()
  map <buffer> J 5j
  map <buffer> K 5k
  map <buffer> <silent> o :call PreviewNERDTreeNode()<cr>
  map <buffer> <esc> :let t:escaped_nerdtree = 1<cr>q
  map <buffer> <f1> q

  if exists('t:last_bufnum')
    let t:nerdtree_original_bufnum = t:last_bufnum
  endif
endfunction

function! SaveCurrentBufNum()
  let t:last_bufnum = bufnr('%')
endfunction

function! RestoreNerdtreeOriginalBuffer()
  if exists('t:escaped_nerdtree')
    \ && exists('t:nerdtree_original_bufnum')
    \ && bufnr('%') != t:nerdtree_original_bufnum
    exe 'buffer ' . t:nerdtree_original_bufnum
    unlet t:nerdtree_original_bufnum
  endif
  if exists('t:escaped_nerdtree') | unlet t:escaped_nerdtree | endif
endfunction

function! OnExtraditeDisplayed()
  if exists('s:browsing_custom_backups')
    map <silent><buffer> <f4> q:q<cr>
    unlet s:browsing_custom_backups
  endif
  setlocal norelativenumber
endfunction

function! OnNeotermDisplayed()
  nmap <silent><buffer> <esc> <c-w>p:Tclose<cr>
  nmap <buffer> q <esc>
  noremap <silent><buffer> <cr> :call OpenFileInPreviousWindow(0)<cr>
  noremap <silent><buffer> o :call OpenFileInPreviousWindow(1)<cr><c-w>p
  noremap <buffer> <f15> ^f.<c-w>gF
endfunction

function! OnFullSearchDisplayed()
  noremap <silent><buffer> <cr> :call OpenFullSearchResult(0)<cr>
  nmap <buffer> o <cr>
  noremap <silent><buffer> t :call OpenFullSearchResult(1)<cr>
endfunction

function! OnBufExplorerDisplayed()
  if !exists('b:mappings_defined')
    map <buffer> <esc> q
    let b:mappings_defined = 1
  endif
endfunction

function! OnMRUDisplayed()
  map <buffer> <esc> q
endfunction

function! PreviewNERDTreeNode()
  let line = getline('.')
  if line =~ '\(▸\|▾\)'
    call nerdtree#ui_glue#invokeKeyMap('o')
  elseif line !~ '^/'
    normal go
  endif
endfunction

function! FullSearch(search_options)
  if IsCurrentBufferNew() || bufname('%') =~ 'ag -C \|NERD_tree'
    enew
  else
    tabnew
  endif

  let search_options = split(a:search_options)
  let search_options_count = len(search_options)
  let search_text = search_options[0]
  let i = 1
  while search_text =~ '^-' && i < search_options_count
    let search_text = search_options[i]
    let i = i + 1
  endwhile
  let search_text = substitute(search_text, '^.\(.*\).$', '\1', '')

  let @/ = EscapeStringForSearches(search_text)
  exe ':silent grep! ' . a:search_options
  call termopen('ag -C ' . a:search_options)
endfunction

function! ResetProject()
  for num in range(1, bufnr('$'))
    if buflisted(num) && bufname(num) != 'NERD_tree_1'
      silent exec 'bd! ' . num
    endif
  endfor

  call OpenNERDTreeBuffer()
  silent! let @# = ''
  normal ggX^
  call ChangeColorScheme('railscasts_custom')
endfunction

function! ClearUndos()
  set undoreload=0
  silent edit!
  echo 'Undos cleared.'
endfunction

function! DeleteHiddenBuffers()
  let open_buffers = []
  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr('$') + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec 'bd! ' . num
    endif
  endfor
endfunction

function! GetLintCount()
  let counts = neomake#statusline#LoclistCounts()
  return get(counts, 'E', 0) + get(counts, 'W', 0)
endfunction

function! GetLintMsg()
  let counts = neomake#statusline#LoclistCounts()
  let error_count = get(counts, 'E', 0)
  let warning_count = get(counts, 'W', 0)
  if error_count + warning_count == 0 | return '' | endif

  let count_msgs = []
  if error_count > 0 | call add(count_msgs, 'E:' . error_count) | endif
  if warning_count > 0 | call add(count_msgs, 'W:' . warning_count) | endif
  return '[' . join(count_msgs, ',') . ']'
endfunction

function! WriteUndoFile()
  let undofile = escape(undofile(expand('%')), '%')
  exec 'wundo ' . undofile
endfunction

function! ReadUndoFile()
  let undofile = undofile(expand('%'))
  if filereadable(undofile)
    let undofile = escape(undofile,'%')
    exec 'rundo ' . undofile
  endif
endfunction

function! BackupCurrentFile()
  if !isdirectory(expand(s:custom_backup_dir))
    let cmd = 'mkdir -p ' . s:custom_backup_dir . ';'
    let cmd .= 'cd ' . s:custom_backup_dir . ';'
    let cmd .= 'git init;'
    call system(cmd)
  endif
  let file = expand('%:p')
  let file_dir = s:custom_backup_dir . expand('%:p:h')
  let backup_file = s:custom_backup_dir . file
  let cmd = ''
  if !isdirectory(expand(file_dir))
    let cmd .= 'mkdir -p ' . file_dir . ';'
  endif
  let cmd .= 'cp ' . file . ' ' . backup_file . ';'
  let cmd .= 'cd ' . s:custom_backup_dir . ';'
  let cmd .= 'git add ' . backup_file . ';'
  let cmd .= 'git commit -m "Backup - `date`";'
  call system(cmd)
endfunction

function! BrowseCustomBackups()
  exe 'vsplit ' . s:custom_backup_dir . expand('%:p')
  set ro
  map <buffer> q :q<cr>
  wincmd r
  let s:browsing_custom_backups = 1
  silent! Extradite
endfunction

function! OpenFileInPreviousWindow(highlight_line)
  let file_and_line = GetFileAndLineUnderCursor()
  if !empty(file_and_line)
    wincmd p
    exe 'e ' . file_and_line[0]
    exe file_and_line[1]
    normal zz
    if a:highlight_line
      exe 'match Search /\%' . file_and_line[1] . 'l/'
    endif
  endif
endfunction

function! GetFileAndLineUnderCursor()
  normal mC^f:
  let items = split(expand('<cWORD>'), ':')
  normal `C
  if len(items) >= 2 && filereadable(items[0])
    return items[0:1]
  endif
endfunction

function! OpenFullSearchResult(new_tab)
  if getline('.') == '' | return | endif
  let line = matchstr(getline('.'), '^\d\+')
  normal mC
  if line != ''
    normal {
    if getline('.') == ''
      normal j
    endif
  endif
  let file = getline('.')
  normal `C
  if file != ''
    if a:new_tab | tabnew | endif
    exe 'e ' . file
    if line != ''
      exe line
    endif
  endif
endfunction

function! GetTabLine()
  let line = ''
  for i in range(tabpagenr('$'))
    let line .= (i+1 == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#'
    let line .= '%' . (i + 1) . 'T'
    let line .= ' %{GetTabLabel(' . (i + 1) . ')} '
  endfor
  let line .= '%#TabLineFill#%T'
  return line
endfunction

function! GetTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  " let winnr = tabpagewinnr(a:n)
  " let file = bufname(buflist[winnr - 1])
  let file = bufname(buflist[0])
  let file = fnamemodify(file, ':p:t')
  if file == ''
    let file = '[No Name]'
  endif
  return file
endfunction

function! GetCwd()
  return fnamemodify(getcwd(), ':t')
endfunction

function! BufEnterConfig()
  let buffer_name = bufname('%')

  if buffer_name == '[Global Replace]'
    map <buffer><Leader>fr :Greplace<cr>
    map <buffer><Leader>fR :call feedkeys("\<space>fra")<cr>
  else
    map <buffer><leader>fre :call RenameCurrentFile()<cr>
    map <buffer><leader>frm <buffer><leader>fde
    map <buffer><silent> <leader>fru :MRU<cr>
  endif

  if buffer_name !~ 'NERD_tree'
    map <buffer> m, mO
    map <buffer> `, `O
    map <buffer> ', `O
    map <buffer> <leader>, `O
  endif

  exe ':match'
endfunction

function! GitOpenModifiedFiles()
  silent only
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  if empty(filenames) | echo 'No modified files!' | return | endif
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
  wincmd w
endfunction

function! ConfigureLargeFiles()
  let max_line_length = max(map(range(1, line('$')), "col([v:val, '$'])")) - 1

  if max_line_length > 1000
    setlocal synmaxcol=153
  endif
endfunction

function! ShowLatestMigration()
  let alternate_buffer = bufnr('%')
  enew
  set ft=ruby
  exec ':Emigration'
  if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
endfunction

function! ExtractRailsPartial()
  let name = input('Partial name: ', '')
  if name != ''
    exec "'<,'>Rextract " . name
  endif
endfunction

function! IsCurrentBufferNew()
  return bufname('%') == '' && IsCurrentBufferEmpty()
endfunction

function! IsCurrentBufferEmpty()
  return line('$') == 1 && getline(1) == ''
endfunction

function! OpenMarkdownPreview()
  if !exists('s:markdown_preview_job')
    " https://github.com/joeyespo/grip
    let s:markdown_preview_job = jobstart('grip')
  endif
  silent exec '!open http://localhost:6419/' . expand('%')
endfunction

function! FindAllMultipleCursors(visual_mode)
  let search = ''

  if a:visual_mode
    let search = GetSelectionForSearches()
  else
    let search = expand('<cword>')
  endif

  exe 'MultipleCursorsFind ' . search
endfunction

function! NewPlaygroundBuffer(file_type)
  if bufexists('[playground]')
    bd! \[playground\]
  endif
  if IsCurrentBufferNew()
    enew
  else
    tabnew
  endif
  file [playground]
  setlocal buftype=nofile
  exe 'set filetype=' . a:file_type

  call neoterm#repl#set('clear && ' . s:repls[a:file_type])
endfunction

function! MakeSession()
  exe ':silent SaveSession! ' . GetCwd()
  echo 'Session saved.'
endfunction

function! LoadSession()
  exe ':silent OpenSession ' . GetCwd()
  set conceallevel=2 concealcursor=niv
  echo 'Session loaded.'
endfunction

function! SaveCurrentTabNumber()
  let s:current_tab_number = tabpagenr()
endfunction

function! CustomCloseTab()
  if s:current_tab_number == 1 | return | endif
  exe 'tabnext' . (s:current_tab_number - 1)
endfunction

function! GoToLastActiveTab()
  exe 'tabnext' . s:last_active_tab_number
endfunction

function! HighlightOccurencesVerb(type)
  exe 'normal! `[v`]y'
  let @/ = EscapeStringForSearches(@")
  exe 'match Search /' . @/ . '/'
endfunction

function! HighlightWholeOccurencesVerb(type)
  exe 'normal! `[v`]y'
  let @/ = '\<' . EscapeStringForSearches(@") . '\>'
  exe 'match Search /' . @/ . '/'
endfunction

function! ChangeOccurenceVerb(type)
  exe 'normal! `[v`]y'
  let @/ = EscapeStringForSearches(@")
  exe 'match Search /' . @/ . '/'
  call feedkeys('cgn', 'n')
endfunction

function! ChangeWholeOccurenceVerb(type)
  exe 'normal! `[v`]y'
  let @/ = '\<' . EscapeStringForSearches(@") . '\>'
  exe 'match Search /' . @/ . '/'
  call feedkeys('cgn', 'n')
endfunction

function! FullSearchVerb(type, ...)
  exe 'normal! `[v`]y'
  let @/ = @"
  let cmd = ":FullSearch -i -Q '" . @/ . "' \<left>\<left>"
  call feedkeys(cmd, 'n')
endfunction

function! GlobalSubstituteVerb(type, ...)
  exe 'normal! `[v`]y'
  let @/ = @"
  call feedkeys(':%s/' . @/ . '/', 'n')
endfunction

function! SubstituteVerb(type, ...)
  exe 'normal! `[v`]y'
  let @/ = @"
  call feedkeys(':s/' . @/ . '/', 'n')
endfunction

function! SearchNextOccurenceVerb(type, ...)
  exe 'normal! `[v`]y'
  let @/ = EscapeStringForSearches(@")
  call feedkeys('n', 'n')
endfunction

function! GetSelectionForSearches() range
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  normal! ""gvy
  let selection = getreg('"')

  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  let escaped_selection = EscapeStringForSearches(selection)

  return escaped_selection
endfunction

function! EscapeStringForSearches(string)
  let string=a:string
  let string = escape(string, '^$.*\/~[]')
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

function! PreserveView(cmd)
  let view = winsaveview()
  execute a:cmd
  call winrestview(view)
endfunction

function! ExecuteMacroOnSelection()
  exe ":'<,'>normal @" . nr2char(getchar())
endfunction

function! OnGoyoEnter()
  silent !tmux set status off
  setlocal foldcolumn=0
endfunction

function! OnGoyoLeave()
  silent !tmux set status on
  if &filetype == 'markdown'
    setlocal foldcolumn=5
  endif
endfunction

function! SetVirtualEdit()
  let absolute_col = virtcol('.') + pyeval('vim.current.window.col')
  let absolute_col += &foldcolumn + (&number ? &numberwidth : 0)

  let is_on_leftmost_screen = screencol() == absolute_col

  if is_on_leftmost_screen
    setlocal virtualedit=
  else
    setlocal virtualedit=all
  endif
endfunction

function! Lint()
  if &buftype != '' | return | endif

  if &filetype =~ 'javascript'
    Neomake eslint
  else
    Neomake
  end
endfunction

function! EvaluateCode()
  call PreserveView('Topen')
  wincmd w
  call feedkeys("i\<c-l>\<esc>\<c-w>w:TREPLSendFile\<cr>")
endfunction

function! MoveToPrevTab()
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vsplit
  else
    close!
    exe "0tabnew"
  endif
  exe "b".l:cur_buf
endfunction

function! MoveToNextTab()
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    vsplit
  else
    close!
    tabnew
  endif
  exe "b".l:cur_buf
endfunc

"####################
"### Autocommands ###
"####################

augroup improved_autowrite
  autocmd!
  autocmd FocusLost,BufLeave * silent! wa
augroup end

augroup improved_autoread
  autocmd!
  autocmd FocusGained,BufEnter * silent! checktime
augroup end

augroup auto_mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand('<afile>:p:h')) |
      \ call mkdir(expand('<afile>:p:h'), 'p') |
    \ endif
augroup end

augroup detect_filetypes
  autocmd!
  autocmd BufRead,BufNewFile *spec.rb set ft=ruby.rspec
  autocmd BufRead,BufNewFile *.html.erb set ft=eruby.html
  autocmd BufRead,BufNewFile *.js.erb set ft=eruby.javascript
  autocmd BufRead,BufNewFile *.js.es6 set ft=javascript.es6
  autocmd BufRead,BufNewFile *.js.es6.erb set ft=eruby.javascript.es6
  autocmd BufRead,BufNewFile *.nfo,*.NFO set ft=nfo
augroup end

augroup custom_backup
  autocmd!
  autocmd BufWritePost * call BackupCurrentFile()
augroup end

augroup custom_undofile
  autocmd!
  autocmd BufWritePost * call WriteUndoFile()
augroup end

augroup on_display_events
  autocmd!
  autocmd filetype help call OnHelpDisplayed()
  autocmd filetype qf call OnQuickFixDisplayed()
  autocmd filetype nerdtree call OnNERDTreeDisplayed()
  autocmd filetype extradite call OnExtraditeDisplayed()
  autocmd filetype mru call OnMRUDisplayed()
  autocmd TermOpen *neoterm* call OnNeotermDisplayed()
  autocmd TermOpen *ag\ * call OnFullSearchDisplayed()
  autocmd BufEnter \[BufExplorer\] call OnBufExplorerDisplayed()
augroup end

augroup nerdtree_original_buffer
  autocmd!
  autocmd BufLeave * call SaveCurrentBufNum()
  autocmd BufEnter * call RestoreNerdtreeOriginalBuffer()
augroup end

if exists('$TMUX') && !exists('$DISABLE_VIM_WINDOW_RENAME')
  augroup tmux_title
    autocmd!
    autocmd VimEnter * call system("tmux rename-window -t $TMUX_PANE '" . GetCwd() . "'")
    autocmd VimLeave * call system('tmux setw automatic-rename')
  augroup end
endif

augroup custom_tab_behavior
  autocmd!
  autocmd TabEnter * let s:current_tab_number = tabpagenr()
  autocmd TabClosed * call CustomCloseTab()
  autocmd TabLeave * let s:last_active_tab_number = tabpagenr()
augroup end

augroup goyo_events
  autocmd!
  autocmd User GoyoEnter nested call OnGoyoEnter()
  autocmd User GoyoLeave nested call OnGoyoLeave()
augroup end

augroup lint_events
  autocmd!
  autocmd BufWritePost,BufEnter,FocusLost * call Lint()
augroup end

augroup general_autocommands
  autocmd!
  autocmd BufWritePre * call TrimTrailingWhitespace()
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufEnter,Filetype * call ChooseColorScheme()
  autocmd InsertLeave * silent! set nopaste
  autocmd BufRead,BufNewFile *_spec.rb set syntax=rspec
  autocmd BufEnter * call BufEnterConfig()
  autocmd BufRead * call ConfigureLargeFiles()
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
augroup end
