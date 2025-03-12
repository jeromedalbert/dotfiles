"###############
"### Plugins ###
"###############

call plug#begin('~/.vim/plugged')
Plug $HOMEBREW_PREFIX . '/opt/fzf' | Plug 'jeromedalbert/fzf.vim', { 'branch': 'better-fzf.vim' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'SirVer/ultisnips'
Plug 'neomake/neomake', { 'on': [] }
Plug 'jlanzarotta/bufexplorer'
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast'] }
Plug 'mattn/emmet-vim', { 'for': ['*html', '*css', '*jsx', 'php'] }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'on': [] }
  " Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'stevearc/conform.nvim'

  Plug 'github/copilot.vim', { 'branch': 'release' }
  Plug 'jeromedalbert/aider.nvim', { 'on': [], 'branch': 'custom' }
endif

Plug 'vim-ruby/vim-ruby', { 'for': '*ruby' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript*', '*html'] }
Plug 'mxw/vim-jsx', { 'for': 'javascript*' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'othree/html5.vim', { 'for': '*html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'towolf/vim-helm'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'rhysd/vim-textobj-conflict'
Plug 'b4winckler/vim-angry'
Plug 'tek/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'whatyouhide/vim-textobj-erb', { 'for': 'eruby' }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist', { 'on': [] }
Plug 'tpope/vim-fugitive', { 'on': [] }
Plug 'jeromedalbert/vim-rails', { 'branch': 'better-vim-rails', 'on': [] }
Plug 'jeromedalbert/vim-cool', { 'branch': 'better-vim-cool' }

Plug 'machakann/vim-sandwich'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'jeromedalbert/auto-pairs', { 'branch': 'better-auto-pairs' }
Plug 'kurkale6ka/vim-pairs'
Plug 'valloric/MatchTagAlways', { 'on': [] }
" Plug 'vim-scripts/closetag.vim', { 'for': ['*html', 'xml', '*jsx'] }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'nishigori/increment-activator'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'xolox/vim-misc', { 'on': ['SaveSession', 'OpenSession'] }
Plug 'xolox/vim-session', { 'on': ['SaveSession', 'OpenSession'] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'fidian/hexmode', { 'on': 'Hexmode' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'jeromedalbert/vim-buffer-history', { 'branch': 'fix-popup-windows' }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'haya14busa/vim-edgemotion'
Plug 'rhysd/conflict-marker.vim'
Plug 'Konfekt/vim-alias'
call plug#end()

"############################
"### General key mappings ###
"############################

let mapleader = ' '
noremap - :

map J 5j
map K 5k
map 0 ^
noremap Y y$
noremap Q <nop>
noremap ' "
noremap $ $ze

noremap <silent> <leader>q :q<cr>
noremap <silent> <leader>w :w<cr>:Lint<cr>
noremap <silent> <leader>z :x<cr>
noremap <silent> <leader><esc> <nop>
noremap <silent> <leader>`q :cq<cr>
noremap <silent> <leader>`w :w !sudo tee % > /dev/null<cr>

inoremap <up> <c-p>
inoremap <down> <c-n>

noremap! <c-a> <home>
noremap! <c-e> <end>
noremap! <c-b> <left>
noremap! <c-f> <right>
noremap! <c-d> <del>
snoremap <c-d> <del>
inoremap <c-k> <c-o>D
cnoremap <c-k> <c-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cmap <m-A> <c-a>
cmap <m-E> <c-e>

map <silent> <m-d> <c-d>
map <silent> <m-b> <c-b>
map <silent> <m-f> <c-f>
inoremap <m-d> <c-o>dw
inoremap <m-b> <s-left>
inoremap <m-f> <s-right>

noremap <silent> <backspace> :enew<cr>
noremap <silent> <m-backspace> ggdG
noremap <silent> <m-v> :vnew<cr>
noremap <silent> <m-V> :vsplit<cr>
noremap <silent> <m-s> :new<cr>
noremap <silent> <m-S> :split<cr>
noremap <silent> <down> <esc>:tabnew<cr>

noremap <silent> <m-q> :q<cr>
for tab_number in [1, 2, 3, 4, 5, 6, 7, 8]
  exe 'noremap <silent> <m-' . tab_number . '> :tabnext ' . tab_number . '<cr>'
endfor
nnoremap <c-h> gT
noremap <c-l> gt
noremap <silent> <leader>tc :silent! tabclose<cr>
map <silent> <leader>tq <leader>tc
noremap <silent> <leader>to :silent! tabonly<cr>
noremap <silent> <leader>tn <c-w>T

noremap <leader>e :e $MYVIMRC<cr>

noremap <leader><leader> <C-^>
map [2 2[b
map [3 3[b
map ]2 2]b
map ]3 3]b

noremap <m-;> mCA;<esc>`C
inoremap <m-;> <C-o>A;
noremap <m-,> mCA,<esc>`C
inoremap <m-,> <C-o>A,
noremap <m->> mCA.<esc>`C
imap <m->> <C-o>A.
imap <m-.> <C-o>A.
noremap <m-:> mCA:<esc>`C
inoremap <m-:> <C-o>A:

nnoremap <m-m> %
onoremap <m-m> %
nnoremap <m-]> <c-]>
nnoremap <m-[> <c-t>
imap <m-_> <c-_>

noremap <leader>n <c-w>w
noremap <leader>p <c-w>W

noremap <silent> <leader>op :silent! exe '!open ' . getcwd()<cr>
noremap <silent> <leader>o. :silent! exe '!open ' . expand('%:h')<cr>
noremap <silent> <leader>of :silent! exe '!open %'<cr>
noremap <silent> <leader>ob<esc> <nop>
noremap <silent> <leader>or :e README*<cr>
noremap <silent> <leader>oR :vnew<cr>:e README*<cr>
noremap <silent> <leader>o<esc> <nop>
noremap <silent> <leader>oq :copen<cr>

noremap <leader>9 i<space><esc>l
noremap <leader>0 a<space><esc>h

map <leader>2 @
noremap <leader>22 @@
noremap @- @:
noremap <leader>2- @:
noremap <leader>1 :silent !
noremap <leader>5 :%!

noremap <leader>ft :set filetype=

nnoremap gV `[V`]

noremap zs zt
noremap z0 zs
nnoremap <silent> zp :let old=&sidescrolloff<cr>:setl sidescrolloff=999<cr>:exe 'setl sidescrolloff=' . old<cr>
noremap z<Space> za

noremap <leader>ytw :setl wrap!<cr>
noremap <leader>ytl :setl number!<cr>:setl relativenumber!<cr>
noremap <leader>yts :windo set scrollbind!<cr>

noremap <silent> <m-_> :let t:zoomed=1<cr><c-w>10>
noremap <silent> <m-)> :let t:zoomed=1<cr><c-w>10<

nnoremap <silent> <m-J> :move .+1<cr>
xnoremap <silent> <m-J> :move '>+1<cr>gv
nnoremap <silent> <m-K> :move .-2<cr>
xnoremap <silent> <m-K> :move '<-2<cr>gv

noremap <silent> ]Q :clast<cr>
noremap <silent> [Q :cfirst<cr>
noremap <silent> ]L :llast<cr>
noremap <silent> [L :lfirst<cr>

noremap <silent> <leader>rg :e Gemfile<cr>
noremap <silent> <leader>rG :vnew<cr>:e Gemfile<cr>
noremap <silent> <leader>rl :e Gemfile.lock<cr>
noremap <silent> <leader>rL :vnew<cr>:e Gemfile.lock<cr>
noremap <silent> <leader>rh :s/:\([^ ]*\)\(\s*\)=>/\1:<cr>
nnoremap <silent> <leader>rH :%s/:\([^ ]*\)\(\s*\)=>/\1:<cr>
noremap <silent> <leader>rr :e config/routes.rb<cr>
noremap <silent> <leader>rR :vnew<cr>:e config/routes.rb<cr>
noremap <silent> <leader>rs :e db/schema.rb<cr>
noremap <silent> <leader>rS :vnew<cr>:e db/schema.rb<cr>
noremap <silent> <leader>rd :e config/database.yml<cr>
noremap <silent> <leader>rD :vnew<cr>:e config/database.yml<cr>
noremap <silent> <leader>rp /^\s*\(private\\|protected\)$<cr>^

"######################################
"### Plugins/functions key mappings ###
"######################################

inoremap <silent> <tab> <c-r>=TabComplete()<cr>
snoremap <silent> <tab> <esc>:call UltiSnips#JumpForwards()<cr>
inoremap <silent> <s-tab> <c-r>=UltiSnips#JumpBackwards()<cr>
snoremap <silent> <s-tab> <esc>:call UltiSnips#JumpBackwards()<cr>

nnoremap <expr> k Jumpable('gk')
nnoremap <expr> j Jumpable('gj')
xnoremap <expr> k Jumpable('gk')
xnoremap <expr> j Jumpable('gj')

nnoremap <silent> <esc> :nohlsearch<cr>:call ClearEverything()<cr>

noremap <m-/> :call ShowHighlightsUnderCursor()<CR>
noremap <m-?> :call ShowAllHighlights()<CR>

noremap <silent> <m-}> :call TabMove('+')<cr>
noremap <silent> <m-{> :call TabMove('-')<cr>
noremap <silent> <m-L> :call TabMove('+')<cr>
noremap <silent> <m-H> :call TabMove('-')<cr>

noremap <silent> <up> :silent call BrowseFiles()<cr>
noremap <silent> <leader>i :silent call BrowseBufferTags()<cr>
noremap <silent> <m-P> :silent call BrowseAllTags()<cr>
noremap <silent> <m-space> :silent call BrowseDirectoryFiles()<cr>

if has('nvim')
  tnoremap <expr> <esc> &filetype == 'fzf' ? "\<c-g>" : "\<c-\>\<c-n>"
endif

noremap <silent> <leader>k :NERDTreeToggle<CR>
noremap <silent> <leader>g :silent! NERDTreeFind<CR>

map gs gS
map gj gJ

nmap cm <Plug>Commentary
nmap cmm <Plug>CommentaryLine
nmap cmu <Plug>Commentary<Plug>Commentary

noremap <silent> <leader>a :silent w<cr>:TestFile<cr>
noremap <silent> <leader>c :silent w<cr>:TestNearest<cr>
noremap <silent> <leader>l :silent w<cr>:TestLast<cr>
nnoremap <silent> <leader>m :call EditAlternateFile(0)<cr>
nnoremap <silent> <leader>v :call EditAlternateFile(1)<cr>

noremap <leader>fmo :call MoveCurrentFile()<cr>
noremap <leader>fre :call RenameCurrentFile()<cr>
noremap <leader>fdu :call DuplicateCurrentFile()<cr>
noremap <leader>fde :call DeleteCurrentFile()<cr>
map <leader>frm <leader>fde
noremap <leader>fcp :call CopyCurrentFilePath()<cr>
noremap <leader>fcP :call CopyCurrentFilePath(1)<cr>
noremap <leader>fcap :call CopyCurrentFileAbsolutePath()<cr>
noremap <leader>fcaP :call CopyCurrentFileAbsolutePath(1)<cr>
noremap <leader>fcn :call CopyCurrentFileName()<cr>
noremap <leader>fn :call CreateNewFileInCurrentDir()<cr>
noremap <leader>fN :call CreateNewFile()<cr>

noremap <silent> <leader>fjs :set filetype=json<cr>:%!jq '.'<cr>
xnoremap <silent> <leader>fjs :!jq '.'<cr>
nmap <silent> <leader>frh :call FormatRubyHashToJson()<cr>
noremap <silent> <leader>fja :set filetype=javascript<cr>:%!js-beautify -s 2<cr>
xnoremap <silent> <leader>fja :!js-beautify -s 2<cr>
noremap <silent> <leader>fh :silent %!tidy -qi
  \ --show-errors 0 --force-output yes --tidy-mark no --wrap 0 --doctype omit<cr>
noremap <silent> <leader>fx :silent %!tidy -qi -xml --show-errors 0<cr>
noremap <silent> <leader>fs :%s/["\\]/<cr>:set filetype=sql<cr>:%!sqlformat --reindent --indent_columns --keywords upper --identifiers lower -<cr>
xnoremap <silent> <leader>fs :!sqlformat --reindent --indent_columns --keywords upper --identifiers lower -<cr>
noremap <silent> <leader>fg :set filetype=graphql<cr>x:silent! %s/↵/\r<cr>:silent! %s/\\n/\r<cr>dd
noremap <silent> <leader>fo :copen<cr>

noremap <silent> <m--> :set virtualedit=all<cr>20zl
xnoremap <silent> <m--> 20zl
noremap <silent> <m-0> 20zh:call SetVirtualEdit()<cr>
xnoremap <silent> <m-0> 20zh
nnoremap <silent> ^ ^:set virtualedit=<cr>ze
nnoremap <silent> $ $:set virtualedit=<cr>ze
nnoremap <silent> <m-_> zl
xnoremap <silent> <m-_> zl
nnoremap <silent> <m-)> zh
xnoremap <silent> <m-)> zh

noremap <silent> <c-z> :call OnVimSuspend()<cr>:suspend<cr>:call OnVimResume()<cr>

noremap <m-t> :call ToggleQuotes()<cr>
inoremap <m-t> <c-o>:call ToggleQuotes()<cr>
cnoremap <m-t> <c-e><c-w>"" <left><left>

map <leader>; `]]<space>
inoremap <m-J> <esc>O
noremap <m-O> O<cr>
inoremap <m-O> <esc>O<cr>

noremap <leader>ff :FileSearch -Q -i '' <left><left>
noremap <silent> <leader>yf :set opfunc=FileSearchVerb<CR>g@
map <leader>fw <leader>yfiw
map <leader>fW <leader>yfiW
xnoremap <leader>ff y:let @/ = GetSelectionForSearches()<cr><leader>ff<c-r>=@/<cr>
cnoremap <c-l> <end><space>-G '\.'<space><left><left>
cnoremap <expr> <c-g> getcmdtype() == ":" ? "<end><space>-G ''<space><left><left>" : "<c-g>"

noremap <leader>ytd :call ToggleDiff()<cr>
noremap <leader>ygt :call GenerateTags()<cr>
map <silent> <leader>yb <Plug>BreakCharacter
noremap <silent> <leader>yc :.!calc -p<cr>

noremap <leader>-- @:
noremap <leader>-b :call DeleteHiddenBuffers()<cr>
noremap <leader>-u :call ClearUndos()<cr>
noremap <leader>-k :silent! call ResetProject()<cr>

map gR gr$
nmap cX cx$
nnoremap cc cc

noremap <silent> <leader>oo :silent call BrowseOldFiles()<cr>
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>
noremap <silent> <leader>on :e ~/.notes<cr>
noremap <silent> <leader>oN :vnew<cr>:e ~/.notes<cr>
noremap <silent> <leader>obk :call OpenCurrentFileBackupHistory()<cr>
noremap <silent> <leader>obr :call OpenInBrowser()<cr>
noremap <silent> <leader>og V:<c-u>call OpenCurrentFileInGithub()<cr>
xnoremap <silent> <leader>og :<c-u>call OpenCurrentFileInGithub()<cr>
noremap <silent> <leader>oG V:<c-u>call OpenCurrentFileInGithub(1)<cr>
xnoremap <silent> <leader>oG :<c-u>call OpenCurrentFileInGithub(1)<cr>
noremap <silent> <leader>ou :call ReadUndoFile()<cr>:GundoToggle<cr>

noremap <leader>yq :call MakeSession('')<cr>:qa!<cr>
noremap <leader>yl :call LoadSession('')<cr>

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
xnoremap <leader>x <esc>:%s/<c-r>=GetSelectionForSearches()<cr>/

nnoremap <leader>s :s/
nmap <leader>S <leader>ysiw
nnoremap <silent> <leader>ys :set opfunc=SubstituteVerb<CR>g@
nmap <leader>yS <leader>ysiW
xnoremap <leader>s :s/\%V

xnoremap * <esc>/<c-r>=GetSelectionForSearches()<cr><cr>
xnoremap # <esc>?<c-r>=GetSelectionForSearches()<cr><cr>

command! -nargs=+ -complete=file FileSearch silent! call FileSearch(<q-args>)
command! -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { 'options': $FZF_DEFAULT_OPTS })
command! -nargs=1 GemOpen call GemOpen(<q-args>)
command! Gblame call LazyLoadFugitive('Git blame')
command! Gmodified call OpenOutputInArgslist('git ls-files --modified --others --exclude-standard')
command! Glastcommit call OpenOutputInArgslist('git diff --name-only HEAD^')
command! Glastcommit call OpenOutputInArgslist('git diff --name-only HEAD^')
command! Gadd call GitAdd()
command! Grm silent !git rm %
command! MakePlugSnapshot PlugSnapshot! ~/.vim/.plug_snapshot.vim
command! RestorePlugSnapshot source ~/.vim/.plug_snapshot.vim
command! Profile call Profile()
command! Lint call LazyLint()
command! -range=0 FocusSelection call FocusSelection(<count>)
command! -nargs=? Wd call WriteDesktop(<q-args>)
command! -nargs=? Mksession call MakeSession(<q-args>)
command! -nargs=? Ldsession call LoadSession(<q-args>)

cabbrev plugi PlugInstall
cabbrev plugc PlugClean
cabbrev plugu PlugUpdate
cabbrev plugst PlugStatus
cabbrev plugs MakePlugSnapshot
cabbrev plugr RestorePlugSnapshot
cabbrev goyo Goyo
cabbrev gb Gblame
cabbrev gm Gmodified
cabbrev gl Glastcommit
cabbrev ga Gadd
cabbrev grm Grm
cabbrev prof Profile
cabbrev gmo GemOpen
cabbrev focus FocusSelection
cabbrev wd Wd
cabbrev mksession Mksession
cabbrev mks Mksession
cabbrev ldsession Ldsession
cabbrev lds Ldsession

xnoremap @ :<C-u>call ExecuteMacroOnSelection()<cr>
xnoremap <leader>2 :<C-u>call ExecuteMacroOnSelection()<cr>

noremap <silent> <leader>th :call MergeToPrevTab()<cr>
noremap <silent> <leader>tl :call MergeToNextTab()<cr>
noremap <silent> <leader>tr :call RenameTab()<cr>
noremap <silent> <m-.> :call GoToLastActiveTab()<cr>

nnoremap <silent> <leader>b :BufExplorerHorizontalSplit<cr>
map <silent> <leader>j <Plug>Join

cnoremap <expr> <m-b> MovePreviousWord("\<left>")
cnoremap <expr> <m-f> MoveNextWord("\<right>")
cnoremap <expr> <m-d> MoveNextWord("\<right>\<bs>")
cnoremap <expr> <m-B> MovePreviousCase("\<left>")
cnoremap <expr> <m-W> MovePreviousCase("\<bs>")
cnoremap <expr> <m-F> MoveNextCase("\<right>")
cnoremap <expr> <m-D> MoveNextCase("\<right>\<bs>")

nnoremap <silent> ze :call MoveToQuarterScreen()<cr>
nnoremap <silent> zn :call ToggleFoldSyntax()<cr>

noremap <silent> <m-=> :call ToggleZoom()<cr>

nnoremap <silent> gf :call ImprovedGoToFile()<cr>
nnoremap <silent> gF :vsplit<cr>:call ImprovedGoToFile()<cr>
noremap <silent> <c-w>gf :tab split<cr>:call ImprovedGoToFile()<cr>
noremap <silent> gl :call DisplayEnclosingLine()<cr>

noremap ga= :Tabularize /=<cr>
noremap ga<bar> :Tabularize /<bar><cr>
map gat ga<bar>
noremap ga<space> :Tabularize / /l0<cr>

noremap <silent> ]b :BufferHistoryForward<cr>
noremap <silent> [b :BufferHistoryBack<cr>
noremap <silent> ]B :call BufferHistoryLast()<cr>
noremap <silent> [B :call BufferHistoryFirst()<cr>
map <silent> ]<space> <Plug>InsertLineAfter
map <silent> [<space> <Plug>InsertLineBefore
noremap <silent> ]f :<c-u>call CycleToNextFile(v:count1)<cr>
noremap <silent> [f :<c-u>call CycleToNextFile(-v:count1)<cr>
noremap <silent> ]F :<c-u>execute CycleToNextFile(-1, 1)<cr>
noremap <silent> [F :<c-u>execute CycleToNextFile(0, 1)<cr>
noremap <silent> ]a :call ArgListNext('next')<cr>
noremap <silent> ]A :call ArgListNext('last')<cr>
noremap <silent> [a :call ArgListNext('previous')<cr>
noremap <silent> [A :call ArgListNext('first')<cr>
noremap <silent> ]q :call QfListNext('next')<cr>
noremap <silent> [q :call QfListNext('previous')<cr>
noremap <silent> ]l :call LocListNext('next')<cr>
noremap <silent> [l :call LocListNext('previous')<cr>
map [e <Plug>MovePreviousInsideIndent
map ]e <Plug>MoveNextInsideIndent
map [E <Plug>MovePreviousAroundIndent
map ]E <Plug>MoveNextAroundIndent
map <silent> [o :mark '<cr>^h<Plug>(edgemotion-k)^
map <silent> ]o :mark '<cr>^h<Plug>(edgemotion-j)^
noremap <silent> ]x :call ConflictMarkerNext(1)<cr>
noremap <silent> [x :call ConflictMarkerNext(0)<cr>
nmap ]X G[x
nmap [X gg]x
noremap [r :ConflictMarkerOurselves<cr>
noremap ]r :ConflictMarkerThemselves<cr>
nmap ]w :call GitAdd()<cr>]a]x

map <silent> <C-j> :mark '<cr><Plug>(edgemotion-j)
map <silent> <C-k> :mark '<cr><Plug>(edgemotion-k)

xmap <silent> aa <Plug>AngryOuterSuffix
omap <silent> aa <Plug>AngryOuterSuffix
xmap <silent> ia <Plug>AngryInnerSuffix
omap <silent> ia <Plug>AngryInnerSuffix

noremap <silent> <leader>rm :call ShowLatestRailsMigration()<cr>
noremap <silent> <leader>rM :vnew<cr>:call ShowLatestRailsMigration()<cr>
xnoremap <silent> <leader>rp :<c-u>call ExtractRailsPartial()<cr>
noremap <silent> <leader>re :call EvalRubyBuffer()<cr>
noremap <silent> <leader>ru :call EvalRailsBuffer()<cr>
noremap <silent> <leader>rb :call AddDebugBreakpoint()<cr>
noremap <leader>rc :call CopyCurrentRubyClassName()<cr>
noremap <leader>rC :call CopyCurrentRubyMethodName()<cr>
noremap <leader>rxp :call CreateRubyPrivate()<cr>
noremap <leader>rxm :call CreateRubyMethod(0, 0)<cr>
noremap <leader>rxM :call CreateRubyMethod(1, 0)<cr>
noremap <leader>rxcm :call CreateRubyMethod(0, 1)<cr>
noremap <leader>rxcM :call CreateRubyMethod(1, 1)<cr>

noremap <silent> <cr> :call ReplayLastMacro()<cr>

" noremap <silent> <leader>C :call ShowCopilotPanel()<cr>
" noremap <silent> <leader>A <Plug>(AvanteAsk)
noremap <silent> <leader>A :call LazyLoadAider()<cr>:lua AiderOpen()<cr>
noremap <silent> <leader>C :call OpenCursor()<cr>
noremap <silent> c. :call OpenVisibleBuffersInCursor()<cr>

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
set number numberwidth=5
set expandtab tabstop=2 shiftwidth=2 autoindent smarttab
set incsearch ignorecase smartcase hlsearch
set noshowmatch
set nrformats-=octal
set noerrorbells visualbell t_vb= belloff=all
set backspace=indent,eol,start
set shortmess+=Ic
set laststatus=2
set mouse=a
set title titlestring=%{GetProjectName()}
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
set wildoptions=
" set complete=.,w,b
set complete=.,w,b,u
" set complete=.,w,b,u,t
set grepprg=ag
set gdefault
set fillchars+=vert:\ "
set nofoldenable
set foldtext=GetFoldText()
" set foldmethod=indent
" set foldlevelstart=1
" set foldlevelstart=99
set tabline=%!GetTabLine()
set pumheight=8
set nojoinspaces
set sessionoptions-=options
set sidescroll=1 sidescrolloff=3
set wildignorecase
set wildignore=.DS_Store,.localized,.tags*,tags,.keep,.gitkeep,*.pyc,*.class,*.swp,*.dump,.aider*
set diffopt=vertical,filler,foldcolumn:0
set whichwrap=b,s,h,l
set synmaxcol=1000
set showtabline=2
set regexpengine=1
set formatoptions+=j
set history=500
set langnoremap
exe "set cedit=\<c-o>"
set path=.,,
set nomodeline
set scrollopt=ver,hor,jump

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
  set inccommand=
  let $MYVIMRC_LUA = $MYVIMRC . '.lua'
endif
if has('gui_running')
  set guifont=Menlo:h14 linespace=3
  hi Cursor guifg=white guibg=red
  if !exists('g:vscode')
    set macmeta
  endif
endif

let g:python3_host_prog = '/Users/jerome/.asdf/shims/python3'
let g:ruby_host_prog = '/Users/jerome/.asdf/shims/neovim-ruby-host'
let g:node_host_prog = '/Users/jerome/.asdf/shims/neovim-node-host'
let g:perl_host_prog = $HOMEBREW_PREFIX . '/bin/perl'
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

let html_no_rendering = 1
let g:html_indent_inctags = 'p,main'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:ruby_path = ''
let g:vim_indent_cont = &sw
let g:is_bash = 1
let g:vimsyn_minlines = 50

let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_vimballPlugin = 1

"#############################
"### Plugins configuration ###
"#############################

" let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.93, 'yoffset': 0.4, 'border': 'none' } }
let g:fzf_layout = { 'window': 'let g:launching_fzf = 1 | keepalt topleft 100split enew' }

let g:fzf_colors = {
  \ 'fg':        ['fg', 'Normal'],
  \ 'bg':        ['bg', 'Normal'],
  \ 'fg+':       ['fg', 'Normal'],
  \ 'bg+':       ['bg', 'Normal'],
  \ 'hl':        ['fg', 'Statement'],
  \ 'hl+':       ['fg', 'Statement'],
  \ 'pointer':   ['fg', 'Statement']
  \ }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'alt-t': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ 'alt-v': 'vsplit',
  \ 'alt-s': 'split'
  \ }
let g:fzf_history_dir = '~/.fzf_history'
let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores --hidden -g ""'
let $FZF_DEFAULT_OPTS .=
  \ ' --no-bold --color="info:#2f2f2f,spinner:#2f2f2f" --prompt="  "'
  \ . ' --bind="ctrl-o:previous-history,ctrl-i:next-history"'

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeIgnore = [
  \ '\.rubocop-http', '\.notes$', '\.my-snippets',
  \
  \ '^\.svn$', '^\.git$', '^\.hg$', '^\CVS$', '^\.idea$', '^\.sass-cache$',
  \ '^tmp$', '^log$', '^coverage$', '^node_modules$', '^builds$'
  \ ]
let NERDTreeQuitOnOpen = 1
let NERDTreeHighlightCursorline = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeCreatePrefix='silent keepalt keepjumps'
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHijackNetrw = 0
let g:NERDTreeMapCWD = '<nul>'
let g:NERDTreeMapChdir = '<nul>'
let NERDTreeMapChangeRoot = 'd'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 0

let g:rails_no_syntax = 1
let g:rails_single_quotes_style = 1
let g:unimpaired_no_toggling = 1

let g:UltiSnipsSnippetDirectories=['my-snippets', '.my-snippets']
let g:UltiSnipsExpandTrigger = '<nul>'
let g:UltiSnipsListSnippets = '<nul>'
let g:UltiSnipsJumpForwardTrigger = '<nul>'
let g:UltiSnipsJumpBackwardTrigger = '<nul>'

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

let g:neomake_verbose = 0
let g:neomake_place_signs = 0
let g:neomake_highlight_columns = 0
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = []
let g:neomake_html_enabled_makers = []
let g:neomake_markdown_enabled_makers = []
let g:neomake_sh_enabled_makers = ['sh']
let g:neomake_zsh_enabled_makers = ['zsh']
let g:neomake_ruby_mri_maker = {
  \ 'exe': 'ruby',
  \ 'args': ['-c', '-w'],
  \ 'output_stream': 'both',
  \ 'errorformat': '%-G%\m%.%#warning: %\%%(possibly %\)%\?useless use of == in void context,' .
  \   '%-G%\%.%\%.%\%.%.%#,' .
  \   '%-GSyntax OK,'.
  \   '%E%f:%l: syntax error\, %m,'.
  \   '%Z%p^,'.
  \   '%W%f:%l: warning: %m,'.
  \   '%Z%p^,'.
  \   '%W%f:%l: %m,'.
  \   '%-C%.%#'
  \ }
let g:neomake_ruby_rubocop_maker = {
  \ 'exe': 'bundle',
  \ 'args': ['exec', 'rubocop', '--format', 'emacs', '--force-exclusion', '--display-cop-names'],
  \ 'errorformat': '%f:%l:%c: %t: %m,%E%f:%l: %m',
  \ 'postprocess': function('neomake#makers#ft#ruby#RubocopEntryProcess')
  \ }

let g:mta_filetypes = {
  \ 'html': 1,
  \ 'eruby.html': 1,
  \ 'xml': 1,
  \ 'javascript.jsx': 1
  \ }

call operator#sandwich#set('all', 'all', 'highlight', 0)
runtime plugged/vim-sandwich/macros/sandwich/keymap/surround.vim
nunmap ds
nunmap dss
let g:sandwich#recipes += [
  \ {
  \   'buns':         ['before do', 'end'],
  \   'nesting':      1,
  \   'match_syntax': 1,
  \   'skip_break':   1,
  \   'linewise':     1,
  \   'command':      ["normal! kV="],
  \   'filetype':     ["rspec"],
  \   'input':        ['B']
  \ },
  \ {
  \   'buns':         ['do', 'end'],
  \   'action':       ['add'],
  \   'nesting':      1,
  \   'match_syntax': 1,
  \   'skip_break':   1,
  \   'linewise':     1,
  \   'command':      ["normal! vip="],
  \   'filetype':     ['ruby'],
  \   'input':        ['d']
  \ },
  \ {
  \   'buns':         ['^.*do$', 'end'],
  \   'action':       ['delete'],
  \   'regex':        1,
  \   'nesting':      1,
  \   'match_syntax': 1,
  \   'skip_break':   1,
  \   'linewise':     1,
  \   'command':      ["normal! vip="],
  \   'filetype':     ['ruby'],
  \   'input':        ['d']
  \ },
  \ {
  \   'buns':         ['^\s*if .*', 'end'],
  \   'action':       ['delete'],
  \   'regex':        1,
  \   'nesting':      1,
  \   'match_syntax': 1,
  \   'skip_break':   1,
  \   'linewise':     1,
  \   'command':      ["normal! vip="],
  \   'filetype':     ['ruby'],
  \   'input':        ['i']
  \ },
  \ {
  \   'buns':         ['\(^\s*if \)\|\(^.*do$\)', 'end'],
  \   'action':       ['delete'],
  \   'regex':        1,
  \   'nesting':      1,
  \   'match_syntax': 1,
  \   'skip_break':   1,
  \   'linewise':     1,
  \   'command':      ["normal! vip="],
  \   'filetype':     ['ruby'],
  \   'input':        ['r']
  \ }
  \ ]

let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''

let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_auto_set_tags = 0
let g:gutentags_ctags_exclude = ['.json']

let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_curly_braces = 0

let g:ruby_indent_assignment_style = 'variable'
let g:markdown_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = []
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
let g:jsx_ext_required = 0
let g:vue_pre_processors = []
let g:go_highlight_functions = 1

" let g:go_highlight_format_strings = 1
" let g:go_highlight_types = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
" let g:go_highlight_variable_declarations = 1

let g:test#strategy = 'custom'
let g:test#no_alternate = 1

let g:projectionist_heuristics = {
  \  'config/application.rb&spec/': {
  \    'app/*.rb': { 'alternate': 'spec/{}_spec.rb' },
  \    'lib/*.rb': { 'alternate': 'spec/lib/{}_spec.rb' },
  \    'spec/*_spec.rb': { 'alternate': 'app/{}.rb' },
  \    'spec/lib/*_spec.rb': { 'alternate': 'lib/{}.rb' }
  \  },
  \  'config/application.rb&test/&!spec/': {
  \    'app/*.rb': { 'alternate': 'test/{}_test.rb' },
  \    'lib/*.rb': { 'alternate': 'test/lib/{}_test.rb' },
  \    'test/*_test.rb': { 'alternate': 'app/{}.rb' },
  \    'test/lib/*_test.rb': { 'alternate': 'lib/{}.rb' }
  \  },
  \  'spec/spec_helper.rb&!config/application.rb': {
  \    'lib/*.rb': { 'alternate': 'spec/{}_spec.rb' },
  \    'spec/*_spec.rb': { 'alternate': 'lib/{}.rb' }
  \  },
  \  'test/test_helper.rb&!config/application.rb&!spec/': {
  \    'lib/*.rb': { 'alternate': 'test/{}_test.rb' },
  \    'test/*_test.rb': { 'alternate': 'lib/{}.rb' }
  \  },
  \  'go.mod': {
  \    '*.go': { 'alternate': '{}_test.go'},
  \    '*_test.go': { 'alternate': '{}.go'},
  \  },
  \  '*': {
  \    'Gemfile': { 'alternate': 'Gemfile.lock' },
  \    'Gemfile.lock': { 'alternate': 'Gemfile' },
  \    'go.mod': { 'alternate': 'go.sum' },
  \    'go.sum': { 'alternate': 'go.mod' }
  \  }
  \ }

let g:increment_activator_filetype_candidates = {
  \  '_': [
  \    ['asc', 'desc'],
  \    ['enable', 'disable'],
  \    ['private', 'public']
  \  ],
  \ 'rspec': [
  \    ['build', 'create']
  \  ]
  \ }

let g:conflict_marker_enable_hooks = 0
let g:conflict_marker_enable_highlight = 0
let g:loaded_textobj_conflict = 1
call textobj#user#plugin('conflict', {
  \  '_' : {
  \    'select-i' : 'ix', '*select-i-function*' : 'textobj#conflict#select_i',
  \    'select-a' : 'ax', '*select-a-function*' : 'textobj#conflict#select_a',
  \  }
  \ })

let g:scrollbar_right_offset = 1
let g:scrollbar_shape = {
  \ 'head': ' ',
  \ 'body': ' ',
  \ 'tail': ' ',
  \ }
let g:scrollbar_highlight = {
  \ 'head': 'LineNr',
  \ 'body': 'LineNr',
  \ 'tail': 'LineNr',
  \ }
let g:scrollbar_excluded_filetypes = ['nerdtree']

let g:vim_ai_chat = {
  \  "ui": {
  \    "paste_mode": 0,
  \  }
  \ }

let g:copilot_filetypes = {
  \ 'text': v:false,
  \ 'markdown': v:false,
  \ }

let g:angry_disable_maps = 1
let g:incsearch#auto_nohlsearch = 1
let g:gundo_help = 0
let g:gundo_prefer_python3 = 1
let g:netrw_altfile = 1
let g:csv_delim_test = ',;|'
let g:pasta_disabled_filetypes = ['fugitiveblame']

"#################
"### Functions ###
"#################

function! TabComplete()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return ''
  elseif IsEmmetExpandable()
    return emmet#expandAbbr(0, '')
  else
    return copilot#Accept("\<tab>")
    " return "\<tab>"
  endif
endfunction

function! IsEmmetExpandable()
  try
    if &filetype !~ 'html\|css\|jsx' | return 0 | endif
    if !emmet#isExpandable() | return 0 | endif
    if &filetype =~ 'css' | return 1 | endif
    let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
    return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
  catch /E363/
    return 0
  endtry
endfunction

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
  \ 'tt', 'u', 'ul', 'var', 'video', 'wbr', 'template',
  \ 'h1', 'h2', 'h3', 'h4', 'h6',
  \
  \ 'emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd',
  \ 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap',
  \ 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out',
  \ 'det', 'acr', 'opt'
  \ ]

function! Jumpable(command)
  return (v:count > 5 ? "m'" . v:count : '') . a:command
endfunction

function! ClearEverything()
  call clearmatches()
  ccl
  lcl
  silent! call CloseTests()
  silent! NERDTreeClose
  silent! GundoHide
  normal cxc
  call ClearMessages()
endfunction

function! ClearMessages(...)
  let hard_clear = a:0
  if hard_clear
    call feedkeys(":\<bs>")
  else
    normal :
  endif
endfunction

function! ShowHighlightsUnderCursor()
  if exists('g:loaded_nvim_treesitter')
    Inspect
  elseif exists("*synstack")
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endif
endfunction

function! ShowAllHighlights()
  redir @z
  silent hi
  redir END
  tabnew
  setlocal buftype=nofile
  normal "zpdd
endfunction

function! TabMove(direction)
  try
    exe a:direction . 'tabmove'
  catch /E16/
    0tabmove
  catch /E474/
    $tabmove
  endtry
endfunction

function! Autowrite()
  for tabnum in range(tabpagenr('$'))
    for bufnum in tabpagebuflist(tabnum + 1)
      if bufname(bufnum) =~ '^quickfix-' | return | endif
    endfor
  endfor
  silent! wa
  if has('nvim')
    " silent! FormatWrite
    " Format
  endif
  if &modified
    silent! GutentagsUpdate
  endif
endfunction

function! OnNERDTreeInit()
  let t:nerdtree_winnr = bufwinnr('%')
  let t:refresh_nerdtree_next_time = 0
  call ResetNERDTreePreview()
  normal! j
endfunction

function! ResetNERDTreePreview()
  let t:original_bufnum = 0
  if exists('t:last_bufnum') | let t:original_bufnum = t:last_bufnum | endif
  let t:escaped_nerdtree = 0
  let b:previous_preview_bufnum = 0
  let b:previous_preview_bufnum_to_close = 0
endfunction

function! OnNERDTreeEnter()
  call ResetNERDTreePreview()

  if t:refresh_nerdtree_next_time
    call b:NERDTree.root.refresh()
    call b:NERDTree.render()
    let t:refresh_nerdtree_next_time = 0
  endif
endfunction

function! NERDTreePreviewOrOpen()
  let current_path = g:NERDTreeFileNode.GetSelected().path
  if current_path.isDirectory
    call nerdtree#ui_glue#invokeKeyMap('o') | return
  endif
  let filename = current_path.str({ 'format': 'Edit' })
  let bfilename = '^' . filename . '$'
  let should_close_buffer_next_time = bufnr(bfilename) <= 0
  if bufnr(bfilename) == b:previous_preview_bufnum && bufnr(bfilename) > 0
    wincmd w
    " exe "normal \<cr>"
    return
  endif
  normal go
  if b:previous_preview_bufnum_to_close > 0
    if b:previous_preview_bufnum_to_close != t:original_bufnum
      exe 'bwipeout ' . b:previous_preview_bufnum_to_close
    endif
    let b:previous_preview_bufnum_to_close = 0
  endif
  if should_close_buffer_next_time
    let b:previous_preview_bufnum_to_close = bufnr(bfilename)
  endif
  let b:previous_preview_bufnum = bufnr(bfilename)
endfunction

function! LeaveNERDTreePreview()
  if !exists('t:original_bufnum') | return | endif
  if bufexists(t:original_bufnum) && t:original_bufnum > 0 && t:original_bufnum != bufnr('%')
    if t:escaped_nerdtree
      exe 'b ' . t:original_bufnum
    elseif @# == ''
      silent! let @# = t:original_bufnum
    endif
  endif
  let t:escaped_nerdtree = 0
endfunction

function! EscapeNERDTree()
  let t:escaped_nerdtree = 1
  call CloseNERDTree()
endfunction

function! CloseNERDTree()
  let first_buf = tabpagebuflist()[0]
  if bufname(first_buf) !~ 'NERD_tree' | return | endif
  if bufnr('%') == first_buf
    wincmd p
  endif
  1close
endfunction

function! QuitNERDTree()
  q
  if len(tabpagebuflist()) == 1 && exists('b:startup_buffer')
    \ && IsCurrentBufferNew() && !&modified
    q
  endif
endfunction

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    silent! close
    exe 'b ' . bufnum
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

function! RefreshNERDTree()
  if !exists('t:nerdtree_winnr') | return 0 | endif
  let first_buf = tabpagebuflist()[0]
  if bufname(first_buf) =~ 'NERD_tree'
    1wincmd w
    silent call b:NERDTree.root.refresh()
    silent call b:NERDTree.render()
    wincmd p
    return 1
  else
    let t:refresh_nerdtree_next_time = 1
    return 0
  endif
endfunction

function! NERDTreeCD()
  exe 'cd ' . g:NERDTreeFileNode.GetSelected().path.str()
  call g:NERDTreeFileNode.GetSelected().path.changeToDir()
  call nerdtree#ui_glue#chRootCwd()
endfunction

function! DeleteCurrentFile()
  let answer = input('Delete current file? ', 'y')
  call ClearMessages()
  if answer != 'y' | return | endif
  call system('rm ' . shellescape(expand('%')))
  silent! checktime
  call RefreshNERDTree()
  if v:shell_error == 0 | echo 'File deleted.'
  else | call EchoErr("\nCould not delete file.")
  endif
endfunction

function! EchoErr(msg)
  echohl ErrorMsg | echo a:msg | echohl None
endfunction

function! MoveCurrentFile()
  let old_file = expand('%')
  let new_file = input('New location: ', old_file, 'file')
  call ClearMessages()
  if (new_file == '' || new_file == old_file) | return | endif
  let alternate_buffer = @#
  if buflisted(new_file) | exec 'bd! ' . new_file | endif
  call system('mkdir -p $(dirname ' . shellescape(new_file) . ')')
  call system('mv ' . shellescape(old_file) . ' ' . shellescape(new_file))
  exec ':edit! ' . new_file
  exec 'bd! ' . old_file
  if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
  call RefreshNERDTree()
endfunction

function! RenameCurrentFile()
  let old_name = expand('%:t')
  let new_name = input('New name: ', old_name, 'file')
  call ClearMessages()
  if (new_name == '' || new_name == old_name) | return | endif
  let dir = expand('%:h')
  let old_file = expand('%')
  let new_file = (dir == '.') ? (new_name) : (dir . '/' . new_name)
  if new_file == old_file | return | endif
  let alternate_buffer = @#
  if buflisted(new_file) | exec 'bd! ' . new_file | endif
  call system('mv ' . shellescape(old_file) . ' ' . shellescape(new_file))
  exec ':edit! ' . new_file
  exec 'bd! ' . old_file
  if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
  call RefreshNERDTree()
endfunction

function! DuplicateCurrentFile()
  let old_file = expand('%')
  let new_file = input('Duplicate as: ', old_file, 'file')
  call ClearMessages()
  if (new_file == '' || new_file == old_file) | return | endif
  if buflisted(new_file) | exec 'bd! ' . new_file | endif
  exec ':saveas! ' . new_file
  call RefreshNERDTree()
endfunction

function! CopyCurrentFilePath(...)
  let linenr = ''
  if a:0 | let linenr = ':' . line('.') | endif
  let @+ = expand('%') . linenr
endfunction

function! CopyCurrentFileAbsolutePath(...)
  let linenr = ''
  if a:0 | let linenr = ':' . line('.') | endif
  let @+ = expand('%:p') . linenr
endfunction

function! CopyCurrentFileName()
  let @+ = expand('%:t')
endfunction

function! CopyCurrentRubyClassName()
  let v = winsaveview()
  normal! gg^
  silent exe "/^\\(module\\|class\\) "
  let module = getline('.') =~ '^module '
  if module | exe "normal gJ" | endif
  normal! WyiW
  if module | undo | endif
  call winrestview(v)
endfunction

function! CopyCurrentRubyMethodName()
  let v = winsaveview()
  normal [mw
  let method_name = substitute(expand('<cWORD>'), '(.*', '', '')
  call winrestview(v)
  call CopyCurrentRubyClassName()
  let @" .= '#' . method_name
  echo method_name
endfunction

function! CreateRubyPrivate()
  exe "normal ^?^\\s\\+def \<cr>%o\<cr>private\<esc>2o\<esc>"
  call feedkeys('cc')
endfunction

function! CreateRubyMethod(create_at_end, use_current_line_as_name)
  if a:use_current_line_as_name | exe 'normal yil' | endif
  if a:create_at_end | exe 'normal G' | endif
  exe "normal ^?^\\s\\+def \<cr>%o\<cr>def "
  if a:use_current_line_as_name | exe "normal p" | endif
  call feedkeys('a')
  if a:use_current_line_as_name | call feedkeys("\<cr>") | endif
endfunction

function! CreateNewFile()
  let new_file = input('New file: ', '', 'file')
  if new_file != ''
    exec ':e ' . new_file
    w
    if RefreshNERDTree() | call feedkeys(":file\<cr>") | end
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
    if RefreshNERDTree() | call feedkeys(":file\<cr>") | end
  endif
endfunction

function! FormatRubyHashToJson()
  norm gg0
  let current_char = getline('.')[col('.')-1]
  if current_char != '{'
    norm ^dt{
  endif
  silent! %s/nil/null
  silent! %s/=> :\(.*\),/=> "\1",
  silent! %s/\(^\s*\)\[\d\+\]/\1
  silent! %s/=>/:
  silent! %s/#<ActionController::Parameters /
  silent! %s/ permitted: false>/
  set filetype=json
  %!jq '.'
endfunction

function! EditAlternateFile(split)
  call LazyLoadProjectionist()
  call ProjectionistDetect(expand('%:p'))
  let alternates = projectionist#query_file('alternate')
  if empty(alternates) | return EchoErr('No alternate file found') | endif
  call sort(alternates, {a1, a2 -> len(a1) - len(a2)})
  let file = fnamemodify(alternates[0], ':.')
  if a:split | vnew | endif
  exe 'e ' . file
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

function! OpenErrorFile(preview_mode)
  let file_and_line = GetFileAndLineUnderCursor()
  if empty(file_and_line) | return | endif
  let winnr = winnr()
  wincmd p
  exe 'drop ' . file_and_line[0]
  exe file_and_line[1]
  normal zz
  if a:preview_mode
    exe 'match Search /\%' . file_and_line[1] . 'l/'
    silent! exe winnr . 'wincmd w'
  endif
endfunction

function! GetFileAndLineUnderCursor()
  let matches = matchlist(getline('.'), '\(\S\+\):\(\d\+\)')
  if len(matches) && filereadable(matches[1])
    return matches[1:2]
  endif
endfunction

function! OpenFileSearchResult(new_tab)
  let line = getline('.')
  if line == '' || line =~ '^[' | return | endif
  if line == '--' | let line = getline(line('.') - 1) | endif
  let line = matchstr(line, '^\d\+')
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

function! FileSearch(search_options)
  if IsCurrentBufferNew() || bufname('%') =~ 'ag -C \|NERD_tree'
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
  call termopen(query, opts)
endfunction

function! ResetProject()
  %bdelete!
  enew
  let b:startup_buffer = 1
  call ClearMessages(1)
  NERDTree
endfunction

function! ClearUndos()
  let v = winsaveview()
  set undoreload=0
  silent edit!
  call winrestview(v)
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

let s:custom_backup_dir='~/.vim_custom_backups'
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

function! OpenCurrentFileBackupHistory()
  let backup_dir = expand(s:custom_backup_dir . expand('%:p:h'))
  let cmd = 'tmux split-window -h -c "' . backup_dir . '"\; '
  let cmd .= 'send-keys "glop --since=\"1 month ago\" ' . expand('%:t') . '" C-m'
  call system(cmd)
endfunction

function! OpenCurrentFileInGithub(...)
  let local_branch = a:0
  let file_dir = expand('%:h')
  let git_root = system('cd ' . file_dir . '; git rev-parse --show-toplevel | tr -d "\n"')
  let file_path = substitute(expand('%:p'), git_root . '/', '', '')
  let branch = 'master'
  if local_branch
    let branch = system('git symbolic-ref --short -q HEAD | tr -d "\n"')
    if branch == '' | let branch = system('git rev-parse --short HEAD | tr -d "\n"') | endif
  endif
  let repo_path = GetGithubRepoPath(expand('%:h'))
  let url = 'https://github.com/' . repo_path . '/blob/' . branch . '/' . file_path
  let first_line = getpos("'<")[1]
  let url .= '#L' . first_line
  let last_line = getpos("'>")[1]
  if last_line != first_line | let url .= '-L' . last_line | endif
  call system('open ' . url)
endfunction

function! OpenCommitInGithub(dir_path)
  let commit = expand('<cword>')
  let repo_path = GetGithubRepoPath(a:dir_path)
  let url = 'https://github.com/' . repo_path . '/commit/' . commit
  call system('open ' . url)
endfunction

function! OpenPrInGithub()
  let pr_number = expand('<cword>')
  let current_char = getline('.')[col('.')-1]
  if current_char =~ '(\|#'
    normal! mC
    call search('\d')
    let pr_number = expand('<cword>')
    normal! `C
  endif
  let repo_path = GetGithubRepoPath(expand('%:h'))
  let url = 'https://github.com/' . repo_path . '/pull/' . pr_number
  call system('open ' . url)
endfunction

function! GetGithubRepoPath(dir_path)
  let dir_path = a:dir_path
  let dir_path = substitute(dir_path, '^fugitive://', '', '')
  let dir_path = substitute(dir_path, '/.git$', '', '')
  let git_remote = system('cd ' . dir_path . '; git remote get-url origin | tr -d "\n"')
  return matchlist(git_remote, ':\([^.]*\)')[1]
endfunction

function! CloseTests()
  if exists('t:term_test_bufnum') && bufexists(t:term_test_bufnum)
    exe 'bd! ' . t:term_test_bufnum
    silent! unlet t:term_test_bufnum
  endif
endfunction

function! IsCurrentBufferNew()
  return bufname('%') == '' && IsCurrentBufferEmpty()
endfunction

function! OpenOutputInArgslist(cmd)
  silent only
  let filenames = split(system(a:cmd), "\n")
  if empty(filenames) | echo 'No modified files!' | return | endif
  exe 'args ' . join(filenames, ' ')
endfunction

function! GitAdd()
  silent w
  silent !git add %
endfunction

function! ShowLatestRailsMigration()
  call LazyLoadRails()
  let alternate_buffer = bufnr('%')
  enew
  set ft=ruby
  exec ':Emigration'
  if bufexists(alternate_buffer) | let @# = alternate_buffer | endif
endfunction

function! ExtractRailsPartial()
  call LazyLoadRails()
  let name = input('Partial name: ', '')
  if name != ''
    exec "'<,'>Rextract " . name
  endif
endfunction

function! EvalRubyBuffer()
  set filetype=ruby
  let v = winsaveview()
  if match(getline('$'), '# \?=>') == -1
    normal GA # =>
  endif
  %!xmpfilter
  call winrestview(v)
endfunction

function! EvalRailsBuffer()
  setl synmaxcol=3000
  setl wrap
  set filetype=ruby
  let v = winsaveview()
  silent! $s/ # =>.*/
  silent g/^# \~>/normal dG
  let tempfile = tempname()
  call writefile(getbufline('%', 1, '$'), tempfile)
  let cmd = 'sed -i '
  let cmd .= '-e "$ s/^/puts (/" -e "$ s/$/).inspect/" '
  let cmd .= '-e "1s/^/ActiveRecord::Base.logger = nil\n/" '
  let cmd .= tempfile
  call system(cmd)
  let output = system('rails runner ' . shellescape(tempfile))
  call delete(tempfile)
  let output = substitute(output, '\n$', '', 'g')
  let output = substitute(output, '\n', '\n# ', 'g')
  if v:shell_error == 0
    let output = '# => ' . output
  else
    let output = "\n# ~> " . output
  endif
  normal G
  put =output
  normal! `[kJ
  call winrestview(v)
endfunction

function! AddDebugBreakpoint()
  if !exists('g:gemfile') | let g:gemfile = system('cat Gemfile') | endif
  let debug_line = 'binding.irb'
  if g:gemfile =~ 'pry'
    let debug_line = 'binding.pry'
  endif
  if &filetype =~ 'eruby'
    let debug_line = '<% ' . debug_line . ' %>'
  endif
  exe 'normal! o' . debug_line
endfunction

function! OpenMarkdownPreview() abort
  if exists('s:markdown_job_id')
    silent! call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  let s:markdown_job_id = jobstart(
    \ 'grip ' . shellescape(expand('%:p')) . " 0 2>&1 | awk '/Running/ { printf $4 }'",
    \ { 'pty': 1, 'on_stdout': {_, output -> system('open ' . output[0])} }
    \ )
endfunction

function! MakeSession(session_name)
  let session_name = a:session_name
  if session_name == '' | let session_name = GetProjectName() | endif
  exe ':silent SaveSession! ' . session_name
  echo 'Session "' . session_name . '" saved.'
endfunction

function! LoadSession(session_name)
  silent! NERDTreeClose
  let session_name = a:session_name
  if session_name == '' | let session_name = GetProjectName() | endif
  exe ':silent OpenSession ' . session_name
  echo 'Session "' . session_name . '" loaded.'
endfunction

function! HighlightOccurencesVerb(type)
  exe 'normal! `[v`]"hy'
  let @/ = EscapeStringForSearches(@h)
  exe 'match Search /' . @/ . '/'
endfunction

function! HighlightWholeOccurencesVerb(type)
  exe 'normal! `[v`]"hy'
  let @/ = '\<' . EscapeStringForSearches(@h) . '\>'
  exe 'match Search /' . @/ . '/'
endfunction

function! ChangeOccurenceVerb(type)
  exe 'normal! `[v`]"hy'
  let @/ = EscapeStringForSearches(@h)
  exe 'match Search /' . @/ . '/'
  call feedkeys('cgn', 'n')
endfunction

function! ChangeWholeOccurenceVerb(type)
  exe 'normal! `[v`]"hy'
  let @/ = '\<' . EscapeStringForSearches(@h) . '\>'
  exe 'match Search /' . @/ . '/'
  call feedkeys('cgn', 'n')
endfunction

function! FileSearchVerb(type, ...)
  exe 'normal! `[v`]"hy'
  let @/ = @h
  let cmd = ":FileSearch -Q -i '" . @/ . "' \<left>\<left>"
  call feedkeys(cmd, 'n')
endfunction

function! GlobalSubstituteVerb(type, ...)
  exe 'normal! `[v`]"hy'
  let @/ = @h
  call feedkeys(':%s/' . @/ . '/', 'n')
endfunction

function! SubstituteVerb(type, ...)
  exe 'normal! `[v`]"hy'
  let @/ = @h
  call feedkeys(':s/' . @/ . '/', 'n')
endfunction

function! SearchNextOccurenceVerb(type, ...)
  exe 'normal! `[v`]"hy'
  let @/ = EscapeStringForSearches(@h)
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

function! ExecuteMacroOnSelection()
  exe ":'<,'>normal @" . nr2char(getchar())
endfunction

function! OnGoyoEnter()
  silent !tmux set status off
endfunction

function! OnGoyoLeave()
  silent !tmux set status on
endfunction

function! SetVirtualEdit()
  let saved_view = winsaveview()
  keepjumps normal! g0
  let is_on_leftmost_screen = col('.') == 1
  call winrestview(saved_view)

  if is_on_leftmost_screen
    set virtualedit=
  endif
endfunction

function! MergeToPrevTab()
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  let tab_nr = tabpagenr('$')
  let cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if tab_nr == tabpagenr('$')
      tabprev
    endif
    vnew
  else
    close!
    0tabnew
  endif
  exe "b".cur_buf
endfunction

function! MergeToNextTab()
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  let tab_nr = tabpagenr('$')
  let cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if tab_nr == tabpagenr('$')
      tabnext
    endif
    vnew
  else
    close!
    tabnew
  endif
  exe 'b' . cur_buf
endfunc

function! MovePreviousWord(cmd)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let nextnext = 1
  let i = 2
  while nextnext < pos
    let next = nextnext
    let nextnext = match(line, '\<\S\|\>\S\|\W\zs\w\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:cmd, pos - next)
endfunction

function! MoveNextWord(cmd)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let i = 2
  while next <= pos && next > 0
    let next = match(line, '\<\S\|\>\S\|\W\zs\w\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:cmd, next - pos)
endfunction

function! MovePreviousCase(cmd)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let nextnext = 1
  let i = 2
  while nextnext < pos
    let next = nextnext
    let nextnext = match(line, '\<\S\|\>\S\|\U\zs\u\|\u\U\|\(\W\|_\)\zs\w\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:cmd, pos - next)
endfunction

function! MoveNextCase(cmd)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let i = 2
  while next <= pos && next > 0
    let next = match(line, '\<\S\|\>\S\|\U\zs\u\|\u\U\|_\|\W\zs\w\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:cmd, next - pos)
endfunction

function! RenameTab()
  let tab_name = input('Tab name: ', '')
  let t:tab_name = tab_name
  set showtabline=2
endfunction

function! Join(count) abort
  let previous_last_char = getline('.')[col('$')-2]
  normal! J
  let current_char = getline('.')[col('.')-1]
  if previous_last_char =~ '(\|[\' && current_char == ' '
    normal x
  endif
  silent! call repeat#set("\<Plug>Join", a:count)
endfunction
nnoremap <silent> <Plug>Join :<c-u>call Join(v:count1)<cr>

function! BreakCharacter(count, ...) abort
  if a:count == 0
    let char = nr2char(getchar())
    if char == "\<Esc>" | return | endif
  else
    let char = get(b:, 'last_break_char')
  endif
  if char == '7' | let char = '&' | endif
  if char == '\' | let char = '|' | endif
  let b:last_break_char = char

  if char == '"' || char == "'"
    exe "normal! mCa" . char . " \\\<cr>" . char . "\<esc>`Cj"
    silent! call repeat#set("\<Plug>BreakCharacter", 1)
    return
  endif
  let old_pos = getpos('.')
  exe 'normal! f' . char
  if getpos('.') == old_pos | return | endif
  if char =~ ',\|+\|-\|*\|/\|=\|{\|('
    exe 'normal! l'
  elseif char =~ '&\||'
    exe 'normal! ll'
  endif
  exe "normal! i\<cr>\<esc>l"

  silent! call repeat#set("\<Plug>BreakCharacter", 1)
endfunction
nnoremap <silent> <Plug>BreakCharacter :<c-u>call BreakCharacter(v:count)<cr>

function! MoveToQuarterScreen()
  normal zs
  exe 'normal! ' . (winheight(0)/4) . "\<C-Y>"
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

function! ToggleZoom()
  if exists('t:zoomed') && t:zoomed
    wincmd =
    let t:zoomed = 0
  else
    wincmd |
    wincmd _
    let t:zoomed = 1
  endif
endfunction

function! ToggleDiff()
  if &diff
    windo diffoff
  else
    windo diffthis
  endif
endfunction

function! TrimTrailingWhitespace()
  if &filetype =~ 'markdown\|snippet' | return | endif
  let pos = [line('.'), col('.')]
  %s/\s\+$//e
  call cursor(pos)
endfunction

function! GetLintMsg()
  if !exists('g:loaded_neomake') | return '' | endif
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
  call CloseTests()
  botright new
  let t:term_test_bufnum = bufnr('%')
  resize 11
  call termopen(a:cmd . ' #test', opts)
  wincmd p
endfunction
let g:test#custom_strategies = { 'custom': function('CustomTestStrategy') }

function! GetTabLine()
  let tabs = BuildTabs()
  let line = ''
  for i in range(len(tabs))
    let line .= (i+1 == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#'
    let line .= '%' . (i + 1) . 'T'
    let line .= ' ' . tabs[i].uniq_name . ' '
  endfor
  let line .= '%#TabLineFill#%T'
  return line
endfunction

function! BuildTabs()
  let tabs = []
  for i in range(tabpagenr('$'))
    let tabnum = i + 1
    let buflist = tabpagebuflist(tabnum)
    let file_path = ''
    let tab_name = bufname(buflist[0])
    if tab_name =~ 'NERD_tree' && len(buflist) > 1
      let tab_name = bufname(buflist[1])
    end
    let custom_tab_name = gettabvar(tabnum, 'tab_name')
    let is_custom_name = 0
    if custom_tab_name != ''
      let tab_name = custom_tab_name
      let is_custom_name = 1
    elseif tab_name == ''
      let tab_name = '[No Name]'
      let is_custom_name = 1
    elseif tab_name =~ 'fzf'
      let tab_name = 'FZF'
      let is_custom_name = 1
    elseif tab_name =~ '^term://'
      let tab_name = trim(substitute(tab_name, '^term:[^:]*:', '', ''))
      if len(tab_name > 40)
        let tab_name = tab_name[0:39]
      endif
      let is_custom_name = 1
    else
      let file_path = fnamemodify(tab_name, ':p')
      let tab_name = fnamemodify(tab_name, ':p:t')
    end
    let tab = {
      \ 'name': tab_name,
      \ 'uniq_name': tab_name,
      \ 'file_path': file_path,
      \ 'is_custom_name': is_custom_name
      \ }
    call add(tabs, tab)
  endfor
  call CalculateTabUniqueNames(tabs)
  return tabs
endfunction

function! CalculateTabUniqueNames(tabs)
  for tab in a:tabs
    if tab.is_custom_name | continue | endif
    let tab_common_path = ''
    for other_tab in a:tabs
      if tab.name != other_tab.name || tab.file_path == other_tab.file_path
        \ || other_tab.is_custom_name
        continue
      endif
      let common_path = GetCommonPath(tab.file_path, other_tab.file_path)
      if tab_common_path == '' || len(common_path) < len(tab_common_path)
        let tab_common_path = common_path
      endif
    endfor
    if tab_common_path == '' | continue | endif
    let common_path_has_immediate_child = 0
    for other_tab in a:tabs
      if tab.name == other_tab.name && !other_tab.is_custom_name
        \ && tab_common_path == fnamemodify(other_tab.file_path, ':h')
        let common_path_has_immediate_child = 1
        break
      endif
    endfor
    if common_path_has_immediate_child
      let tab_common_path = fnamemodify(common_path, ':h')
    endif
    let path = tab.file_path[len(tab_common_path)+1:-1]
    let path = fnamemodify(path, ':~:.:h')
    let dirs = split(path, '/', 1)
    if len(dirs) >= 5
      let path = dirs[0] . '/.../' . dirs[-1]
    endif
    let tab.uniq_name = tab.name . ' - ' . path
  endfor
endfunction

function! GetCommonPath(path1, path2)
  let dirs1 = split(a:path1, '/', 1)
  let dirs2 = split(a:path2, '/', 1)
  let i_different = 0
  for i in range(len(dirs1))
    if get(dirs1, i) != get(dirs2, i)
      let i_different = i
      break
    endif
  endfor
  return join(dirs1[0:i_different-1], '/')
endfunction

function! GetProjectName()
  return fnamemodify(getcwd(), ':t')
endfunction

function! OnBufEnter()
  exe ':match'
  if !exists('b:buffer_mappings_created')
    call CreateBufferMappings()
  endif
  call ConfigureLargeBuffers()
  if !exists('b:previous_first_visible_linenum')
    let b:previous_first_visible_linenum = line('w0')
  endif
endfunction

function! CreateBufferMappings()
  let bufname = bufname('%')
  if bufname !~ 'NERD_tree'
    nnoremap <buffer> d0 d^
    nmap <buffer> ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
    nmap <buffer> dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
  endif
  if bufname =~ '^copilot:'
    nnoremap <silent><buffer> <esc> :q<cr>
  endif
  let b:buffer_mappings_created = 1
endfunction

function! ConfigureLargeBuffers()
  if (&buftype != '' || IsCurrentBufferEmpty()) | return | endif
  let nb_lines = line('$')
  if !exists('b:previous_nb_lines') | let b:previous_nb_lines = '' | endif
  if nb_lines == b:previous_nb_lines | return | endif
  let b:previous_nb_lines = nb_lines
  if nb_lines < 500
    set nolazyredraw
  else
    set lazyredraw
  endif
  let file = expand('%')

  let large_file_in_bytes = 100 * 1024 * 1024 " 100 MB
  if getfsize(file) > large_file_in_bytes
    setl eventignore=all
    setl undolevels=-1
    setl syntax=off
  endif

  if (!has('nvim') || &syntax == '') | return | endif
  let b:tempfile = ''
  if file == ''
    let b:tempfile = tempname()
    call writefile(getbufline('%', 1, '$'), b:tempfile)
    let file = b:tempfile
  endif
  let cmd = "awk 'length > max { max=length } END { print max }' " . file
  call jobstart(cmd, { 'on_stdout': function('OnMaxLinesCounted') })
endfunction

function! IsCurrentBufferEmpty()
  return line('$') == 1 && getline(1) == ''
endfunction

function! OnMaxLinesCounted(job_id, data, event)
  let max_line_length = a:data[0]
  if max_line_length > 1000
    setlocal synmaxcol=153
  endif
  if exists('b:tempfile') && b:tempfile != ''
    call delete(b:tempfile)
    unlet b:tempfile
  endif
endfunction

function! CustomCloseTab()
  if s:current_tab_number == 1 | return | endif
  exe 'tabnext' . (s:current_tab_number - 1)
endfunction

let s:last_active_tab_number = 1
function! GoToLastActiveTab()
  exe 'silent! tabnext' . s:last_active_tab_number
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

function! SetTmuxWindowName()
  if $TMUX_AUTOMATIC_RENAME != 'off'
    call jobstart("tmux rename-window -t $TMUX_PANE '" . GetProjectName() . "'")
  endif
endfunction

function! RestoreTmuxWindowName()
  if $TMUX_AUTOMATIC_RENAME != 'off'
    let cmd = 'number_of_vims=$(tmux list-panes -F "#{pane_current_command}" | grep -c vim);'
    let cmd .= 'if [[ $number_of_vims -eq 1 ]]; then;'
    let cmd .= 'tmux setw automatic-rename;'
    let cmd .= 'fi'
    call system(cmd)
  endif
endfunction

function! Profile()
  profile start profile.log
  profile func *
  profile file *
endfunction

function! ImprovedGoToFile()
  if &filetype =~ 'ruby' | call LazyLoadRails() | endif
  try
    normal! gf
  catch /\(E447\|E345\)/
    try
      silent exe "normal \<c-]>"
    catch /E426/
      call ClearMessages()
      echo 'No file found'
    catch /E434/
    endtry
  endtry
endfunction

function! CycleToNextFile(count, ...)
  let dir = expand('%:p:h')
  let files = globpath(dir, '*', 0, 1) + globpath(dir, '.[^.]*', 0, 1)
  let files = sort(filter(files, 'filereadable(v:val)'), 'i')
  let idx = index(files, expand('%:p'))
  if idx == -1 | return 'echoerr "Unable to move to next file"' | endif
  let file = get(files, a:0 && a:1 ? a:count : ((idx + a:count) % len(files)), -1)
  if file == -1 | return 'echoerr "Unable to move to next file"' | endif
  exe 'edit ' . fnameescape(fnamemodify(file, ':.'))
endfunction

function! GetNextFile(direction)
  let file = expand('%:p')
  if file == ''
    let file = getcwd() . '/'
  endif
  let offset = v:count1 * a:direction
  while offset
    let files = GetFileEntries(fnamemodify(file,':h'))
    if a:direction < 0
      call reverse(sort(filter(files,'v:val <# file')))
    else
      call sort(filter(files,'v:val ># file'))
    endif
    let temp = get(files,0,'')
    if temp == ''
      let file = fnamemodify(file,':h')
    else
      let file = temp
      let found = 1
      while isdirectory(file)
        let files = GetFileEntries(file)
        if empty(files)
          let found = 0
          break
        endif
        let file = files[offset > 0 ? 0 : -1]
      endwhile
      let offset += (offset > 0 ? -1 : 1) * found
    endif
  endwhile
  return fnameescape(fnamemodify(file, ':.'))
endfunction

function! GetFileEntries(path)
  let path = substitute(a:path,'[\\/]$','','')
  let files = split(glob(path."/.*"),"\n")
  let files += split(glob(path."/*"),"\n")
  call map(files,'substitute(v:val,"[\\/]$","","")')
  call filter(files,'v:val !~# "[\\\\/]\\.\\.\\=$"')
  let filter_suffixes = substitute(escape(&suffixes, '~.*$^'), ',', '$\\|', 'g') .'$'
  call filter(files, 'v:val !~# filter_suffixes')
  return files
endfunction

function! InsertLineBefore(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>InsertLineBefore", a:count)
endfunction
nnoremap <silent> <Plug>InsertLineBefore :<c-u>call InsertLineBefore(v:count1)<cr>

function! InsertLineAfter(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>InsertLineAfter", a:count)
endfunction
nnoremap <silent> <Plug>InsertLineAfter :<c-u>call InsertLineAfter(v:count1)<cr>

function! ArgListNext(cmd_next)
  try
    exe a:cmd_next
    redir => output
    silent exe "normal \<c-g>"
    redir END
    let position = matchstr(output, '(.*)$')
    echo position
  catch /\(E163\|E164\|E165\)/ | echo 'No more files'
  endtry
endfunction

function! QfListNext(cmd_next)
  try
    if !exists('g:saved_qflist') | let g:saved_qflist = [] | endif
    let current_list = getqflist()
    if current_list == g:saved_qflist
      exe 'c' . a:cmd_next
    else
      let g:saved_qflist = current_list
      cc
    endif
  catch /E553/ | echo 'No more items'
  catch /E42/ | echo 'Empty quickfix list'
  endtry
endfunction

function! LocListNext(cmd_next)
  try
    if !exists('g:saved_loclist') | let g:saved_loclist = [] | endif
    let current_list = getloclist(0)
    if current_list == g:saved_loclist
      exe 'l' . a:cmd_next
    else
      let g:saved_loclist = current_list
      ll
    endif
  catch /E553/ | echo 'No more items'
  catch /\(E42\|E776\)/ | echo 'Empty location list'
  endtry
endfunction

function! ConflictMarkerNext(search_forward)
  try
    let old_search = @/
    let @/ = '^\(<<<<<<<\|=======\|>>>>>>>\)'
    exe 'normal ' . (a:search_forward ? 'n' :'N')
    let counts = CountSearchMatches()
    let current_pos = (counts[0] - 1) / 3 + 1
    let total = counts[1] / 3
    echo '(' . current_pos . ' of ' . total . ')'
    if a:search_forward && getline('.') =~ '^<' | normal ze
    endif
  catch /E486/ | echo 'No conflicts'
  finally
    let @/ = old_search
  endtry
endfunction

function! CountSearchMatches()
  let [pos, rpos] = [winsaveview(), getpos('.')]
  let [f, ws, now, matches] = [0, &wrapscan, reltime(), [0,0]]
  set nowrapscan
  try
    while f < 2
      if reltimestr(reltime(now))[:-6] =~ '[1-9]'
        " time >= 100ms
        return
      endif
      let matches[v:searchforward ? f : !f] += 1
      try
        silent exe "keepjumps norm! ".(f ? 'n' : 'N')
      catch /^Vim[^)]\+):E38[45]\D/
        call setpos('.',rpos)
        let f += 1
      endtry
    endwhile
  finally
    call winrestview(pos)
    let &wrapscan = ws
  endtry
  return [matches[0], matches[0] + matches[1] - 1]
endfunction

function! BufferHistoryLast()
  exe 'normal ' . (len(w:buffer_history) - w:buffer_history_index - 1) . ']b'
endfunction

function! BufferHistoryFirst()
  exe 'normal ' . w:buffer_history_index . '[b'
endfunction

function! DisplayDirectory(dir)
  if !isdirectory(a:dir) | return | endif
  call ClearMessages(1)
  enew
  let b:startup_buffer = 1
  call buffer_history#add(winbufnr(0))
  exe 'NERDTree ' . a:dir
endfunction

function! BrowseFiles()
  Files
  call ScrollFzfLeft()
endfunction

function! BrowseDirectoryFiles()
  call fzf#run(fzf#wrap({
    \ 'source': $FZF_DEFAULT_COMMAND . ' --depth 0 --ignore ' . expand('%:t'),
    \ 'dir': expand('%:h')
    \ }))
  call ScrollFzfLeft()
endfunction

function! ScrollFzfLeft()
  exe "normal \<c-\>\<c-n>"
endfunction

function! GenerateTags()
  call system('ctags -R -f' . g:gutentags_ctags_tagfile)
endfunction

function! BrowseBufferTags()
  if empty(tagfiles()) | call GenerateTags() | endif
  call fzf#vim#buffer_tags('', { 'options': $FZF_DEFAULT_OPTS })
  call ScrollFzfLeft()
endfunction

function! BrowseAllTags()
  if empty(tagfiles()) | call GenerateTags() | endif
  call fzf#vim#tags('')
  call ScrollFzfLeft()
endfunction

function! BrowseOldFiles()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
  let buffers = sort(buffers, 'SortBuffers')
  let files = filter(map(buffers, 'bufname(v:val)'), 'len(v:val)')
    \ + filter(copy(v:oldfiles), 'filereadable(expand(v:val))')
  let files = filter(files, "(v:val !~ '^/' || v:val =~ '^" . getcwd() ."/') && v:val != '.' && v:val !~ 'term://'")
  let files = fzf#vim#_uniq(map(files, 'fnamemodify(v:val, ":.")'))
  call fzf#run(fzf#wrap({
    \ 'source': files,
    \ 'options': ['--prompt', 'OldFiles> ']
    \ }))
  call ScrollFzfLeft()
endfunction

function! SortBuffers(...)
  let [b1, b2] = map(copy(a:000), 'get(g:fzf#vim#buffers, v:val, v:val)')
  return b1 < b2 ? 1 : -1
endfunction

function! LazyLoadRails()
  if !exists('g:loaded_rails')
    call plug#load('vim-rails')
    call RailsDetect()
    call rails#buffer_setup()
  endif
endfunction

function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  exe a:cmd
endfunction

function! LazyLoadDeoplete()
  if exists('g:first_enter_done')
    call plug#load('deoplete.nvim')
    autocmd! lazy_load_deoplete
  endif
  let g:first_enter_done = 1
endfunction

function! LazyLint(...)
  if &buftype != '' | return | endif
  if !filereadable(expand('%:p')) | return | endif
  call LazyLoadNeomake()
  Neomake
endfunction

function! LazyLoadNeomake()
  if !exists('g:loaded_neomake')
    call plug#load('neomake')
    call neomake#configure#automake({
      \ 'BufWinEnter': {}, 'BufWritePost': {}, 'FocusLost': {},
      \ }, 1000)
  endif
  autocmd! lazy_lint
endfunction

function! OnLintJobInit()
  if !!search('^<<<<<<<', 'wn')
    let g:neomake_hook_context.jobinfo['argv'] = ''
  endif
endfunction

function! LazyLoadMTA(...)
  if !exists('g:loaded_matchtagalways')
    call plug#load('MatchTagAlways')
    call MatchTagAlways#Setup()
  endif
  autocmd! lazy_load_mta
endfunction

function! LazyLoadSlowCode()
  if has('nvim')
    call plug#load('deoplete.nvim')
    autocmd! lazy_load_deoplete
  endif
  call LazyLoadNeomake()
  autocmd! lazy_load_slow_code
endfunction

function! LazyLoadProjectionist()
  if !exists('g:loaded_projectionist')
    call plug#load('vim-projectionist')
  endif
  autocmd! projectionist
endfunction

function! LazyLoadAider()
  if !exists('g:loaded_aider')
    call plug#load('aider.nvim')
    lua require('aider').setup({ auto_manage_context = true, default_bindings = false })
    let g:loaded_aider = 1
  endif
endfunction

function! GemOpen(gem_name)
  let path = system('VISUAL=echo gem open ' . a:gem_name)
  exe 'e ' . path
endfunction

function! OnCmdwinEnter()
  setlocal nonumber norelativenumber colorcolumn=
  nnoremap <silent><buffer> <esc> :q<cr>
  nnoremap <buffer> <cr> <cr>
endfunction

function! OnTermOpen()
  if &buftype != 'terminal' | return | endif
  setlocal nonumber norelativenumber colorcolumn=
  nnoremap <silent><buffer> G G{}
  let bufname = bufname('%')
  if bufname =~ '#test$'
    call OnTestDisplayed()
  elseif bufname =~ ':ag '
    call OnFileSearchDisplayed()
	elseif bufname =~ ':aider '
		nnoremap <silent><buffer> <esc> :q<cr>
  endif
endfunction

function! OnTestDisplayed()
  noremap <silent><buffer> <leader>q <c-w>p:call CloseTests()<cr>
  map <silent><buffer> <esc> <leader>q
  noremap <silent><buffer> o :call OpenErrorFile(1)<cr>
  noremap <silent><buffer> <cr> :call OpenErrorFile(0)<cr>
  map <silent><buffer> i <cr>
endfunction

function! OnFileSearchDisplayed()
  noremap <silent><buffer> <cr> :call OpenFileSearchResult(0)<cr>
  nmap <buffer> o <cr>
  nmap <buffer> i <cr>
  nnoremap <silent><buffer> t :call OpenFileSearchResult(1)<cr>
endfunction

function! FocusSelection(visual)
  if !a:visual | return | endif
  let filetype = &filetype
  normal gv"zy
  enew
  exe 'set filetype=' . filetype
  normal "zpggdd
endfunction

function! DisplayEnclosingLine()
  if &filetype == 'yaml' | echo GetYamlPathUnderCursor() | return | endif
  let cmd = "ctags -f - --fields=n " . expand('%') . " | awk -F: '{ print $NF }'"
  let cmd .= " | sort -nr | awk '" . line('.') . " >= $1 { print $1; exit }' "
  let linenum = system(cmd)
  let line = substitute(getline(linenum), '^\s*', '', 'g')
  echo line
endfunction

function! ReplayLastMacro()
  try
    normal @@
  catch /E748/
    normal @q
  endtry
endfunction

function! OpenInBrowser()
  let file = expand('%')
  if file == ''
    let file = tempname()
    call writefile(getbufline('%', 1, '$'), file)
  endif
  call system('open -a "Google Chrome" ' . shellescape(file))
endfunction

function! MoveInsideIndent(forward, ...) abort
  let motion_offset = a:forward ? 1 : -1
  let visual_mode = get(a:000, 0)
  if visual_mode | let start_pos = getpos("'<") | endif
  let nextline_num = line('.') + motion_offset
  mark '
  if getline(nextline_num) =~ '^[ \t]*$'
    let motion_char = a:forward ? 'j' : 'k'
    exe "normal ^\<Plug>(edgemotion-" . motion_char . ")^"
  else
    let direction_char = a:forward ? '' : 'o'
    exe "normal Vii" . direction_char . "^\<esc>"
  endif
  if visual_mode
    call setpos("'<", start_pos)
    call setpos("'>", getpos('.'))
    normal! gv
  endif
endfunction
nnoremap <Plug>MoveNextInsideIndent :<c-u>call MoveInsideIndent(1)<cr>
vnoremap <Plug>MoveNextInsideIndent :call MoveInsideIndent(1, 1)<cr>
onoremap <Plug>MoveNextInsideIndent V:<c-u>call MoveInsideIndent(1)<cr>
nnoremap <Plug>MovePreviousInsideIndent :<c-u>call MoveInsideIndent(0)<cr>
vnoremap <Plug>MovePreviousInsideIndent :call MoveInsideIndent(0, 1)<cr>
onoremap <Plug>MovePreviousInsideIndent V:<c-u>call MoveInsideIndent(0)<cr>

function! MoveAroundIndent(forward, ...) abort
  let direction_char = a:forward ? '' : 'o'
  let visual_mode = get(a:000, 0)
  if visual_mode | let start_pos = getpos("'<") | endif
  mark '
  exe "normal Vai" . direction_char . "^\<esc>"
  if visual_mode
    call setpos("'<", start_pos)
    call setpos("'>", getpos('.'))
    normal! gv
  endif
endfunction
nnoremap <silent> <Plug>MoveNextAroundIndent :<c-u>call MoveAroundIndent(1)<cr>
vnoremap <silent> <Plug>MoveNextAroundIndent :call MoveAroundIndent(1, 1)<cr>
onoremap <silent> <Plug>MoveNextAroundIndent V:<c-u>call MoveAroundIndent(1)<cr>
nnoremap <silent> <Plug>MovePreviousAroundIndent :<c-u>call MoveAroundIndent(0)<cr>
vnoremap <silent> <Plug>MovePreviousAroundIndent :call MoveAroundIndent(0, 1)<cr>
onoremap <silent> <Plug>MovePreviousAroundIndent V:<c-u>call MoveAroundIndent(0)<cr>

function! WriteDesktop(filename)
  let filename = a:filename
  if filename == '' | let filename = 'tmp.txt' | endif
  exe 'w! ~/Desktop/' . filename
endfunction

function! ShowCopilotPanel()
  let current_syntax = get(synstack(line('.'), col('.')), 0)
  if current_syntax && synIDattr(current_syntax, 'name') =~ 'comment'
    let old_linenum = line('.')
    normal }
    if line('.') == old_linenum
      normal o
      normal cc
    endif
  endif
  Copilot panel
endfunction

function! OpenCursor()
  let cmd = 'cursor $(pwd)'
  if &modifiable
    let cmd .= ' -g ' . expand('%:p') . ':' . line('.')
  endif
  call system(cmd)
endfunction

function! OpenVisibleBuffersInCursor()
  let file_paths = []
  for tabnum in range(tabpagenr('$'))
    for bufnum in tabpagebuflist(tabnum + 1)
      let file_path = expand('#'.bufnum.':p')
      if filereadable(file_path)
        call add(file_paths, shellescape(file_path))
      endif
    endfor
  endfor
  call insert(file_paths, '-g ' . expand('%:p') . ':' . line('.'))
  call system('cursor $(pwd) ' . join(file_paths, ' '))
endfunction

function! GetYamlPathUnderCursor()
  let l:indent = indent('.')
  let l:path = []
  let l:lineno = line('.')
  let l:current_line = getline('.')
  let l:current_key = matchstr(l:current_line, '^\s*\zs\S\+\ze\s*:')
  call add(l:path, l:current_key)

  let l:lineno -= 1
  while l:lineno > 0
    let l:line = getline(l:lineno)
    let l:cur_indent = indent(l:lineno)
    if l:cur_indent < l:indent && l:line =~ '^\s*\S\+\s*:'
      let l:key = matchstr(l:line, '^\s*\zs\S\+\ze\s*:')
      call add(l:path, l:key)
      let l:indent = l:cur_indent
    endif
    let l:lineno -= 1
  endwhile
  return join(reverse(l:path), '.')
endfunction

"####################
"### Autocommands ###
"####################

augroup improved_autowrite
  autocmd!
  autocmd FocusLost,BufLeave * call Autowrite()
augroup end

augroup improved_autoread
  autocmd!
  autocmd FocusGained,BufEnter * silent! checktime
augroup end

augroup auto_mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand('<afile>:p:h')) |
    \   call mkdir(expand('<afile>:p:h'), 'p') |
    \ endif
