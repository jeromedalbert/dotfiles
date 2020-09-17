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
alias llart="lla -rt"
alias rm="rm"
alias rmrf="rm -rf"
# alias grep='grep --color=auto'
alias cpr='cp -r'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
v() {
  if [[ $# -eq 1 && -d $1 ]]; then
    (cd $1; $VIM_EDITOR .)
  else
    $VIM_EDITOR "$@"
  fi
}
alias v.='v .'
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
alias psgrep='pstree | grep'
psgrepp() {
  grep $@ =(pstree | cut -c-$COLUMNS)
}
alias el=elinks
remove-colors() {
  sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
}
alias md5sum=md5
alias wcl='wc -l'
alias ct.='ctags -f .tags -R .'
alias chx='chmod +x'
ed() { command ed -p '*' "$@" }
alias wh='which'
alias cmd='command'
prepend() {
  local text_to_prepend="$1"
  local file=$2
  local tmp_file="tmp_$file"

  echo "Prepend\n"
  echo "$text_to_prepend\n"
  read -q "answer?to $file? "
  echo "\n"
  if [[ $answer != "y" ]]; then; return; fi

  echo 'Prepending...'
  echo $text_to_prepend > $tmp_file
  cat $file >> $tmp_file
  mv $tmp_file $file
  echo 'Done'
}

# Confs
al() {
  if [[ $# -eq 0 ]]; then
    $MAIN_EDITOR ~/.zshenv
  else
    alias $1
    if [[ $? -ne 0 ]]; then; which $1; fi
  fi
}
alias conf="$MAIN_EDITOR ~/.zshrc"
alias sec="$MAIN_EDITOR ~/.secrets.zsh"
alias reload='. ~/.zshrc; . ~/.zshenv'
alias rl='reload'

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
  if [[ $# -eq 0 ]]; then
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
  if [[ $# -eq 0 ]]; then
    tmux new
  else
    tmux new -s $1
  fi
}
tk() {
  if [[ $# -eq 0 ]]; then
    tmux kill-session
  else
    for session in "$@"; do
      tmux kill-session -t $session
    done
  fi
}
ta() {
  if [[ $# -eq 0 ]]; then; tmux attach; fi

  if [[ -z $TMUX ]]; then
    tmux attach -t "=$1"
  else
    tmux switch -t "=$1"
  fi
}
ts() {
  if [[ $# -eq 0 ]]; then
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
  if [[ $# -ne 1 ]]; then; return; fi
  ta $1 2> /dev/null && return

  local session_file=~/.tmux/sessions/$1.conf
  if [[ -f $session_file ]]; then
    ts $1
  else
    tmux new -d -s $1
    ta $1
  fi
}

# Git
alias gi='git init'
alias ginit='git init'
alias gl='git pull --rebase --prune'
alias glall='ls | xargs -P10 -I{} git -C {} pull --rebase --prune'
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
 cd $(git_repo $last_command)
}
git-repo() {
  echo $1 | sed 's/.git$//' | sed 's/\/$//' | awk -F/ '{print $NF}'
}
ggcl() {
  local git_repo=$(git-repo $1)
  gcl "$@"
  cd $git_repo
}
alias gclg='ggcl'
gclv() {
  local git_repo=$(git-repo $1)
  gcl "$@"
  v $git_repo
}
ggclv() {
  ggcl "$@"
  v.
}
ex() {
  [ $# -eq 0 ] && return
  local git_repo=$(git-repo $1)
  cd ~/c/tmp
  if [[ -d $git_repo ]]; then
    cd $git_repo
    v.
  else
    ggclv "$@"
  fi
}
alias e='ex'
alias gm="git merge"
alias gm-="git merge -"
alias gmabort="git merge --abort"
gcm() {
  if [[ $# -eq 0 ]]; then
    git checkout master
  else
    gc -m "$*"
  fi
}
gcam() { gca -m "$*" }
alias gce='gc --allow-empty -m "Empty commit"'
gcem() { gc --allow-empty -m "$*" }
alias gclean="git clean -fd"
alias grhhc="grhh && gclean"
gd() {
  if [[ $# -eq 0 ]]; then
    gd HEAD
  else
    git diff "$@" | format-git-diff | eval $GIT_PAGER
  fi
}
format-git-diff() {
  sed -r "s/^([^-+ ]*)[-+ ]/\\1/"
}
alias gdiff='git diff'
gsh() {
  git show "$@" | format-git-diff | eval $GIT_PAGER
}
alias gdc="gd --cached"
alias gdh="gd HEAD"
alias "gdh^"="gd 'HEAD^'"
alias glog="git log"
alias glo="git log --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias glod="glo --date=human --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ad)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
glop() {
  glo -p "$@" | format-git-diff | eval $GIT_PAGER
}
alias gloo="git log --all --oneline --no-merges"
alias gloS="glo -S"
alias glo-="glo --"
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
alias gcon="git rebase --continue"
alias gaacon="gaa && gcon"
alias gabort="git rebase --abort"
alias gsk="git rebase --skip"
alias gb='git branch --sort=-committerdate'
alias gbs="git branch -D sav &> /dev/null; git branch sav"
alias gcs="git checkout sav"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbDs="git branch | remove-colors | cut -c3- | egrep -i '^s+a+v+.*' | xargs git branch -D"
alias gbDa='git branch | remove-colors | egrep -v "master|\*" | xargs git branch -D'
alias gbD-="gbD @{-1}"
gbDi() {
  git branch --sort=-committerdate | remove-colors | egrep -v "master|\*" | cut -c3- > /tmp/branches && \
    cp /tmp/branches /tmp/branches-to-keep && \
    $MAIN_EDITOR /tmp/branches-to-keep && \
    comm -23 <(sort /tmp/branches) <(sort /tmp/branches-to-keep) | xargs 2> /dev/null git branch -D
}
alias gbm="gb -m"
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
gpu() {
  if [[ $# -eq 0 ]]; then
    gp -u origin $(current-git-branch)
  else
    gp -u "$@"
  fi
}
gpuf() {
  if [[ $# -eq 0 ]]; then
    gp -u -f origin $(current-git-branch)
  else
    gp -u -f "$@"
  fi
}
gpd() {
  if [[ $# -eq 0 ]]; then
    gp -d origin $(current-git-branch)
  else
    gp -d "$@"
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
  if [[ -e '.git/previous_branch' ]]; then
    gco $(cat .git/previous_branch)
    rm .git/previous_branch
  fi
  last_commit_message=$(git log -1 --pretty=%B)
  if [[ $last_commit_message == 'current work' ]]; then; grh^; fi
  unset last_commit_message
}
alias gcurr='gaacm "current work"'
alias gcur=gcurr
grebase() {
  gcm && gl && gc- && grbm
}
gmerge() {
  gcm && gl && gc- && git merge master
}
alias gt='git tag'
alias gcp='git cherry-pick'
alias gcp-='git cherry-pick -'
fix() {
  vim +"silent! /<<<<<<<" $(git diff --name-only --diff-filter=U | xargs)
}
alias fx='fix'
alias gstats='git shortlog -sn'
alias gsa='git submodule add'
git-remove-submodule() {
  local submodule="$@"
  git submodule deinit -f $submodule
  rm -rf .git/modules/$submodule
  git rm -f $submodule
}
alias gsr='git-remove-submodule'
alias grev='git revert'
alias grevnoe='git revert --no-edit'

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
alias hp="hub pr show"
alias hf="hub fork"
alias fork="hub fork"
alias hcr="hub create"
alias gpuhc='gpu && hc'
alias gpfhc='gpf && hc'
alias gpufhc='gpuf && hc'
alias gphc='gp && hc'

# Docker
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias drmi='docker rmi'
alias drmif='docker rmi -f'
alias drma='docker rm $(docker ps -a -q)'
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
alias da='docker attach'
alias dm='docker-machine'
alias dms='docker-machine start'
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
alias ssh='TERM=xterm-256color ssh'
alias ssh_conf="$MAIN_EDITOR ~/.ssh/config"
alias ssh-key='cat ~/.ssh/id_jerome.pub | tee >(pbcopy)'
alias ssh-keys='ssh-key'

# Apps / Binaries
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias subl.="subl ."
alias subl3="command subl"
alias subl3.="subl3 ."
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
publicip() {
  local ip=$(dig @resolver1.opendns.com ANY myip.opendns.com +short -4)
  echo $ip | tr -d '\n' | pbcopy
  echo $ip
}
alias public-ip='publicip'
alias remoteip='publicip'
alias remote-ip='publicip'
iploc() {
  curl -s ipinfo.io/"$@" | jq '.city + ", " + .region + ", " + .country' | tr -d '"'
}
alias whereami='iploc'
alias geoip='iploc'
alias res="system_profiler SPDisplaysDataType | grep Resolution"
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}
alias o="open"
alias o.="open ."
alias tcam="osascript ~/.bin/isightdisabler5.scpt"
alias toggle-cam='tcam'
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
alias sub='subliminal download -l en'
alias sub2='filebot -get-subtitles'
minivim() {
  local conf=$(awk 'NF > 0 { printf ":" $0 "\\\\n" }' ~/.vimrc.minimal)
  echo $conf | tee >(pbcopy)
}
killui() {
  for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}"
  done
}
alias nra='~/c/boilerplate/new-rails-app'
alias nrg='~/c/boilerplate/new-ruby-gem'
alias nsa='~/c/boilerplate/new-sinatra-app'
mkpwd() {
  local max_chars=${1:-28}
  cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w $max_chars | head -n 1
}
mkpwd2() {
  local password=$(openssl rand -base64 300 | tr -d '\n=/+')
  local max_chars=${1:-28}
  echo $password | cut -c-$max_chars
}
alias mkpw='mkpwd'
alias pw='mkpw'
alias fd='fd --type f'
alias cpng='curl -s http://127.0.0.1:4040/status | grep -P "https://.*?ngrok.io" -oh | tr -d "\n" | pbcopy'
alias ngcp='cpng'
tess() {
  local file=$1
  if [[ -z $file ]]; then
    file=$(ls -dt ~/Desktop/* | head -n 1)
  fi

  tesseract $file stdout | tee >(pbcopy)
}
gq() {
  local escaped_query=$(printf "%q" ${@: -1})
  curl -X POST -H 'Content-Type: application/json' $1 -d "{ \"query\": \"$escaped_query\" }"
}
alias pj='pbpaste | jq .'
parsecron() {
  ruby -e "require 'cronex'; puts Cronex::ExpressionDescriptor.new('$1').description" \
    | tee >(pbcopy)
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
  if [[ $# -gt 0 ]]; then
    # _z "$@"
    # cd "$(_z -l 2>&1 | fzf -f "$*" | sort -nr | head -n 1 | sed 's/^[0-9,.]* *//')"
    cd "$(_z -l 2>&1 | fzf -f "$*" | head -n 1 | sed 's/^[0-9,.]* *//')"
  else
    cd "$(_z -l 2>&1 | fzf --height 40% --reverse --tac --query "$*" | sed 's/^[0-9,.]* *//')"
  fi
}
vj() {
  (jv "$@")
}
jv() {
  local old_directory=$(pwd)
  j "$@"
  if [ "$(pwd)" != "$old_directory" ]; then; v.; fi
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
fkill() {
  local pids=$(ps -f -u $USER | sed 1d | fzf --multi | tr -s '[:blank:]' | cut -d' ' -f3)
  if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9 "$@"
  fi
}
flog() {
  local commits=$(
    glo --color=always "$@" |
      fzf --ansi --no-sort --height 100% \
      --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
      xargs -I@ sh -c 'git show --color=always @'"
  )
  if [[ -n "$commits" ]]; then
    local hashes=$(printf "$commits" | cut -d' ' -f2 | tr '\n' ' ')
    git show $hashes
  fi
}
freflog() {
  local hash=$(
    git reflog --color=always "$@" |
      fzf --no-multi --ansi --no-sort --height 100% \
      --preview "git show --color=always {1}"
  )
  echo $hash
}

# Ruby / Rails
alias b='bundle'
alias be='bundle exec'
alias bo='bundle open'
alias bi='bundle install'
alias bu='bundle update'
rails() {
  if [[ -e 'bin/rails' ]]; then bin/rails "$@"; else command rails "$@"; fi

  if [[ $? -eq 0 && $1 == 'new' ]]; then; cd $2; fi
}
rake() {
  if [[ -e 'bin/rake' ]]; then bin/rake "$@"; else command rake "$@"; fi
}
rspec() {
  if [[ -e 'bin/rspec' ]]; then bin/rspec "$@"; else command rspec "$@"; fi
}
spring() {
  if [[ -e 'bin/spring' ]]; then bin/spring "$@"; else command spring "$@"; fi
}
alias r='rails'
alias rs='rails server'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rgs='rails generate scaffold'
alias rdm='rails destroy migration'
alias rd='rails destroy'
alias rc='rails c'
alias rcs='rails c --sandbox'
alias rr='rake routes'
alias rdb='rails db'
# alias mi1='rake db:migrate'
# alias mi2='rake db:migrate && RAILS_ENV=test rake db:migrate'
# alias mi='rake db:migrate db:rollback && mi2'
alias mi='rake db:migrate'
# alias ro1='rake db:rollback'
# alias ro2='rake db:rollback && RAILS_ENV=test rake db:rollback'
# alias ro='ro2'
alias ro='rake db:rollback'
alias rT='rake -T'
alias zs='zeus start'
alias zs!='rm -f .zeus.sock; zs'
alias zc='zeus c'
alias debug='pry-remote'
alias st='spring stop'
alias strc='st && rc'
alias stt='spring status'
alias sts='stt'
alias irb='pry'
alias pr='powder restart'
fs() {
  local options=''
  if [[ -e '.env' ]]; then; options='-e .env'; fi
  if [[ -e '.env.local' ]]; then; options="$options,.env.local"; fi
  if [[ -e 'Procfile.dev' ]]; then; options="$options -f Procfile.dev"; fi
  eval "foreman start $options $@"
}
alias rru='rails runner'
alias rhash='asdf reshim ruby'
alias gmo='gem open'
alias gmi='gem install'
alias gmun='gem uninstall'
alias gmu='gmun'
alias gmup='gem update'
gmd() { open "http://www.rubydoc.info/gems/$1" }
gman() { man $(gem-path $1)/man/* }
gmcd() { cd $(gem-path $1) }
gem-path() {
  VISUAL=echo gem open $1
}
alias gmp='gem-path'
alias ocov='open coverage/index.html '
alias cov='COVERAGE=true rspec && ocov'
steps() {
  git checkout master &> /dev/null
  local master_mig_num=$(ls db/migrate | wc -l)
  git checkout - &> /dev/null
  local mig_num=$(ls db/migrate | wc -l)
  local delta=$(($mig_num - $master_mig_num))
  echo $delta
}

# Javascript
alias y='yarn'
alias yr='yarn run'
alias ya='yarn add'
alias yrm='yarn remove'
alias yre='yrm'
alias nhash='asdf reshim nodejs'

# Python
alias py='python'

# PHP
alias phpa='php -a'

# Ansible
alias an='ansible'
alias ans='an'
alias anp='ansible-playbook'
alias apl='anp'
alias and='ansible-doc'
alias anc='ansible-console'
alias anv='ansible-vault'
alias ang='ansible-galaxy'

# Heroku
alias hps='heroku ps'
alias hl='heroku logs -t'
alias hmi='heroku run rake db:migrate'
alias hap='heroku accounts:set personal'
alias haw='heroku accounts:set work'
alias haa='heroku apps --all'
alias hcs='heroku config:set'
alias hcu='heroku config:unset'
alias hr='heroku run'
alias hrd='heroku run:detached'
alias hrc='heroku run rails console'
# alias hro='heroku run rake db:rollback'
alias hpr='heroku run "printenv | sort"'
alias hrp='hpr'
alias hrb='heroku run bash'
hurl() {
  heroku info -s "$@" | grep web_url | cut -d= -f2
}
alias gph='git push heroku master'
alias gphm='gph'

# Kube
alias kr='kube run'
krc() { kube run $@ rails c }
krb() { kube run $@ bash }
kpr() { kube run $@ printenv | sort }
alias krbg='kube run:bg'
alias kl='kube logs'
alias ke='kube env'
alias kp='kube pods'

# Brew
brupd() {
  if [[ $# -eq 0 ]]; then
    brew update
  else
    brew upgrade "$*"
  fi
}
alias brupg='brew upgrade'
alias brupgr='brupg'
alias brins='brew install'
alias brinst='brins'
alias brinf='brew info'
alias brinfo='brinf'
alias brun='brew uninstall'
alias bruns='brun'
alias bruni='brui'
alias brs='brew search'
alias brl='brew list'
alias brls='brl'
alias bcs='brew search'
alias bcupd='brupd'
alias bcupg='brew cask upgrade'
alias bcupgr='bcupg'
alias bcins='brew cask install'
alias bcinst='bcins'
alias bcinf='brew cask info'
alias bcinfo='bcinf'
alias bcun='brew cask uninstall'
alias bcuns='bcun'
alias bcuni='bcun'
# alias bcs='brew cask search'
alias bcl='brew cask list'
alias bcls='bcl'
alias brsl='brew services list'
