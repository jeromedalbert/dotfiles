"############
"### TODO ###
"############

" Karabiner: use tab system wide for esc, c-h, etc
" have a shortcut for TODO / notes per project
" open backup git diff in new tmux pane
" use projectionist for test alternates and other alternates?
" make tmux cmd+e a real tmux pane that auto closes if previous command was successful
" improve tmux window renaming
" make <leader>d work on selection
" use very magic by default when searching?
" list instance variables with <leader>I
" maybe use p for preview and o for preview+go to the file
" when <cr>ing in a filesearch, rewind quickfix to closest previous match
" make tests shortcut go to the right window if there is one open for that file
" make custom 'search hit bottom' (or use a search count custom function or plugin)
" use fzf for command line git, tmux session switching, etc
" make enter inside html tags make an additional newline with indent (integrate with delimitmate, or custom script)
" fix bug when sometimes closing an html tag switches to previous buffer
" fix * register getting overridden when selecting in neosnippet (or try different snippet plugin, investigate ultisnip)
" don't press enter twice on completion popup (or try different completion plugin)
" optimize or replace nerdtree for large projects
" refresh nerdtree after renaming
" Limit overlinting when quickly switching buffers (especially :cdo and replaces)
" improve greplace speed by not redrawing or using cdo
" switch to Vim 8 when terminal support is released

"###############
"### Plugins ###
"###############
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'neomake/neomake'
Plug 'jlanzarotta/bufexplorer'
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby.html', 'css', 'scss', 'javascript.jsx'] }

Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'othree/html5.vim', { 'for': ['html', 'eruby.html'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'eruby.html'] }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'keith/swift.vim', { 'for': 'swift' }

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'inkarkat/argtextobj.vim'
Plug 'tek/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'whatyouhide/vim-textobj-erb', { 'for': 'eruby' }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive', { 'on': ['Gdiff', 'Glog', 'Gblame'] }
Plug 'jeromedalbert/vim-rails', { 'for': 'ruby' }
Plug 'jeromedalbert/vim-unimpaired'

Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'skwp/greplace.vim', { 'on': ['Gqfopen', 'Greplace'] }
Plug 'Raimondi/delimitMate'
Plug 'kurkale6ka/vim-pairs'
Plug 'valloric/MatchTagAlways', { 'for': ['html', 'eruby.html', 'xml', 'javascript.jsx'] }
Plug 'vim-scripts/closetag.vim', { 'for': ['html', 'eruby.html', 'xml', 'javascript.jsx'] }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'haya14busa/incsearch.vim'
Plug 'nishigori/increment-activator'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'xolox/vim-misc', { 'on': ['SaveSession', 'OpenSession'] }
Plug 'xolox/vim-session', { 'on': ['SaveSession', 'OpenSession'] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'fidian/hexmode', { 'on': 'Hexmode' }
Plug 'christoomey/vim-tmux-runner'
Plug 'wincent/replay'
call plug#end()

"############################
"### General key mappings ###
"############################

let mapleader = ' '
noremap - :
" inoremap jj <esc>

map J 5j
map K 5k
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
map 0 ^
nnoremap d0 d^
noremap Y y$
noremap Q <nop>

noremap <silent> <leader>q :q<cr>
noremap <leader>w :w<cr>
noremap <leader>z :x<cr>
noremap <leader>`q :qa!<cr>

noremap ' "
noremap '] `]
noremap '[ `[
" noremap =] `[=`]
noremap v] `[v`]
" map <] `[<`]
" map >] `[>`]
noremap ]o `]o
noremap ]O `]O
noremap ]a `]a
noremap ]A `]A
noremap [a `[a
noremap [A `[A
noremap ]i `]i
noremap ]I `]I
noremap [i `[i
noremap [I `[I

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
cnoremap <up> <nop>
cnoremap <down> <nop>
cnoremap <left> <nop>
cnoremap <right> <nop>
cnoremap <m-left> <nop>
cnoremap <m-right> <nop>
noremap <del> <nop>
inoremap <del> <nop>
cnoremap <del> <nop>

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
cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-k> <c-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

noremap <silent> <m-d> <c-d>
inoremap <m-d> <c-o>dw
noremap <silent> <m-b> <c-b>
inoremap <m-b> <s-left>
noremap <silent> <m-f> <c-f>
inoremap <m-f> <s-right>
inoremap <m-bs> <c-w>
cnoremap <m-bs> <c-w>
if !has('nvim')
  " m-d
  noremap <silent> ∂ <c-d>
  inoremap ∂ <c-o>dw
  " m-b
  noremap <silent> ∫ <c-b>
  inoremap ∫ <s-left>
  " m-f
  noremap <silent> ƒ <c-f>
  inoremap ƒ <s-right>
endif

noremap <c-n> <esc>:tabnew<cr>
noremap <silent> <m-q> :q<cr>
for tab_number in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  exe 'noremap <silent> <m-' . tab_number . '> :tabnext ' . tab_number . '<cr>'
endfor
noremap <c-h> gT
noremap <m-l> gt
noremap <silent> <m-}> :+tabmove<cr>
noremap <silent> <m-{> :-tabmove<cr>
noremap <silent> <leader>tc :tabclose<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>to :tabonly<cr>
if !has('nvim')
  " m-q
  noremap <silent> œ :q<cr>
  " m-1 to m-9
  let tab_number = 1
  for mapping in ['¡', '™', '£', '¢', '∞', '§', '¶', '•', 'ª']
    exe 'noremap <silent> ' . mapping . ' :tabnext ' . tab_number . '<cr>'
    let tab_number += 1
  endfor
  " m-l
  noremap ¬ gt
  " m-}
  noremap <silent> ’ :+tabmove<cr>
  " m-{
  noremap <silent> ” :-tabmove<cr>
endif

noremap <leader>e :e $MYVIMRC<cr>
noremap <leader>E :e ~/.vim/autoload/functions.vim<cr>

noremap <leader><leader> <C-^>

noremap <m-;> mCA;<esc>`C
inoremap <m-;> <C-o>A;
if has('nvim')
  noremap <m-,> mCA,<esc>`C
  inoremap <m-,> <C-o>A,
endif
noremap <m->> mCA.<esc>`C
inoremap <m->> <C-o>A.
inoremap <m-.> <C-o>A.
noremap <m-:> mCA:<esc>`C
inoremap <m-:> <C-o>A:
if !has('nvim')
  " m-;
  noremap … mCA;<esc>`C
  inoremap … <C-o>A;
  " m-,
  noremap ≤ mCA,<esc>`C
  inoremap ≤ <C-o>A,
  " m->
  noremap ˘ mCA.<esc>`C
  inoremap ˘ <C-o>A.
  " m-.
  inoremap ≥ <C-o>A.
  " m-:
  noremap Ú mCA:<esc>`C
  inoremap Ú <C-o>A:
endif

map <m-m> %
map <m-]> <c-]>
map <m-[> <c-t>
imap <m-_> <c-_>
if !has('nvim')
  " m-m
  map µ %
  " m-]
  map ‘ <c-]>
  " m-[
  map “ <c-t>
  " m-_
  imap — <c-_>
