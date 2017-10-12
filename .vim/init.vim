"############
"### TODO ###
"############

" make tmux cmd+e a real tmux pane that auto closes if previous command was successful
" improve tmux window renaming
" make <leader>d work on selection
" lazyload parts of the vimrc file https://www.youtube.com/watch?v=QGQROe8ACpY&index=15&list=PLwJS-G75vM7kFO-yUkyNphxSIdbi_1NKX
" use very magic by default when searching?
" have a shortcut for TODO / notes per project
" use universal ctags
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
noremap <silent> <m-u> <c-u>
noremap <silent> <m-e> <c-e>
noremap <silent> <m-y> <c-y>
noremap <silent> <m-f> <c-f>
noremap <silent> <m-b> <c-b>
noremap <silent> <m-w> <c-w>
noremap <m-g> :=<cr>
noremap <m-o> <c-o>
noremap <m-x> <c-x>
noremap <m-v> <c-v>
noremap <m-r> <c-r>
inoremap <m-bs> <c-w>
cnoremap <m-bs> <c-w>
cnoremap <m-r><m-w> <c-r><c-w>
cnoremap <m-k> <c-k>
inoremap <m-b> <s-left>
inoremap <m-f> <s-right>
inoremap <m-d> <c-o>dw
inoremap <m-o> <c-o>

noremap <c-n> <esc>:tabnew<cr>
noremap <silent> <m-q> :q<cr>
noremap <silent> <m-w> :w<cr>
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

noremap <leader>e :e $MYVIMRC<CR>
noremap <leader>E :source $MYVIMRC<CR><esc>

noremap <leader><leader> <C-^>

noremap <m-;> mCA;<esc>`C
inoremap <m-;> <C-o>A;
noremap <m-,> mCA,<esc>`C
inoremap <m-,> <C-o>A,
noremap <m->> mCA.<esc>`C
inoremap <m-.> <C-o>A.
inoremap <m->> <C-o>A.
noremap <m-:> mCA:<esc>`C
inoremap <m-:> <C-o>A:

noremap <leader>n <c-w>w
noremap <leader>p <c-w>W

noremap <silent> <leader>op :silent! exe '!open ' . getcwd()<cr>
noremap <silent> <leader>od :silent! exe '!open ' . expand('%:h')<cr>
noremap <silent> <leader>of :silent! exe '!open %'<cr>
noremap <silent> <leader>ob :silent! exe '!open -a "Google Chrome" %'<cr>

noremap $ $ze

noremap @- @:

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

noremap <silent> q :let g:is_recording=0<cr>q
noremap <leader>2 @
noremap <leader>22 @@
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

map <m-m> %