augroup end

augroup detect_filetypes
  autocmd!
  autocmd BufRead,BufNewFile *spec.rb set ft=ruby.rspec
  autocmd BufRead,BufNewFile *test.rb set ft=ruby.minitest
  autocmd BufRead,BufNewFile *.html.erb set ft=eruby.html
  autocmd BufRead,BufNewFile *.js.erb set ft=eruby.javascript
  autocmd BufRead,BufNewFile *.nfo,*.NFO set ft=nfo
  autocmd BufRead,BufNewFile *.js.es6 set ft=javascript
  autocmd BufRead,BufNewFile *.js.es6.erb set ft=eruby.javascript
  autocmd BufRead,BufNewFile *.env*,Procfile*,*.config set ft=conf
  autocmd BufRead,BufNewFile Brewfile* set ft=ruby
  autocmd BufRead,BufNewFile *.apib set ft=markdown
  autocmd BufRead,BufNewFile Dockerfile* set ft=dockerfile
  autocmd BufRead,BufNewFile *.vue setfiletype html
  autocmd BufRead,BufNewFile *.rb.tt set ft=ruby
  autocmd BufRead,BufNewFile *.yml.tt set ft=yaml
  autocmd BufRead,BufNewFile *.html.erb.tt set ft=eruby.html
  autocmd BufRead,BufNewFile *.md.tt set ft=markdown
  autocmd BufRead ~/.vim/plugged/*/doc/*.txt set ft=help
augroup end

augroup detect_binary_files
  autocmd!
  autocmd BufRead * call DetectBinaryFile()
augroup end

augroup custom_undofile
  autocmd!
  autocmd BufWritePost * call WriteUndoFile()
augroup end

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

augroup configure_linter
  autocmd!
  autocmd User NeomakeJobInit nested call OnLintJobInit()
augroup end

augroup lazy_lint
  autocmd!
  autocmd BufWinEnter,BufWritePost,FocusLost * call timer_start('1000', 'LazyLint')
augroup end

augroup lazy_load_mta
  autocmd!
  autocmd Filetype *html,xml,*.jsx call timer_start('200', 'LazyLoadMTA')
augroup end

augroup lazy_load_slow_code
  autocmd!
  autocmd FocusLost * call LazyLoadSlowCode()
augroup end

augroup preserve_buffer_scroll
  autocmd!
  autocmd BufLeave * call SaveBufferScroll()
  autocmd BufEnter * call RestoreBufferScroll()
augroup end

augroup replace_netrw_with_nerdtree
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,VimEnter * call DisplayDirectory(expand('<amatch>'))
augroup end

augroup nerdtree_events
  autocmd!
  autocmd User NERDTreeInit call OnNERDTreeInit()
  autocmd BufEnter NERD_tree* call OnNERDTreeEnter()
  autocmd BufWinEnter * call PreventBuffersInNERDTree()
  autocmd BufLeave * silent let t:last_bufnum = bufnr('%')
  autocmd BufEnter * call LeaveNERDTreePreview()
augroup end

if has('nvim')
  augroup custom_backup
    autocmd!
    autocmd BufWritePost * call BackupCurrentFile()
  augroup end

  if exists('$TMUX')
    augroup tmux_window_name
      autocmd!
      autocmd VimEnter * call SetTmuxWindowName()
      autocmd VimLeave * call RestoreTmuxWindowName()
    augroup end
  endif

  augroup term_events
    autocmd!
    autocmd TermOpen * call OnTermOpen()
  augroup end

  augroup lazy_load_deoplete
    autocmd!
    autocmd InsertEnter * call LazyLoadDeoplete()
  augroup end

  " augroup autoformat
  "   autocmd!
    " autocmd BufWritePost * silent! FormatWrite
    " autocmd FocusLost * silent! Format
  " augroup end

  augroup general_neovim_autocommands
    autocmd!
    autocmd BufWritePost $MYVIMRC_LUA source $MYVIMRC_LUA
  augroup end
endif

augroup general_autocommands
  autocmd!
  autocmd BufWritePre * call TrimTrailingWhitespace()
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd InsertLeave * silent! set nopaste
  if !has('nvim')
    autocmd BufRead,BufNewFile *_spec.rb set syntax=rspec
  endif
  autocmd BufEnter * call OnBufEnter()
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
  autocmd BufRead,BufNewFile *.html* setlocal matchpairs="(:),[:],{:}"
  autocmd User FzfStatusLine setlocal statusline=\ "
  autocmd CmdwinEnter * call OnCmdwinEnter()
augroup end

"#############
"### Other ###
"#############

if !has('nvim') && !has('gui_running')
  runtime .enable_meta_mappings.vim
endif

if has('nvim')
  source $MYVIMRC_LUA
endif

if filereadable(expand('~/.local.vim'))
  source ~/.local.vim
endif

set exrc
set secure