endif

noremap <leader>n <c-w>w
noremap <leader>p <c-w>W

noremap <silent> <leader>op :silent! exe '!open ' . getcwd()<cr>
noremap <silent> <leader>od :silent! exe '!open ' . expand('%:h')<cr>
noremap <silent> <leader>of :silent! exe '!open %'<cr>
noremap <silent> <leader>ob :silent! exe '!open -a "Google Chrome" %'<cr>

noremap $ $ze

noremap <leader>rr :e config/routes.rb<cr>
noremap <leader>rR :vnew config/routes.rb<cr>
noremap <leader>rs :e db/schema.rb<cr>
noremap <leader>rS :vnew<cr>:e db/schema.rb<cr>
noremap <leader>rg :e Gemfile<cr>
noremap <leader>rG :vnew Gemfile<cr>

noremap g; g;zz
noremap g, g,zz
noremap gi gi<c-o>zz

noremap <leader>9 i<space><esc>l
noremap <leader>0 a<space><esc>h

" noremap <silent> q :let g:is_recording=0<cr>q
map <leader>2 @
noremap <leader>22 @@
noremap @- @:
noremap <leader>2- @:
noremap <leader>1 :silent !
noremap <leader>5 :%!

noremap <leader>ft :set filetype=

nnoremap gV `[V`]