map <m-]> <c-]>
map <m-[> <c-t>

"######################################
"### Plugins/functions key mappings ###
"######################################

imap <expr> <tab> TabComplete()
smap <expr> <tab> TabComplete()
xmap <expr> <tab> TabComplete()

nnoremap <silent> <esc> :nohlsearch<cr>:call ClearEverything()<cr>
inoremap <silent> <esc> <esc>:NeoSnippetClearMarkers<cr>
snoremap <silent> <esc> <esc>:NeoSnippetClearMarkers<cr>

imap <expr> <Space> "\<C-]><Plug>delimitMateSpace"

noremap <silent> '' :call DisplayRegisters()<cr>

noremap <m-s><m-g> :call ShowHighlightsUnderCursor()<CR>
noremap <c-s><c-a> :call ShowAllHighlights()<CR>
map <m-s><c-a> <c-s><c-a>

noremap <c-p> :Files<cr>
noremap <leader>i :BTags<cr>

tnoremap <expr> <esc> &filetype == 'fzf' ? "\<c-g>" : "\<c-\>\<c-n>"

noremap <leader>k :call OpenNERDTreeBuffer()<CR>
noremap <silent> <f1> :NERDTreeToggle<CR>
noremap <silent> <leader><f1> :silent! NERDTreeFind<CR>
noremap <silent> <leader>K :call RevealInNERDTreeBuffer()<cr>

noremap <silent> <f2> :TagbarToggle<CR>
noremap <silent> <f3> :call ReadUndoFile()<cr>:GundoToggle<cr>

nmap cm <Plug>Commentary
nmap cmm <Plug>CommentaryLine

noremap <silent> <leader>a :silent w<cr>:TestFile<cr>
noremap <silent> <leader>c :silent w<cr>:TestNearest<cr>
noremap <silent> <leader>l :silent w<cr>:TestLast<cr>
nnoremap <leader>m :call ToggleTestInCurrentWindow()<cr>
nnoremap <leader>v :call ToggleTestInSplitWindow()<cr>

noremap <leader>fmo :call MoveCurrentFile()<cr>
map <leader>fmv <leader>fmo
noremap <leader>fde :call DeleteCurrentFile()<cr>
noremap <leader>fdu :call DuplicateCurrentFile()<cr>
noremap <leader>fcp :call CopyCurrentFilePath()<cr>
noremap <leader>fcap :call CopyCurrentFileAbsolutePath()<cr>
noremap <leader>fcn :call CopyCurrentFileName()<cr>
noremap <leader>fcb :call CopyCurrentFileBackupPath()<cr>
noremap <leader>fn :call CreateNewFileInCurrentDir()<cr>
noremap <leader>fN :call CreateNewFile()<cr>

noremap <leader>fj :set filetype=json<cr>:%!jq '.'<cr>
vnoremap <leader>fj :!jq '.'<cr>
noremap <leader>fh :silent %!tidy -qi --show-errors 0<cr>
noremap <leader>fx :silent %!tidy -qi -xml --show-errors 0<cr>
" https://github.com/beautify-web/js-beautify
noremap <leader>fb :set filetype=javascript<cr>:%!js-beautify<cr>
vnoremap <leader>fb :!js-beautify<cr>

noremap <silent> <m--> :set virtualedit=all<cr>20zl
noremap <silent> <m-0> 20zh:call SetVirtualEdit()<cr>
nnoremap <silent> ^ ^:set virtualedit=<cr>ze
nnoremap <silent> $ $:set virtualedit=<cr>ze
vnoremap <silent> <m--> 20zl
vnoremap <silent> <m-0> 20zh

noremap <silent> <c-z> :call OnVimSuspend()<cr>:suspend<cr>:call OnVimResume()<cr>

noremap <m-t> :call ToggleQuotes()<cr>
inoremap <m-t> <c-o>:call ToggleQuotes()<cr>
cnoremap <m-t> <c-e><c-w>"" <left><left>

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map <silent> n <Plug>(incsearch-nohl-n)zz
map <silent> N <Plug>(incsearch-nohl-N)zz
map * <Plug>(incsearch-nohl-*)zz
map # <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map <m-j> ]e
map <c-k> [e
xmap <m-j> ]egv
xmap <c-k> [egv

map <leader>; `]]<space>
map <m-cr> ]<space>
inoremap <m-cr> <end><cr>
" f16 is s-cr in my iTerm2
map <f16> [<space>
inoremap <f16> <esc>O

noremap <leader>ff :FileSearch -Q -i '' <left><left>
noremap <silent> <leader>yf :set opfunc=FileSearchVerb<CR>g@
map <leader>fw <leader>yfiw
map <leader>fW <leader>yfiW
vnoremap <leader>ff y:let @/ = GetSelectionForSearches()<cr><leader>ff<c-r>=@/<cr>
cnoremap <m-l> <end><space>-G '\.'<space><left><left>
cnoremap <m-g> <end><space>-G ''<space><left><left>
noremap <leader>fo :Gqfopen<cr>

noremap <leader>-- @:
noremap <leader>-b :call DeleteHiddenBuffers()<cr>
noremap <leader>-u :call ClearUndos()<cr>
noremap <leader>-k :call ResetProject()<cr>

noremap <leader>rm :call ShowLatestMigration()<cr>
noremap <leader>rM :vnew<cr>:call ShowLatestMigration()<cr>
vnoremap <leader>rp :<c-u>call ExtractRailsPartial()<cr>

noremap <leader>rn :call NewPlaygroundBuffer('ruby')<cr>

map gR gr$
nmap cX cx$
nnoremap cc cc

noremap <leader>oo :OldFiles<cr>
noremap <leader>oh :Helptags<cr>
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

noremap <leader>yq :call MakeSession()<cr>:qa!<cr>
noremap <leader>yl :call LoadSession()<cr>

nmap <silent> <leader>h <leader>yghiw
nmap <silent> <leader>H <leader>yhiW
nnoremap <silent> <leader>yh :set opfunc=HighlightOccurencesVerb<CR>g@
nnoremap <silent> <leader>ygh :set opfunc=HighlightWholeOccurencesVerb<CR>g@

nmap <silent> <leader>d <leader>ygdiw
nmap <silent> <leader>D <leader>ydiW
nnoremap <silent> <leader>yd :set opfunc=ChangeOccurenceVerb<CR>g@
nnoremap <silent> <leader>ygd :set opfunc=ChangeWholeOccurenceVerb<CR>g@

nnoremap <leader>x :%s/
nmap <leader>X <leader>yxiw
nnoremap <silent> <leader>yx :set opfunc=GlobalSubstituteVerb<CR>g@
nmap <leader>yX <leader>yxiW
vnoremap <leader>x <esc>:%s/<c-r>=GetSelectionForSearches()<cr>/

nnoremap <leader>s :s/
nmap <leader>S <leader>ysiw
nnoremap <silent> <leader>ys :set opfunc=SubstituteVerb<CR>g@
nmap <leader>yS <leader>ysiW
vnoremap <leader>s :s/\%V

nmap <leader>8 *
xmap <leader>8 *
nnoremap <silent> <leader>y8 :set opfunc=SearchNextOccurenceVerb<cr>g@
xnoremap * <esc>/<c-r>=GetSelectionForSearches()<cr><cr>
xnoremap # <esc>?<c-r>=GetSelectionForSearches()<cr><cr>

command! -nargs=+ -complete=file FileSearch call FileSearch(<q-args>)
command! Gmodified call GitOpenModifiedFiles()
command! Lint call Lint()
command! -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { 'options': $FZF_DEFAULT_OPTS })
command! -nargs=* BTags call fzf#vim#buffer_tags(<q-args>, { 'options': $FZF_DEFAULT_OPTS })
command! -nargs=* OldFiles call fzf#vim#history({ 'options': ' --prompt="OldFiles> "' })
command! MakePlugSnapshot call MakePlugSnapshot()

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

xnoremap @ :<C-u>call ExecuteMacroOnSelection()<cr>
xnoremap <leader>2 :<C-u>call ExecuteMacroOnSelection()<cr>

noremap <silent> <leader>th :call MoveToPrevTab()<cr>
noremap <silent> <leader>tl :call MoveToNextTab()<cr>
noremap <silent> <leader>tr :call RenameTab()<cr>
noremap <silent> <m-.> :call GoToLastActiveTab()<cr>

nnoremap <silent> <Leader>b :BufExplorerHorizontalSplit<cr>

cnoremap <expr> <m-b> EnhancedMetaLeft()
cnoremap <expr> <m-f> EnhancedMetaRight()
cnoremap <expr> <m-d> EnhancedMetaDeleteRight()

imap <m-_> <c-_>

noremap <silent> <leader>j :call Join()<cr>

nnoremap <silent> zn :call ToggleFoldSyntax()<cr>

nnoremap <silent> <f4> :silent w<cr>:VtrSendCommandToRunner<cr>
imap <silent> <f4> <esc><f4>

noremap <silent> <m-=> :call ToggleZoom()<cr>

nnoremap <silent> <expr> <cr> empty(&buftype) ? ':call PlayLastMacro()<cr>' : '<cr>'

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
set scrollback=-1
set tabline=%!GetTabLine()
set pumheight=8
set nojoinspaces
set conceallevel=2 concealcursor=niv
set sessionoptions-=options
set sidescroll=1 sidescrolloff=3
set wildignorecase
set diffopt=vertical,filler,foldcolumn:0
set whichwrap=b,s,h,l

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

let s:custom_backup_dir='~/.vim_custom_backups'

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
  if &filetype !~ 'html\|css\|jsx' | return 0 | endif
  if !emmet#isExpandable() | return 0 | endif
  if &filetype =~ 'css' | return 1 | endif

  let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
  return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
endfunction

function! ClearEverything()
  match
  ccl
  lcl
  silent! call CloseTests()
  NERDTreeClose
  normal cxc
  call ClearMessages()
endfunction

function! ClearMessages()
  call feedkeys(":\<bs>")
endfunction

function! DisplayRegisters()
  redir => output
  silent exe 'reg "0123456789'
  redir END
  new
  silent file [Registers]
  setlocal nonumber norelativenumber colorcolumn=
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
  silent put =output
  silent normal gg"_d2j
  exe 'resize' . line('$')
  map <silent> <buffer> q :q<cr>
  map <silent> <buffer> <esc> q
endfunction

function! TrimTrailingWhitespace()
  if &filetype =~ 'markdown\|neosnippet' | return | endif
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

function! OpenNERDTreeBuffer()
  if bufexists('NERD_tree_1')
    buffer NERD_tree_1
  else
    let alternate_buffer = bufnr('%')
    silent edit .
    if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
  end
endfunction

function! RevealInNERDTreeBuffer()
  try
    let p = g:NERDTreePath.New(expand('%:p'))
  catch /^NERDTree.InvalidArgumentsError/
    call nerdtree#echo('no file for the current buffer')
    return
  endtry
  if p.isUnixHiddenPath()
    let showhidden=g:NERDTreeShowHidden
    let g:NERDTreeShowHidden = 1
  endif

  call OpenNERDTreeBuffer()

  let node = b:NERDTree.root.reveal(p)
  call b:NERDTree.render()
  call node.putCursorHere(1,0)

  if p.isUnixHiddenFile()
    let g:NERDTreeShowHidden = showhidden
  endif
endfunction

function! DeleteCurrentFile()
  let answer = input('Delete current file? ', 'y')
  if answer == 'y'
    exec ':silent !rm ' . expand('%')
  endif
endfunction

function! RefreshNERDTree()
  " NERDTreeFind
  " NERDTreeClose
  " call g:NERDTree.ForCurrentTab().getRoot().refresh()
  " call g:NERDTree.ForCurrentTab().getRoot().refresh()
  " call nerdtree#ui_glue#invokeKeyMap('o')
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

function! CopyCurrentFileAbsolutePath()
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
  setlocal colorcolumn=
  map <buffer> <cr> <cr>:ccl<cr>
  noremap <buffer> <f21> <cr>
  map <buffer> o <f21><c-w><c-w>
  map <buffer> q :q<cr>
endfunction

function! OnNERDTreeDisplayed()
  map <buffer> J 5j
  map <buffer> K 5k
  map <buffer> <silent> o :call PreviewNERDTreeNode()<cr>
  map <buffer> <silent> p :call PreviewNERDTreeNode()<cr>
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

function! OnTestDisplayed()
  noremap <silent><buffer> <leader>q <c-w>p:call CloseTests()<cr>
  map <silent><buffer> <esc> <leader>q
  map <silent><buffer> q <esc>
  noremap <silent><buffer> <cr> :call OpenFileInPreviousWindow(0)<cr>
  noremap <silent><buffer> o :call OpenFileInPreviousWindow(1)<cr><c-w>p
endfunction

function! OnFileSearchDisplayed()
  noremap <silent><buffer> <cr> :call OpenFileSearchResult(0)<cr>
  nmap <buffer> o <cr>
  noremap <silent><buffer> t :call OpenFileSearchResult(1)<cr>
endfunction

function! OnBufExplorerDisplayed()
  if !exists('b:config_defined')
    setlocal colorcolumn=
    map <buffer> <esc> q
    let b:config_defined = 1
  endif
endfunction

function! OnMRUDisplayed()
  map <buffer> <esc> q
endfunction

function! PreviewNERDTreeNode()
  let line = getline('.')
  if line =~ '▸\|▾'
    call nerdtree#ui_glue#invokeKeyMap('o')
  elseif line !~ '^/'
    normal go
  endif
endfunction

function! FileSearch(search_options)
  if IsCurrentBufferNew() || bufname('%') =~ 'ag -C \|NERD_tree_1'
    enew
  else
    tabnew
  endif

  let single_quote_pos = match(a:search_options, "'")
  let double_quote_pos = match(a:search_options, '"')
  let single_quote_search = single_quote_pos >= 0
  if single_quote_pos >=0 && double_quote_pos >= 0
    let single_quote_search = single_quote_pos < double_quote_pos
  endif
  let search_text = ''
  if single_quote_search
    let search_text = matchstr(a:search_options, "\\v'\\zs.{-}\\ze'")
  else
    let search_text = matchstr(a:search_options, "\\v\"\\zs.{-}\\ze(\\\\)\@<!\"")
  endif
  let @/ = search_text

  let query = 'ag -C ' . a:search_options
  call setqflist([], ' ', { 'title': query })
  let opts = {}
  let opts.file = ''
  let opts.files_matched = 0
  let opts.lines_matched = 0
  function! opts.on_stdout(job_id, data, event)
    for line in a:data
      let escaped_line = substitute(line, '\(\e\[\(\d\{1,2}\(;\d\{1,2}\)\?\)\?[mK]\|\r\)', '', 'g')
      if line =~ '^\e\[1;32m'
        let self.file = escaped_line
        let self.files_matched += 1
        continue
      end
      let matches = matchlist(escaped_line, '^\(\d\+\):\(.*\)')
      if len(matches)
        call setqflist([{
              \ 'filename': self.file,
              \ 'lnum': matches[1],
              \ 'text': matches[2]
              \ }], 'a')
        let self.lines_matched += 1
      endif
      let b:custom_status_msg =
            \ self.lines_matched . ' matches, ' . self.files_matched . ' files'
    endfor
  endfunction
  " function! opts.on_exit(job_id, data, event)
  "   let b:custom_status_msg =
  "         \ self.lines_matched . ' matches, ' . self.files_matched . ' files'
  " endfunction
  call termopen(query, opts)
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
  if file =~ fnamemodify(s:custom_backup_dir, ':t') | return | endif
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
  call jobstart(cmd)
endfunction

function! CopyCurrentFileBackupPath()
  let @+=expand(s:custom_backup_dir . expand('%:p'))
endfunction

function! CustomTestStrategy(cmd) abort
  let opts = {}
  function! opts.on_exit(job_id, data, event)
    if a:data != 0 && exists('t:term_test_bufnum')
      exe bufwinnr(t:term_test_bufnum) . 'wincmd w'
    end
  endfunction
  call CloseTests()
  botright new
  let t:term_test_bufnum = bufnr('%')
  resize 11
  call termopen(a:cmd . ' #test', opts)
  wincmd p
endfunction
let g:test#custom_strategies = { 'custom': function('CustomTestStrategy') }

function! CloseTests()
  if exists('t:term_test_bufnum') && bufexists(t:term_test_bufnum)
    exe 'bd! ' . t:term_test_bufnum
    unlet t:term_test_bufnum
  endif
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
  " let matches = matchlist(getline('.'), '\([\S^:]\+\):\(\d*\)')
  normal mC^f:
  let items = split(expand('<cWORD>'), ':')
  normal `C
  if len(items) >= 2 && filereadable(items[0])
    return items[0:1]
  endif
endfunction

function! OpenFileSearchResult(new_tab)
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
  " return GetFileLabel(file_path, a:tab_number)
endfunction

function! GetTabLabels()
  let tabs = []
  for i in range(tabpagenr('$'))
    let path = bufname(tabpagebuflist(i)[0])
    let name = fnamemodify(path, ':p:t')
    call add(tabs, { 'path': path, 'name': name, 'name_suffix': '' })
  endfor
  for i in range(tabpagenr('$'))
    for j in range(i, tabpagenr('$') - 1)
      call Disambiguate(tabs, i, j)
    endfor
  endfor
  return tabs
endfunction

function! Disambiguate(tabs, i, j)
  let tab1 = a:tabs[a:i]
  let tab2 = a:tabs[a:j]
  if tab1.name != tab2.name | return | endif
  if tab1.path == tab2.path | return | endif

  """ Find root for all same name nodes

  if tab1.name_suffix == tab2.name_suffix
    " tab1.name = 1
  endif
  " a:tabs[a:i] = 1
  " let a:tabs[a:i] = 1
endfunction

function! GetFileLabel(file_path, tab_number)
  let file_label = fnamemodify(file_path, ':p:t')
  for i in range(a:tab_number + 1, tabpagenr('$') + 1)
    let other_file_path = tabpagebuflist(a:tab_number)[0]
    let ambiguous_labels = file_path == other_file_path ? 0 : 1
    while ambiguous_labels
      let other_file_label = fnamemodify(other_file_path, ':p:t')
      if file_label == other_file_label

      else
        same_labels = 0
      endif
    endwhile
  endfor
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
    map <buffer><leader>fre :call RenameCurrentFile()<cr>
    map <buffer><leader>frm <buffer><leader>fde
    map <buffer><silent> <leader>fru :MRU<cr>
  endif

  if buffer_name !~ 'NERD_tree'
    map <buffer> m, mO
    map <buffer> `, `O
    map <buffer> ', `O
  endif

  call ConfigureLargeFiles()

  exe ':match'
endfunction

function! GitOpenModifiedFiles()
  silent only
  let status = system('git status -s | remove-colors | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
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

  let nb_lines = line('$')
  if nb_lines < 500 |
    set nolazyredraw
  else
    set lazyredraw
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

function! FileSearchVerb(type, ...)
  exe 'normal! `[v`]y'
  let @/ = @"
  let cmd = ":FileSearch -i -Q '" . @/ . "' \<left>\<left>"
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
  exe a:cmd
  call winrestview(view)
endfunction

function! ExecuteMacroOnSelection()
  exe ":'<,'>normal @" . nr2char(getchar())
endfunction

function! OnGoyoEnter()
  silent !tmux set status off
endfunction

function! OnGoyoLeave()
  silent !tmux set status on
endfunction

python import vim
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
  if !filereadable(expand('%:p')) | return | endif
  if &filetype !~ '^\(ruby\|javascript\|scss\)' | return 0 | endif

  if &filetype =~ 'javascript'
    Neomake eslint
  else
    Neomake
  end
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

function! EnhancedMetaLeft()
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let nextnext = 1
  let i = 2
  while nextnext < pos
    let next = nextnext
    let nextnext = match(line, '\<\S\|\>\S\|\s\zs\S\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat("\<Left>", pos - next)
endfunction

function! EnhancedMetaRight()
  return AbstractRight("\<Right>")
endfunction

function! AbstractRight(command)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let i = 2
  while next <= pos && next > 0
    let next = match(line, '\<\S\|\>\S\|\s\zs\S\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:command, next - pos)
endfunction

function! EnhancedMetaDeleteRight()
  return AbstractRight("\<Right>\<BS>")
endfunction

function! RenameTab()
  let tab_name = input('Tab name: ', '')
  call settabvar(tabpagenr(), 'tab_name', tab_name)
  set showtabline=1
endfunction

function! Join()
  let last_char = getline('.')[col('$')-2]
  " normal! mCJ
  normal! J
  if last_char == '('
    normal x
  endif
  " normal `C
endfunction

function! GetFoldText()
  let text = getline(v:foldstart)
  let width = winwidth(0) - &foldcolumn - strwidth(text)
  return text . repeat(' ', width)
endfunction

function! ToggleFoldSyntax()
  if &foldmethod == 'manual'
    setl foldenable
    setl foldlevel=1
    setl foldmethod=syntax
  else
    setl foldmethod=manual
    normal zR
  endif
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

function! MakePlugSnapshot()
  PlugSnapshot! ~/.vim/plug_snapshot.vim
endfunction

function! ToggleZoom()
  if !exists('t:zoomed') | let t:zoomed = 0 | endif
  if t:zoomed
    wincmd =
    let t:zoomed = 0
  else
    wincmd |
    wincmd _
    let t:zoomed = 1
  endif
endfunction

let s:named_registers = split('abcdefghijklmnopqrstuvwxyz', '\zs')
let g:is_recording=0
let s:recorded_register=0
function! EnableMacroMappings(enable)
  for named_register in s:named_registers
    if a:enable
      exe 'noremap <silent> q' . named_register . ' :call RecordMacro("' . named_register . '")<cr>'
    else
      exe 'unmap q' . named_register
    endif
  endfor
endfunction
call EnableMacroMappings(1)

function! RecordMacro(named_register)
  let g:is_recording=1
  let s:recorded_register=a:named_register
  exe 'normal! q' . a:named_register
  call EnableMacroMappings(0)
endfunction

function! PlayLastMacro()
  if !g:is_recording && s:recorded_register != ''
    exe 'normal @' . s:recorded_register
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
	autocmd filetype mru call OnMRUDisplayed()
	autocmd TermOpen *test* call OnTestDisplayed()
	autocmd TermOpen *ag\ * call OnFileSearchDisplayed()
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
  autocmd User GoyoEnter nested call OnGoyoEnter()
  autocmd User GoyoLeave nested call OnGoyoLeave()
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
  autocmd BufWritePre * call TrimTrailingWhitespace()
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd InsertLeave * silent! set nopaste
  autocmd BufRead,BufNewFile *_spec.rb set syntax=rspec
  autocmd BufEnter * call BufEnterConfig()
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
  autocmd BufRead,BufNewFile *.html* setlocal matchpairs="(:),[:],{:}"
  autocmd User FzfStatusLine setlocal statusline=\ "
augroup end

set exrc
set secure
