###########################
### ALIASES / FUNCTIONS ###
###########################

# Utility variables
export VIM_EDITOR=nvim
export SUBLIME_EDITOR=subl
export SUBLIME_COMMAND_LINE="subl --wait"
export MAIN_EDITOR=$VIM_EDITOR

# Unix
alias ls='ls -G'
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"
alias lld="ll -d"
alias llrt="ll -rt"
alias rm="rm"
alias rmrf="rm -rf"
alias grep='grep --color=auto'
fw() { grep -inr "$@" . }
hs() { history | grep $* }
alias hsi='hs -i'
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
alias vdiff=vimdiff
mkcd() { mkdir $1 && cd $1 }
alias dush='du -sh'
alias path='echo $PATH | tr -s ":" "\n"'
alias t='tmux'
alias tls='tmux ls'
alias tl='tls'
alias tn='tmux new-session -s'
alias td='tmux detach'
alias tk='tmux kill-session -t'
alias ts='tmux source ~/.tmux.conf'
ta() {
  if [ $# -eq 0 ]; then
    tmux attach
  else
    tmux attach -t "$*"
  fi
}
tg() {
  tmux attach -t "$*" || tmux new -s "$*"
}
psgrep() {
  grep $@ =(pstree | cut -c-$COLUMNS)
}

# Confs
alias reload=". ~/.zshrc"
alias conf="$MAIN_EDITOR ~/.zshrc"
alias al="$MAIN_EDITOR ~/.aliases.zsh"

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
gcamm() { gca -m "$*" }
alias gca!='gca --no-edit'
alias gaaca='gaa && gca'
alias gaaca!='gaa && gca!'
alias gaacapf!='gaaca! && gpf'
alias gaacm='gaa && gcm'
alias gco='git checkout'
alias gcob='gco -b'
alias gc-='gco -'
alias gco-='gco -'
alias gcl='git clone'
alias gclone='git clone'
gg() {
 local last_command=$history[$((HISTCMD-1))]
 local git_repo=`echo $last_command | awk -F/ '{print $NF}' | sed 's/.git$//'`
 cd $git_repo
}
ggcl() {
  local git_repo=`echo $1 | awk -F/ '{print $NF}' | sed 's/.git$//'`
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
alias gclean="git clean -fd"
alias grhhc="grhh && gclean"
alias gd='git diff'
alias gdc="gd --cached"
alias "gdh^"="gd 'HEAD^'"
alias gshow="git show"
alias glog="git log"
alias glo="git log --abbrev-commit --decorate --date=relative --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gmt="git mergetool"
alias grm="git rm"
alias grmc="git rm --cached"
alias grs="git remote show"
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
alias grbir="git rebase -i --root"
alias gcontinue="git rebase --continue"
alias gcont="gcontinue"
alias gcon="gcontinue"
alias gabort="git rebase --abort"
alias gab="gabort"
alias gskip="git rebase --skip"
alias gb='git branch'
alias gbs="git branch sav"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbDs="git branch | cut -c3- | egrep -i '^s+a+v+.*' | xargs git branch -D"
alias gbS="gbDs && gbs"
alias gignore="git update-index --assume-unchanged"
alias gunignore="git update-index --no-assume-unchanged"
alias gignored="git ignored"
alias gp='git push'
alias gpf="gp -f"
alias gbm="gb -m"
gpu() {
  if [ $# -eq 0 ]; then
    gpu origin `git-branch-current`
  else
    gp -u "$@"
  fi
}
alias gclo-"git clone"
alias gx="gitx"
alias gshow="git show"
alias git-branch-previous='git check-ref-format --branch "@{-1}"'
ggo() {
  git-branch-current > .git/previous_branch

  gaacm "current work"

  gcm
}
gback() {
  if [ -e '.git/previous_branch' ]; then
    gco `cat .git/previous_branch`
    rm .git/previous_branch
  fi

  last_commit_message=`git log -1 --pretty=%B`
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

# Github
hc() {
  case $# in
  0)  hub compare `git-branch-current`
      ;;
  1)  hub compare $1..`git-branch-current`
      ;;
  2)  hub compare $1..$2
      ;;
  *)  hub compare
      ;;
  esac
}
alias hc-='hc `git-branch-previous`'
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
  local ip=`docker-machine ip`

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

# Folders/Directories
alias st2='cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages'
alias st3='cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages'
alias stproj='cd ~/.sublime/projects'
alias .vim='cd ~/.vim'
alias c='cd ~/c'
alias desk='cd ~/Desktop'
alias work='cd ~/Documents/Vicinity'

# SSH
alias ssh_conf="$MAIN_EDITOR ~/.ssh/config"
alias ssh_key="cat ~/.ssh/id_rsa.pub | pbcopy"

# Apps
alias s="subl"
alias s.="subl ."
alias zzz="pmset sleepnow"
alias say_good="say -v Good ooooooooooooooooooooooooooooooooooooooooooooooooooo"
alias say_bad="say -v Bad ooooooooooooooooooooooooooooooooooooooooooooooooooo"
alias keyboard_disable='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias keyboard_enable='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias iphone="open '/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'"
timer() { sleep $(($1*60)); terminal-notifier -message "${*:2}" }
ip() {
  local ip=`ipconfig getifaddr en0`

  echo $ip | tr -d '\n' | pbcopy
  echo $ip
}
external_ip() {
  local ip=`dig +short myip.opendns.com @resolver1.opendns.com`

  echo $ip | pbcopy
  echo $ip
}
alias public_ip="external_ip"
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
alias pow_restart='touch ~/.pow/restart.txt'
alias sub='filebot -get-subtitles'

# Entertainment
alias cowfortune="clear && fortune -a | cowsay | lolcat"
alias cowfact="clear && elinks -dump http://randomfunfacts.com  | sed -n '/^| /p' | tr -d \| | cowsay | lolcat"
alias dunnet="emacs -batch -l dunnet"
alias emacs_games="ls /usr/share/emacs/22.1/lisp/play/*.elc | column -t"
snow() {
  clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|awk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}

# Directories
alias blog='cd ~/c/blog'
alias vc='cd ~/c/vicinity'
alias vc2='cd ~/c/vicinity2'
alias pi='cd ~/c/pitchbattle'

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
alias rd='rails destroy'
alias rc='rails c'
alias rr='rake routes'
alias mi='rake db:migrate'
alias migr='rake db:migrate db:rollback && rake db:migrate && RAILS_ENV=test rake db:migrate'
alias ro='rake db:rollback'
alias roll='rake db:rollback && RAILS_ENV=test rake db:rollback'
alias rT='rake -T'
alias zs='zeus start'
alias zs!='rm -f .zeus.sock; zs'
alias zc='zeus c'
alias debug='pry-remote'
alias st='spring stop'
alias irb='pry'

# Python
gpip() {
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