cabbrev tnew Tnew
cabbrev co copen
cabbrev qf copen
cabbrev lo lopen
cabbrev vn vnew
cabbrev en enew
cabbrev ne new
cabbrev sn new
cabbrev hn new
cabbrev v# vnew #

noremap zs zt
noremap z0 zs
nnoremap <expr> ze 'zzz'.(&scroll).'<CR>Hz'.(&scroll*2).'<CR><C-O>'
noremap z<Space> za

map gs gS
map gj gJ

"######################################
"### Plugins/functions key mappings ###
"######################################

imap <expr> <tab> functions#TabComplete()
smap <expr> <tab> functions#TabComplete()
xmap <expr> <tab> functions#TabComplete()

nnoremap <silent> <esc> :nohlsearch<cr>:call functions#ClearEverything()<cr>
inoremap <silent> <esc> <esc>:NeoSnippetClearMarkers<cr>
snoremap <silent> <esc> <esc>:NeoSnippetClearMarkers<cr>

imap <expr> <Space> "\<C-]><Plug>delimitMateSpace"

noremap <silent> '' :call functions#DisplayRegisters()<cr>

noremap <m-s><c-g> :call functions#ShowHighlightsUnderCursor()<CR>
noremap <m-s><c-a> :call functions#ShowAllHighlights()<CR>
if !has('nvim')
  " m-s
  noremap ß<c-g> :call functions#ShowHighlightsUnderCursor()<CR>
  noremap ß<c-a> :call functions#ShowAllHighlights()<CR>
endif

noremap <c-p> :Files<cr>
noremap <leader>i :BTags<cr>

if has('nvim')
  tnoremap <expr> <esc> &filetype == 'fzf' ? "\<c-g>" : "\<c-\>\<c-n>"
endif

noremap <leader>k :call functions#OpenNERDTreeBuffer()<CR>
noremap <silent> <f1> :NERDTreeToggle<CR>
noremap <silent> <leader><f1> :silent! NERDTreeFind<CR>
noremap <silent> <leader>K :call functions#RevealInNERDTreeBuffer()<cr>

noremap <silent> <f2> :TagbarToggle<CR>
noremap <silent> <f3> :call functions#ReadUndoFile()<cr>:GundoToggle<cr>

nmap cm <Plug>Commentary
nmap cmm <Plug>CommentaryLine
nmap cmu <Plug>Commentary<Plug>Commentary

noremap <silent> <leader>a :silent w<cr>:TestFile<cr>
noremap <silent> <leader>c :silent w<cr>:TestNearest<cr>
noremap <silent> <leader>l :silent w<cr>:TestLast<cr>
nnoremap <leader>m :call functions#ToggleTestInCurrentWindow()<cr>
nnoremap <leader>v :call functions#ToggleTestInSplitWindow()<cr>

noremap <leader>fmo :call functions#MoveCurrentFile()<cr>
map <leader>fmv <leader>fmo
noremap <leader>fde :call functions#DeleteCurrentFile()<cr>
noremap <leader>fdu :call functions#DuplicateCurrentFile()<cr>
noremap <leader>fcp :call functions#CopyCurrentFilePath()<cr>
noremap <leader>fcap :call functions#CopyCurrentFileAbsolutePath()<cr>
noremap <leader>fcn :call functions#CopyCurrentFileName()<cr>
noremap <leader>fcb :call functions#CopyCurrentFileBackupPath()<cr>
noremap <leader>fn :call functions#CreateNewFileInCurrentDir()<cr>
noremap <leader>fN :call functions#CreateNewFile()<cr>

noremap <leader>fj :set filetype=json<cr>:%!jq '.'<cr>
vnoremap <leader>fj :!jq '.'<cr>
noremap <leader>fh :silent %!tidy -qi --show-errors 0<cr>
noremap <leader>fx :silent %!tidy -qi -xml --show-errors 0<cr>
" https://github.com/beautify-web/js-beautify
noremap <leader>fb :set filetype=javascript<cr>:%!js-beautify<cr>
vnoremap <leader>fb :!js-beautify<cr>

