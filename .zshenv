if [[ -e ~/.secrets.zsh ]]; then; source ~/.secrets.zsh; fi

###########################
### Aliases / Functions ###
###########################
# Aliases are in this .zshenv file to make them work in VIM's non-interactive shell

VIM_EDITOR=nvim
MAIN_EDITOR=$VIM_EDITOR

# Unix
alias ls='ls -G'
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"
alias lld="ll -d"
alias llrt="ll -rt"
alias rm="rm"
alias rmrf="rm -rf"
# alias grep='grep --color=auto'
alias cpr='cp -r'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
v() {
  if ([ $# -eq 1 ] && [ -d $1 ]); then
    (cd $1; $VIM_EDITOR .)
  else
    $VIM_EDITOR "$@"
  fi
}
alias v.="v ."
alias vi=v
alias vi.=v.
alias vim=v
alias vim.=v.
alias vimdiff="$VIM_EDITOR -d"
alias vd=vimdiff
dif() { colordiff -u $@ | less }
mkcd() { mkdir $1 && cd $1 }
alias dush='du -sh'
alias path='echo $PATH | tr -s ":" "\n"'
psgrep() {
  grep $@ =(pstree | cut -c-$COLUMNS)
}
alias el=elinks
remove-colors() {
  sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
}
alias md5sum=md5
alias wcl='wc -l'

# Confs
alias reload=". ~/.zshrc"
alias conf="$MAIN_EDITOR ~/.zshrc"
alias al="$MAIN_EDITOR ~/.zshenv"

# Zsh
alias dirs='dirs -v'
alias '1'='cd -'
alias '2'='cd -2'
alias '3'='cd -3'
alias '4'='cd -4'
alias '5'='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias '--' -='cd -'

# Tmux
alias tl='tmux ls'
alias td='tmux detach'
alias kt='killall tmux'
t() {
  if [ $# -eq 0 ]; then
    tmux-start
  else
    tmux "$@"
  fi
}
tmux-start() {
  if (tmux ls | grep base | grep attached) &> /dev/null; then
    tmux-new-unnamed-session
  else
    tmux new -As base
  fi
}
tmux-new-unnamed-session() {
  local i=1
  while (tmux has-session -t $i 2> /dev/null); do; let i=i+1; done
  tmux new -s $i
}
tn() {
  if [ $# -eq 0 ]; then
    tmux new
  else
    tmux new -s $1
  fi
}
tk() {
  if [ $# -eq 0 ]; then
    tmux kill-session
  else
    for session in "$@"; do
      tmux kill-session -t $session
    done
  fi
}
ta() {
  if [ $# -eq 0 ]; then; tmux attach; fi

  if [ -z $TMUX ]; then
    tmux attach -t "=$1"
  else
    tmux switch -t "=$1"
  fi
}
ts() {
  if [ $# -eq 0 ]; then
    tmux start-server \; source ~/.tmux.conf
    return
  fi

  tmux start-server \; source ~/.tmux/sessions/$1.conf
  ta $1
}
tgo() {
  tmux new-session -d -s go
  tmux send-keys -t go "cd $(pwd)" C-m
  tmux send-keys -t go 'ts rails' C-m
  tmux send-keys -t go 'ggo' C-m
  ta go
}
to() {
  if [ $# -ne 1 ]; then; return; fi
  ta $1 2> /dev/null && return

  local session_file=~/.tmux/sessions/$1.conf
  if [ -f $session_file ]; then
    ts $1
  else
    tmux new -d -s $1
    ta $1
  fi
}
alias tw='to work'
alias tp='to purchase'
alias tb='to blog'
alias tc='to code'

# Git
alias gi='git init'
alias ginit='git init'
alias gl='git pull --rebase'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gaa='git add --all'
alias gaac='gaa && gc'
alias gbr='gb -r'
alias gca='gc --amend'
alias gca!='gca --no-edit'
alias gaaca='gaa && gca'
alias gaaca!='gaa && gca!'
alias gaacapf!='gaaca! && gpf'
alias gaacm='gaa && gcm'
alias gic='gaacm Initial commit'
alias gci='gic'
alias gco='git checkout'
alias gcob='gco -b'
alias gc-='gco -'
alias gco-='gco -'
alias gcl='git clone'
alias gclone='git clone'
gg() {
 local last_command=$history[$((HISTCMD-1))]
 local git_repo=$(echo $last_command | awk -F/ '{print $NF}' | sed 's/.git$//')
 cd $git_repo
}
ggcl() {
  local git_repo=$(echo $1 | awk -F/ '{print $NF}' | sed 's/.git$//')
  gcl "$@"
  cd $git_repo
}
alias gm="git merge"
alias gm-="git merge -"
alias gcm="git checkout master"
unalias gcm
gcm() {
  if [ $# -eq 0 ]; then
    git checkout master
  else
    gc -m "$*"
  fi
}
gcam() { gca -m "$*" }
alias gclean="git clean -fd"
alias grhhc="grhh && gclean"
gd() {
  if [ $# -eq 0 ]; then
    gd HEAD
  else
    git diff "$@" | _format-git-diff | eval $GIT_PAGER
  fi
}
_format-git-diff() {
  sed -r "s/^([^-+ ]*)[-+ ]/\\1/"
}
gsh() {
  git show "$@" | _format-git-diff | eval $GIT_PAGER
}
alias gdc="gd --cached"
alias gdh="gd HEAD"
alias "gdh^"="gd 'HEAD^'"
alias glog="git log"
alias glo="git log --abbrev-commit --decorate --date=relative --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
glop() {
  glo -p "$@" | _format-git-diff | eval $GIT_PAGER
}
alias gloo="git log --all --oneline --no-merges"
alias gloS="glo -S"
alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gmt="git mergetool"
alias grm="git rm"
alias grmc="git rm --cached"
alias grv="git remote -v"
alias gre='grv'
alias gr="git reset"
alias grh='git reset HEAD'
alias "grh^"="git reset 'HEAD^'"
alias grhh='git reset HEAD --hard'
alias "grhh^"="git reset --hard 'HEAD^'"
alias gst="git stash -u"
alias gstp="git stash pop"
alias gstl="git stash list"
alias gstc="git stash clear"
alias gsts="git stash save"
alias grb="git rebase"
alias grb-="git rebase -"
alias grbm="git rebase master"
alias grbi="git rebase -i"
alias grbi2="git rebase -i HEAD~2"
alias grbi3="git rebase -i HEAD~3"
alias grbi4="git rebase -i HEAD~4"
alias grbi5="git rebase -i HEAD~5"
alias grbim="git rebase -i master"
alias grbir="git rebase -i --root"
alias gcontinue="git rebase --continue"
alias gcont="gcontinue"
alias gcon="gcontinue"
alias gabort="git rebase --abort"
alias gab="gabort"
alias gskip="git rebase --skip"
alias gb='git branch'
alias gbs="git branch -D sav &> /dev/null; git branch sav"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbDs="git branch | remove-colors | cut -c3- | egrep -i '^s+a+v+.*' | xargs git branch -D"
alias gbDa='git branch | remove-colors | egrep -v "master|\*" | xargs git branch -D'
# alias gbDs="git-list-branches | egrep -i '^s+a+v+.*' | xargs git branch -D"
# alias gbDa='git-list-branches | grep -v "master\|$(current-git-branch)" | xargs git branch -D'
# git-list-branches() {
#   git for-each-ref --format="%(refname:short)" HEAD refs/heads
# }
alias gignore="git update-index --assume-unchanged"
alias gunignore="git update-index --no-assume-unchanged"
alias gignored="git ignored"
alias gp='git push'
alias gpf="gp -f"
alias gbm="gb -m"
gpu() {
  if [ $# -eq 0 ]; then
    gp -u origin $(current-git-branch)
  else
    gp -u "$@"
  fi
}
gpuf() {
  if [ $# -eq 0 ]; then
    gp -u -f origin $(current-git-branch)
  else
    gp -u -f "$@"
  fi
}
alias gclo-"git clone"
alias gx="gitx"
alias gu="gitup"
alias git-branch-previous='git check-ref-format --branch "@{-1}"'
ggo() {
  current-git-branch > .git/previous_branch
  gaacm "current work"
  gcm
}
gback() {
  if [ -e '.git/previous_branch' ]; then
    gco $(cat .git/previous_branch)
    rm .git/previous_branch
  fi

  last_commit_message=$(git log -1 --pretty=%B)
  if [ $last_commit_message = 'current work' ]; then; grh^; fi
  unset last_commit_message
}
alias gcurr='gaacm "current work"'
alias gcur=gcurr
grebase() {
  gcm && gl && gc- && grbm
}
alias gt='git tag'
alias gcp='git cherry-pick'
alias gcp-='git cherry-pick -'
fix() {
  vim +/"<<<<<<<" $(git diff --name-only --diff-filter=U | xargs)
}
alias gstats='git shortlog -sn'
alias gsa='git submodule add'
git-remove-submodule() {
  local submodule="$@"
  git submodule deinit -f $submodule
  git rm -f $submodule
  rm -rf .git/modules/$submodule
}
alias gsr='git-remove-submodule'

# Github
hc() {
  case $# in
    0) hub compare $(current-git-branch);;
    1) hub compare $1..$(current-git-branch);;
    2) hub compare $1..$2;;
    *) hub compare;;
  esac
}
alias hc-='hc $(git-branch-previous)'
alias hb="hub browse"
alias hp="hb -- pulls"
alias hw="hb -- wiki"
alias hf="hub fork"

# Docker
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias drmi='docker rmi'
alias drmif='docker rmi -f'
alias dr='docker run'
alias drit='docker run -it'
alias deit='docker exec -it'
alias ds='docker stop'
alias db='docker build'
alias db.='docker build .'
alias dl='docker pull'
alias dp='docker push'
alias dt='docker tag'
alias dh='docker history'
alias dm='docker-machine'
alias dms='docker-machine start'
dmip() {
  local ip=$(docker-machine ip)

  echo $ip | pbcopy
  echo $ip
}
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcr='docker-compose run'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcs='docker-compose stop'
alias dcps='docker-compose ps'

# Directories
alias st2='cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages'
alias st3='cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages'
alias .vim='cd ~/.vim'
alias c='cd ~/c'
alias ctmp='cd ~/c/tmp'
alias ct='ctmp'
alias desk='cd ~/Desktop'
alias de='desk'

# SSH
alias ssh_conf="$MAIN_EDITOR ~/.ssh/config"
alias ssh_key="cat ~/.ssh/id_rsa.pub | pbcopy"

# Apps / Binaries
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias s="subl"
alias s.="subl ."
alias s3="command subl"
alias s3.="s3 ."
alias zzz="pmset sleepnow"
alias say_good="say -v Good ooooooooooooooooooooooooooooooooooooooooooooooooooo"
alias say_bad="say -v Bad ooooooooooooooooooooooooooooooooooooooooooooooooooo"
alias keyboard_disable='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias keyboard_enable='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias iphone="open '/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'"
timer() { sleep $(($1*60)); terminal-notifier -message "${*:2}" }
ip() {
  local ip=$(ipconfig getifaddr en0)
  echo $ip | tr -d '\n' | pbcopy
  echo $ip
}
public-ip() {
  local ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
  echo $ip | pbcopy
  echo $ip
}
alias res="system_profiler SPDisplaysDataType | grep Resolution"
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}
alias o="open"
alias o.="open ."
alias tcam="osascript ~/.bin/isightdisabler5.scpt"
alias dpad="sudo kextunload /System/Library/Extensions/AppleUSBMultitouch.kext" # 2> /dev/null"
alias epad="sudo kextload /System/Library/Extensions/AppleUSBMultitouch.kext"
alias emouse="dpad"
alias dmouse="epad"
alias archey="archey -c"
serve() { ruby -run -e httpd . -p 5000 }
servepy() { python -m SimpleHTTPServer 8000 }
alias mounted="mount | column -t"
sman() { man "${1}" | col -b | subl }
alias rtop="top -o rsize"
alias ctop="top -o cpu"
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias sub='filebot -get-subtitles'
alias pw="openssl rand -base64 32 | tr -d '=/+'"
minivim() {
  local conf=$(awk 'NF > 0 { printf ":" $0 "\\\\n" }' ~/.vimrc.minimal)
  echo $conf | pbcopy
  echo $conf
}
killui() {
  for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}"
  done
}

# Entertainment
alias cowfortune="clear && fortune -a | cowsay | lolcat"
alias cowfact="clear && elinks -dump http://randomfunfacts.com  | sed -n '/^| /p' | tr -d \| | cowsay | lolcat"
alias dunnet="emacs -batch -l dunnet"
alias emacs-games="ls /usr/share/emacs/22.1/lisp/play/*.elc | column -t"
snow() {
  clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|awk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}
alias weather='curl wttr.in'

# Fzf
j() {
  if [ $# -gt 0 ]; then
    _z "$*"
  else
    cd "$(_z -l 2>&1 | fzf --height 40% --reverse --tac --query "$*" | sed 's/^[0-9,.]* *//')"
  fi
}
vj() {
  local old_directory=$(pwd)
  (
  j "$@"
  if [ "$(pwd)" != "$old_directory" ]; then; v.; fi
  )
}
jj() {
  cd "$(mdfind "kind:folder" -onlyin ~ -name  2> /dev/null | fzf)"
}
fgl() (
  [ $# -eq 0 ] && return
  cd /usr/local/Cellar/figlet/*/share/figlet/fonts
  local font=$(ls *.flf | sort | fzf --no-multi --reverse --preview "figlet -f {} $@") &&
  figlet -f "$font" "$@" | pbcopy
)

# Ruby / Rails
alias b='bundle'
alias be='bundle exec'
alias bo='bundle open'
alias bi='bundle install'
alias bu='bundle update'
rails() {
  if [ -e 'bin/rails' ]; then bin/rails "$@"; else command rails "$@"; fi
}
rake() {
  if [ -e 'bin/rake' ]; then bin/rake "$@"; else command rake "$@"; fi
}
rspec() {
  if [ -e 'bin/rspec' ]; then bin/rspec "$@"; else command rspec "$@"; fi
}
spring() {
  if [ -e 'bin/spring' ]; then bin/spring "$@"; else command spring "$@"; fi
}
alias r='rails'
alias rs='rails server'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rdm='rails destroy migration'
alias rd='rails destroy'
alias rc='rails c'
alias rr='rake routes'
alias mi1='rake db:migrate'
alias mi2='rake db:migrate && RAILS_ENV=test rake db:migrate'
alias mi='rake db:migrate db:rollback && mi2'
alias ro1='rake db:rollback'
alias ro2='rake db:rollback && RAILS_ENV=test rake db:rollback'
alias ro='ro2'
alias rT='rake -T'
alias zs='zeus start'
alias zs!='rm -f .zeus.sock; zs'
alias zc='zeus c'
alias debug='pry-remote'
alias st='spring stop'
alias irb='pry'
alias pr='powder restart'
alias il='invoker list'
alias is='invoker start'
fs() {
  if [ -e Procfile.dev ]; then
    foreman start -f Procfile.dev
  else
    foreman start
  fi
}
rgsq() {
  rg scaffold "$@" \
    --no-assets --no-helper --no-serializer --no-controller-specs \
    --no-view-specs --no-routing-specs --no-request-specs --no-model-specs
}
alias rru='rails runner'

# Javascript
alias y='yarn'
alias yr='yarn run'
alias ys='yarn run server'
alias ya='yarn add'
alias yrm='yarn remove'
alias yre='yrm'