noremap <silent> <m--> :set virtualedit=all<cr>20zl
vnoremap <silent> <m--> 20zl
noremap <silent> <m-0> 20zh:call functions#SetVirtualEdit()<cr>
vnoremap <silent> <m-0> 20zh
nnoremap <silent> ^ ^:set virtualedit=<cr>ze
nnoremap <silent> $ $:set virtualedit=<cr>ze
if !has('nvim')
  " m--
  noremap <silent> – :set virtualedit=all<cr>20zl
  vnoremap <silent> – 20zl
  " m-0
  noremap <silent> º 20zh:call functions#SetVirtualEdit()<cr>
  vnoremap <silent> º 20zh
endif

noremap <silent> <c-z> :call functions#OnVimSuspend()<cr>:suspend<cr>:call functions#OnVimResume()<cr>

noremap <m-t> :call functions#ToggleQuotes()<cr>
inoremap <m-t> <c-o>:call functions#ToggleQuotes()<cr>
cnoremap <m-t> <c-e><c-w>"" <left><left>
if !has('nvim')
  " m-t
  noremap † :call functions#ToggleQuotes()<cr>
  inoremap † <c-o>:call functions#ToggleQuotes()<cr>
  cnoremap † <c-e><c-w>"" <left><left>
endif

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map <silent> n <Plug>(incsearch-nohl-n)zz
map <silent> N <Plug>(incsearch-nohl-N)zz
map * <Plug>(incsearch-nohl-*)zz
map # <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map <m-j> ]e
xmap <m-j> ]egv
map <c-k> [e
xmap <c-k> [egv
if !has('nvim')
  " m-j
  map ∆ ]e
  xmap ∆ ]egv
endif

map <leader>; `]]<space>
" f17 is m-cr in my config
map <f17> ]<space>
inoremap <f17> <end><cr>
" f18 is s-cr in my config
map <f18> [<space>
inoremap <f18> <esc>O

noremap <leader>ff :FileSearch -Q -i '' <left><left>
noremap <silent> <leader>yf :set opfunc=functions#FileSearchVerb<CR>g@
map <leader>fw <leader>yfiw
map <leader>fW <leader>yfiW
vnoremap <leader>ff y:let @/ = functions#GetSelectionForSearches()<cr><leader>ff<c-r>=@/<cr>
cnoremap <m-l> <end><space>-G '\.'<space><left><left>
cnoremap <c-g> <end><space>-G ''<space><left><left>
noremap <leader>fo :Gqfopen<cr>
if !has('nvim')
  cnoremap ¬ <end><space>-G '\.'<space><left><left>
endif

noremap <leader>-- @:
noremap <leader>-b :call functions#DeleteHiddenBuffers()<cr>
noremap <leader>-u :call functions#ClearUndos()<cr>
noremap <leader>-k :call functions#ResetProject()<cr>

noremap <leader>rm :call functions#ShowLatestMigration()<cr>
noremap <leader>rM :vnew<cr>:call functions#ShowLatestMigration()<cr>
vnoremap <leader>rp :<c-u>call functions#ExtractRailsPartial()<cr>

noremap <leader>rn :call functions#NewPlaygroundBuffer('ruby')<cr>

map gR gr$
nmap cX cx$
nnoremap cc cc

noremap <leader>oo :OldFiles<cr>
noremap <leader>oh :Helptags<cr>
noremap <silent> <leader>om :call functions#OpenMarkdownPreview()<cr>

noremap <leader>yq :call functions#MakeSession()<cr>:qa!<cr>
noremap <leader>yl :call functions#LoadSession()<cr>

nmap <silent> <leader>h <leader>yghiw
nmap <silent> <leader>H <leader>yhiW
nnoremap <silent> <leader>yh :set opfunc=functions#HighlightOccurencesVerb<CR>g@
nnoremap <silent> <leader>ygh :set opfunc=functions#HighlightWholeOccurencesVerb<CR>g@

nmap <silent> <leader>d <leader>ygdiw
nmap <silent> <leader>D <leader>ydiW
nnoremap <silent> <leader>yd :set opfunc=functions#ChangeOccurenceVerb<CR>g@
nnoremap <silent> <leader>ygd :set opfunc=functions#ChangeWholeOccurenceVerb<CR>g@

nnoremap <leader>x :%s/
nmap <leader>X <leader>yxiw
nnoremap <silent> <leader>yx :set opfunc=functions#GlobalSubstituteVerb<CR>g@
nmap <leader>yX <leader>yxiW
vnoremap <leader>x <esc>:%s/<c-r>=functions#GetSelectionForSearches()<cr>/

nnoremap <leader>s :s/
nmap <leader>S <leader>ysiw
nnoremap <silent> <leader>ys :set opfunc=functions#SubstituteVerb<CR>g@
nmap <leader>yS <leader>ysiW
vnoremap <leader>s :s/\%V

nmap <leader>8 *
xmap <leader>8 *
nnoremap <silent> <leader>y8 :set opfunc=functions#SearchNextOccurenceVerb<cr>g@
xnoremap * <esc>/<c-r>=functions#GetSelectionForSearches()<cr><cr>
xnoremap # <esc>?<c-r>=functions#GetSelectionForSearches()<cr><cr>

command! -nargs=+ -complete=file FileSearch call functions#FileSearch(<q-args>)
command! Gmodified call functions#GitOpenModifiedFiles()
command! Lint call Lint()
command! -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { 'options': $FZF_DEFAULT_OPTS })
command! -nargs=* BTags call fzf#vim#buffer_tags(<q-args>, { 'options': $FZF_DEFAULT_OPTS })
command! -nargs=* OldFiles call fzf#vim#history({ 'options': ' --prompt="OldFiles> "' })
command! MakePlugSnapshot call functions#MakePlugSnapshot()

cabbrev plugi PlugInstall
cabbrev plugc PlugClean
cabbrev plugu PlugUpdate
cabbrev plugst PlugStatus
cabbrev plugs MakePlugSnapshot
cabbrev goyo Goyo
cabbrev gdiff Gdiff
cabbrev gd Gdiff
cabbrev glog Glog
cabbrev gb Gblame
cabbrev gm Gmodified
cabbrev lint Lint

xnoremap @ :<C-u>call functions#ExecuteMacroOnSelection()<cr>
xnoremap <leader>2 :<C-u>call functions#ExecuteMacroOnSelection()<cr>

noremap <silent> <leader>th :call functions#MoveToPrevTab()<cr>
noremap <silent> <leader>tl :call functions#MoveToNextTab()<cr>
noremap <silent> <leader>tr :call functions#RenameTab()<cr>
noremap <silent> <m-.> :call GoToLastActiveTab()<cr>
if !has('nvim')
  noremap <silent> ≥ :call GoToLastActiveTab()<cr>
endif

nnoremap <silent> <Leader>b :BufExplorerHorizontalSplit<cr>

cnoremap <expr> <m-d> functions#EnhancedMetaDeleteRight()
cnoremap <expr> <m-b> functions#EnhancedMetaLeft()
cnoremap <expr> <m-f> functions#EnhancedMetaRight()
if !has('nvim')
  " m-d
  cnoremap <expr> ∂ functions#EnhancedMetaDeleteRight()
  "m-b
  cnoremap <expr> ∫ functions#EnhancedMetaLeft()
  " m-f
  cnoremap <expr> ƒ functions#EnhancedMetaRight()
end

noremap <silent> <leader>j :call functions#Join()<cr>

nnoremap <silent> zn :call functions#ToggleFoldSyntax()<cr>

nnoremap <silent> <f4> :silent w<cr>:VtrSendCommandToRunner<cr>
imap <silent> <f4> <esc><f4>

noremap <silent> <m-=> :call functions#ToggleZoom()<cr>
if !has('nvim')
  " m-=
  noremap <silent> ≠ :call functions#ToggleZoom()<cr>
endif

" nnoremap <silent> <expr> <cr> empty(&buftype) ? ':call functions#PlayLastMacro()<cr>' : '<cr>'

"#############################
"### General configuration ###
"#############################

set nocompatible
filetype plugin indent on
if !exists('syntax_on')
  syntax on
endif
if !exists('g:colors_name')
  colorscheme railscasts_custom
endif
set termguicolors
set guicursor=a:block-blinkon0
set fileformat=unix
set number relativenumber numberwidth=5
set expandtab tabstop=2 shiftwidth=2 autoindent smarttab
set incsearch ignorecase smartcase hlsearch
set noshowmatch
set nrformats-=octal
set noerrorbells visualbell t_vb= belloff=all
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
set complete=.,w
" set complete=.,w,b,u,t
set grepprg=ag
set gdefault
set fillchars+=vert:\ "
set nofoldenable
set foldtext=GetFoldText()
" set foldmethod=indent
" set foldlevelstart=1
" set foldlevelstart=99
set tags=./.tags;
set tabline=%!GetTabLine()
set pumheight=8
set nojoinspaces
set conceallevel=2 concealcursor=niv
set sessionoptions-=options
set sidescroll=1 sidescrolloff=3
set wildignorecase
set diffopt=vertical,filler,foldcolumn:0
set whichwrap=b,s,h,l
let $MYVIMFUNCTIONS = '~/.vim/autoload/functions.vim'
set synmaxcol=1000

set statusline=
set statusline+=\ %<%f
set statusline+=\ %{&modified?'[+]':''}
set statusline+=%h%r
set statusline+=%=
set statusline+=%{GetLintMsg()}
set statusline+=%{GetCustomStatusMsg()}
set statusline+=\ \ %-14(%l,%c%)
set statusline+=\ %-10(%LL%)
set statusline+=\ \ %P

let undodir = expand('~/.vim/tmp/undo')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
set undodir=~/.vim/tmp/undo

if has('nvim')
  set scrollback=-1
endif
if has('gui_running')
  set guifont=Menlo:h14 linespace=3
  hi Cursor guifg=white guibg=red
endif

let html_no_rendering = 1
let g:html_indent_inctags = 'p,main'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'

let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"#############################
"### Plugins configuration ###
"#############################

let g:fzf_layout = { 'up': '100%' }
let g:fzf_colors = {
      \ 'fg':        ['fg', 'Normal'],
      \ 'bg':        ['bg', 'Normal'],
      \ 'hl':        ['fg', 'Statement'],
      \ 'fg+':       ['fg', 'Normal'],
      \ 'bg+':       ['bg', 'Normal'],
      \ 'hl+':       ['fg', 'Statement'],
      \ 'pointer':   ['fg', 'Statement']
      \ }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'alt-t': 'tab split',
      \ 'ctrl-v': 'vsplit',
      \ 'alt-v': 'vsplit',
      \ 'alt-x': 'split'
      \ }
let g:fzf_history_dir = '~/.fzf_history'
let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores --hidden -g ""'
let $FZF_DEFAULT_OPTS .=
      \ ' --no-bold --color="info:#2f2f2f,spinner:#2f2f2f" --prompt="  "'

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" let g:netrw_banner=0
let g:netrw_altfile = 1

" let g:netrw_winsize = -28
let g:netrw_liststyle = 3
" let g:netrw_sort_sequence = '[\/]$,*'
" let g:netrw_browse_split = 3

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
      \ '\.tags$', '\.tags_sorted_by_file$', '\.gemtags$', '\.pyc$', '\.pyo$',
      \ '\.exe$', '\.dll$', '\.obj$', '\.o$', '\.a$', '\.lib$', '\.so$',
      \ '\.dylib$', '\.ncb$', '\.sdf$', '\.suo$', '\.pdb$', '\.idb$',
      \ '\.DS_Store$', '\.class$', '\.psd$', '\.db$', '\.gitkeep$', '\.keep',
      \ '\.rubocop-http',
      \
      \ '^\.svn$', '^\.git$', '^\.hg$', '^\CVS$', '^\.idea$', '^\.bundle$',
      \ '^\.sass-cache$', '^tmp$', '^log$', '\^coverage$', '^node_modules$'
      \ ]
let NERDTreeQuitOnOpen = 1
let NERDTreeHighlightCursorline = 0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

let g:incsearch#auto_nohlsearch = 1

let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 0

let g:test#strategy = 'custom'

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
      \ 'javascript.jsx' : {
      \   'extends' : 'jsx'
      \ },
      \ }
let s:emmetElements = [
      \ 'a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article',
      \ 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big',
      \ 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center',
      \ 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details',
      \ 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset',
      \ 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset',
      \ 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input',
      \ 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map',
      \ 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes',
      \ 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p',
      \ 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp',
      \ 'script', 'section', 'select', 'small', 'source', 'span', 'strike',
      \ 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td',
      \ 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track',
      \ 'tt', 'u', 'ul', 'var', 'video', 'wbr',
      \ 'h1', 'h2', 'h3', 'h4', 'h6',
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

let g:session_directory = '~/.vim/tmp/sessions'
let g:session_lock_enabled = 0
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_menu = 0

let s:repls = {
      \ 'ruby': 'irb --simple-prompt',
      \ 'python': 'python -ic ""'
      \ }

let g:neomake_verbose = 0
let g:neomake_place_signs = 0
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
" let g:neomake_ruby_rubocop_exe = 'bundle'
" let g:neomake_ruby_rubocop_args = ['exec', 'rubocop', '--format', 'emacs']
let g:neomake_highlight_columns = 0

let MRU_Window_Height = 10
hi link MRUFileName String

let s:last_active_tab_number = 1

let g:tmux_navigator_no_mappings = 1

let g:jsx_ext_required = 0

let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'eruby.html' : 1,
      \ 'xml' : 1,
      \ 'javascript.jsx' : 1
      \}

let g:markdown_syntax_conceal = 0

"##############################
"### Eager-loaded functions ###
"##############################
" See .vim/autoload/functions.vim for lazy-loaded functions

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

function! GetLintMsg()
  let counts = neomake#statusline#LoclistCounts()
  let error_count = get(counts, 'E', 0) + get(counts, 'I', 0)
  let warning_count = get(counts, 'W', 0)
  if error_count + warning_count == 0 | return '' | endif

  let count_msgs = []
  if error_count > 0 | call add(count_msgs, 'E:' . error_count) | endif
  if warning_count > 0 | call add(count_msgs, 'W:' . warning_count) | endif
  return '[' . join(count_msgs, ',') . ']'
endfunction

function! GetCustomStatusMsg()
  if !exists('b:custom_status_msg') | return '' | endif
  return '[' . b:custom_status_msg . ']'
endfunction

function! CustomTestStrategy(cmd) abort
  let opts = {}
  function! opts.on_exit(job_id, data, event)
    if a:data != 0 && exists('t:term_test_bufnum')
      exe bufwinnr(t:term_test_bufnum) . 'wincmd w'
    end
  endfunction
  call functions#CloseTests()
  botright new
  let t:term_test_bufnum = bufnr('%')
  resize 11
  call termopen(a:cmd . ' #test', opts)
  wincmd p
endfunction
let g:test#custom_strategies = { 'custom': function('CustomTestStrategy') }

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

function! GetTabLabel(tab_number)
  let custom_tab_name = gettabvar(a:tab_number, 'tab_name')
  if custom_tab_name != '' | return custom_tab_name | endif

  let buflist = tabpagebuflist(a:tab_number)
  let file_path = bufname(buflist[0])
  if file_path == ''
    return '[No Name]'
  elseif file_path =~ 'fzf'
    return 'FZF'
  end
  return fnamemodify(file_path, ':p:t')
endfunction

function! GetCwd()
  return fnamemodify(getcwd(), ':t')
endfunction

function! BufEnterConfig()
  let buffer_name = bufname('%')

  if buffer_name == '[Global Replace]'
    map <buffer><Leader>fr :call feedkeys("\<space>fRa")<cr>
    map <buffer><Leader>fR :Greplace<cr>
  else
    map <buffer><leader>fre :call functions#RenameCurrentFile()<cr>
    map <buffer><leader>frm <buffer><leader>fde
  endif

  if buffer_name !~ 'NERD_tree'
    map <buffer> m, mO
    map <buffer> `, `O
    map <buffer> ', `O
  endif

  call ConfigureLargeFiles()

  exe ':match'
endfunction

function! ConfigureLargeFiles()
  let nb_lines = line('$')
  if nb_lines < 500 |
    set nolazyredraw
  else
    set lazyredraw
  endif

  if !has('nvim') | return | endif
  let opts = {}
  let opts.tempfile = ''
  let file = expand('%')
  if file == ''
    let opts.tempfile = tempname()
    call writefile(getbufline('%', 1, '$'), opts.tempfile)
    let file = opts.tempfile
  endif
  let cmd = "awk 'length > max { max=length } END { print max }' " . file
  function! opts.on_stdout(job_id, data, event)
    let max_line_length = a:data[0]
    if max_line_length > 1000
      setlocal synmaxcol=153
    endif
    if self.tempfile != '' | call delete(self.tempfile) | endif
  endfunction
  call jobstart(cmd, opts)
endfunction

function! CustomCloseTab()
  if s:current_tab_number == 1 | return | endif
  exe 'tabnext' . (s:current_tab_number - 1)
endfunction

function! GoToLastActiveTab()
  exe 'tabnext' . s:last_active_tab_number
endfunction

function! Lint()
  if &buftype != '' | return | endif
  if !filereadable(expand('%:p')) | return | endif
  if &filetype !~ '^\(ruby\|javascript\|scss\)' | return 0 | endif

  if &filetype =~ 'javascript'
    Neomake eslint
  else
    Neomake
  end
endfunction

function! GetFoldText()
  let text = getline(v:foldstart)
  let width = winwidth(0) - &foldcolumn - strwidth(text)
  return text . repeat(' ', width)
endfunction

function! SaveBufferScroll()
  if !exists('w:saved_buf_view') | let w:saved_buf_view = {} | endif
  let w:saved_buf_view[bufnr('%')] = winsaveview()
endfunction

function! RestoreBufferScroll()
  let buf = bufnr('%')
  if exists('w:saved_buf_view') && has_key(w:saved_buf_view, buf)
    let v = winsaveview()
    let at_start_of_file = v.lnum == 1 && v.col == 0
    if at_start_of_file && !&diff
      call winrestview(w:saved_buf_view[buf])
    endif
    unlet w:saved_buf_view[buf]
  endif
endfunction

function! DetectBinaryFile()
  if &filetype == ''
        \ && expand('%') !~ '\.\(bz2\|gz\|lzma\|xz\|Z\)$'
        \ && !!search('\%u0000', 'wn')
    Hexmode
  endif
endfunction

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
  autocmd BufRead,BufNewFile *.nfo,*.NFO set ft=nfo
  autocmd BufRead,BufNewFile *.js.es6 set ft=javascript
  autocmd BufRead,BufNewFile *.js.es6.erb set ft=eruby.javascript
  autocmd BufRead,BufNewFile *.env.* set ft=sh
augroup end

augroup detect_binary_files
  autocmd!
  autocmd BufRead * call DetectBinaryFile()
augroup end

augroup custom_backup
  autocmd!
  autocmd BufWritePost * call functions#BackupCurrentFile()
augroup end

augroup custom_undofile
  autocmd!
  autocmd BufWritePost * call functions#WriteUndoFile()
augroup end

if has('nvim')
  augroup on_display_events
    autocmd!
    autocmd TermOpen *test* call OnTestDisplayed()
    autocmd TermOpen *ag\ * call functions#OnFileSearchDisplayed()
  augroup end
end

augroup nerdtree_original_buffer
  autocmd!
  autocmd BufLeave * call SaveCurrentBufNum()
  autocmd BufEnter * call RestoreNerdtreeOriginalBuffer()
augroup end

if exists('$TMUX') && !exists('$DISABLE_VIM_WINDOW_RENAME')
  augroup tmux_title
    autocmd!
    autocmd VimEnter * call jobstart("tmux rename-window -t $TMUX_PANE '" . GetCwd() . "'")
    autocmd VimLeave * call jobstart('tmux setw automatic-rename')
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
  autocmd User GoyoEnter nested call functions#OnGoyoEnter()
  autocmd User GoyoLeave nested call functions#OnGoyoLeave()
augroup end

augroup lazy_load_deoplete
  autocmd!
  autocmd InsertEnter * call deoplete#enable() | autocmd! lazy_load_deoplete
augroup end

augroup lint_events
  autocmd!
  autocmd BufWritePost,BufEnter,FocusLost * call Lint()
augroup end

augroup preserve_buffer_scroll
  autocmd BufLeave * call SaveBufferScroll()
  autocmd BufEnter * call RestoreBufferScroll()
augroup end

augroup general_autocommands
  autocmd!
  autocmd BufWritePre * call functions#TrimTrailingWhitespace()
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost $MYVIMFUNCTIONS source $MYVIMFUNCTIONS
  autocmd InsertLeave * silent! set nopaste
  autocmd BufRead,BufNewFile *_spec.rb set syntax=rspec
  autocmd BufEnter * call BufEnterConfig()
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
  autocmd BufRead,BufNewFile *.html* setlocal matchpairs="(:),[:],{:}"
  autocmd User FzfStatusLine setlocal statusline=\ "
augroup end

set exrc
set secure
