###########################
### Aliases / Functions ###
###########################
# Aliases are in this .zshenv file to make them work in VIM's non-interactive shell

VIM_EDITOR=nvim
MAIN_EDITOR=$VIM_EDITOR

# Unix
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -A'
alias lld='ll -d'
alias llrt='ll -rt'
alias llart='lla -rt'
alias cpr='cp -r'
alias rm='rm'
alias rmrf='rm -rf'
rm.() {
  local dir=$(pwd)
  if [[ $dir == ~/c/tmp/* ]]; then
    cd ..
    rm -rf $dir
  else
    echo 'ERROR: this command only works in ~/c/tmp as a security precaution.'
  fi
}
mv.() {
  local dir=$(pwd)
  if [[ $dir == ~/c/* ]]; then
    cd ..
    mv $dir $1
    cd $1
  else
    echo 'ERROR: this command only works in ~/c as a security precaution.'
  fi
}
.() {
  if [[ $# -eq 0 ]]; then
    cd .
  else
    source "$@"
  fi
}
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
ct() {
  if [[ $# -eq 0 ]]; then
    cd ~/c/tmp
  elif [[ $# -eq 1 ]] && ! which "$1" >/dev/null 2>&1; then
    if [[ $1 == *.* ]]; then
      cd ~/c/tmp
      touch $1
      $MAIN_EDITOR $1
    else
      mkcd ~/c/tmp/$1
    fi
  else
    cd ~/c/tmp
    eval $@
  fi
}
cct() {
  rm -rf ~/c/tmp/myapp* ~/c/tmp/mygem* ~/c/tmp/repro*
  if [[ $# -eq 0 ]]; then
    if [[ ! -d "$PWD" ]]; then cd ~/c/tmp; fi
  else
    ct "$@"
  fi
}
alias ctt='cct'
alias ctl='ct; llrt'
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
killp() { lsof -ti tcp:$1 | xargs kill -9 }
prepend() {
  local text_to_prepend="$1"
  local file=$2
  local tmp_file="tmp_$file"
  echo "Prepend\n"
  echo "$text_to_prepend\n"
  read -q "answer?to $file? "
  echo "\n"
  if [[ $answer != "y" ]]; then return; fi
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
    if [[ $? -ne 0 ]]; then which $1; fi
  fi
}
alias conf="$MAIN_EDITOR ~/.zshrc"
alias loc="$MAIN_EDITOR ~/.local.zsh"
alias sec='loc'
alias reload='. ~/.zshrc; . ~/.zshenv; . ~/.local.zsh'
alias rl='reload'
alias rel='reload'
alias i='arch -x86_64 zsh'

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
  if [[ $# -eq 0 ]]; then tmux attach; fi

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
  if [[ $# -ne 1 ]]; then return; fi
  ta $1 2> /dev/null && return

  local session_file=~/.tmux/sessions/$1.conf
  if [[ -f $session_file ]]; then
    ts $1
  else
    tmux new -d -s $1
    ta $1
  fi
}
trn() {
  tmux rename-window $1
  export TMUX_AUTOMATIC_RENAME=off
}
alias tb='to blog'
alias tc='to code'

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
alias gcf='git commit --fixup'
alias gaacf='gaa && gcf'
gci() {
  if [[ ! -d .git ]]; then git init; fi
  gaacm "Initial commit"
}
alias gic='gci'
alias gco='git checkout'
alias gcob='gco -b'
alias gc-='gco -'
alias gco-='gco -'
alias gcom='gco master --'
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
alias gm='git merge'
alias gm-='git merge -'
alias gmabort='git merge --abort'
gcm() {
  if [[ $# -eq 0 ]]; then
    git checkout $(git-main-branch)
  else
    gc -m "$*"
  fi
}
git-main-branch() {
  if [[ $(git branch --list 'main') ]]; then echo 'main'; else echo 'master'; fi
}
gcam() { gca -m "$*" }
alias gce='gc --allow-empty -m "Empty commit"'
gcem() { gc --allow-empty -m "$*" }
alias gclean='git clean -fd'
alias grhhc='grhh && gclean'
gd() {
  git diff "$@" | formatted-git-diff
}
formatted-git-diff() {
  sed -r "s/^([^-+ ]*)[-+ ]/\\1/" | eval $GIT_PAGER
}
alias gd!='git diff'
gsh() {
  git show "$@" | formatted-git-diff
}
alias gdc='gd --cached'
alias gdh='gd HEAD'
alias "gdh^"="gd 'HEAD^'"
alias glog='git log'
alias glo="git log --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias glod="glo --date=format-local:'%a %b %d %Y %H:%M' --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ad)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias gloa='glo --author=jerome'
alias gloda='glod --author=jerome'
alias gload='gloda'
alias lw='gload --since="last Monday midnight"'
glop() {
  glo -p "$@" | formatted-git-diff
}
alias gloo='git log --all --oneline --no-merges'
alias gloS='glo -S'
alias glo-='glo --'
alias gdt='git difftool'
alias gdtc='git difftool --cached'
alias gmt='git mergetool'
alias grm='git rm'
alias grmc='git rm --cached'
alias grv='git remote -v'
alias gre='grv'
alias gr='git reset'
alias grh='git reset HEAD'
alias "grh^"="git reset 'HEAD^'"
alias grhh='git reset HEAD --hard'
alias "grhh^"="git reset --hard 'HEAD^'"
alias gst='git stash -u'
alias gstm='gst -m'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstc='git stash clear'
alias gsts='git stash save'
alias grb='git rebase'
alias grb-='git rebase -'
grbm() { git rebase $(git-main-branch) }
alias grbi='git rebase -i'
alias grbi2='git rebase -i HEAD~2'
alias grbi3='git rebase -i HEAD~3'
alias grbi4='git rebase -i HEAD~4'
alias grbi5='git rebase -i HEAD~5'
alias grbi6='git rebase -i HEAD~6'
alias grbi7='git rebase -i HEAD~7'
alias grbi8='git rebase -i HEAD~8'
alias grbi9='git rebase -i HEAD~9'
alias grbi10='git rebase -i HEAD~10'
grbim() { git rebase -i $(git-main-branch) }
alias grbir='git rebase -i --root'
alias gcon='git rebase --continue'
alias grcon='gcon'
alias gaacon='gaa && gcon'
alias grabort='git rebase --abort'
alias gsk='git rebase --skip'
alias grbia='git rebase -i --autosquash'
grbiam() { git rebase -i --autosquash $(git-main-branch) }
alias grbiar='git rebase -i --autosquash --root'
gfix() {
  if [[ $# -eq 0 ]]; then
    gaacm 'fixup' &> /dev/null
    grbi10 || grbir
  else
    gaacf $1 && grbia $1^
  fi
}
alias gf='gfix'
# alias gab='git absorb'
# alias gabn='git absorb --dry-run'
# alias gabr='git absorb --and-rebase'
alias gab='git absorb --and-rebase'
alias gb='git branch --sort=-committerdate'
gbcp() { echo $(current-git-branch) | pbcopy }
alias gbs='git branch -D sav &> /dev/null; git branch sav'
alias gcs='git checkout sav'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbDs="git branch | remove-colors | cut -c3- | egrep -i '^s+a+v+.*' | xargs git branch -D"
alias gbDa='git branch | remove-colors | egrep -v "master|main|\*" | xargs git branch -D'
alias gbD-="gbD @{-1}"
gbDi() {
  git branch --sort=-committerdate | remove-colors | egrep -v "master|main|\*" | cut -c3- > /tmp/branches && \
    cp /tmp/branches /tmp/branches-to-keep && \
    $MAIN_EDITOR /tmp/branches-to-keep && \
    comm -23 <(sort /tmp/branches) <(sort /tmp/branches-to-keep) | xargs 2> /dev/null git branch -D
}
alias gbm='gb -m'
# alias gbDs="git-list-branches | egrep -i '^s+a+v+.*' | xargs git branch -D"
# alias gbDa='git-list-branches | grep -v "master\|$(current-git-branch)" | xargs git branch -D'
# git-list-branches() {
#   git for-each-ref --format="%(refname:short)" HEAD refs/heads
# }
alias gbi='git bisect'
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
alias gignored='git ignored'
alias gp='git push'
alias gpf='gp --force-with-lease'
alias gpf!='gp --force'
gpu() {
  if [[ $# -eq 0 ]]; then
    local remote=$(github-fork-exists && echo 'jeromedalbert' || echo 'origin')
    gp -u $remote $(current-git-branch)
  else
    gp -u "$@"
  fi
}
github-fork-exists() {
  git remote get-url jeromedalbert &>/dev/null
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
alias gclo-'git clone'
alias gitx='/Applications/GitX.app/Contents/Resources/gitx'
alias gx='gitx'
alias ggx='gitx'
alias gu='gitup'
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
  if [[ $last_commit_message == 'current work' ]]; then grh^; fi
  unset last_commit_message
}
alias gcurr='gaacm "current work"'
alias gcur=gcurr
grebase() {
  local branch=${1:-$(git-main-branch)}
  git checkout $branch && gl && gc- && grb-
}
gmerge() {
  local branch=${1:-$(git-main-branch)}
  git checkout $branch && gl && gc- && gm-
}
alias gt='git tag --sort=-v:refname'
alias gcp='git cherry-pick'
alias gcp-='git cherry-pick -'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
fix() {
  vim +"silent! /<<<<<<<" $(git diff --name-only --diff-filter=U | xargs)
}
alias fx='fix'
alias gstats='git shortlog -sn'
alias gsa='git submodule add'
git-submodule-remove() {
  local submodule="$@"
  git submodule deinit -f $submodule
  rm -rf .git/modules/$submodule
  git rm -f $submodule
}
alias gsr='git-submodule-remove'
alias grev='git revert'
alias grevh='git revert HEAD'
alias grevnoe='git revert --no-edit'
git-churn() {
  git log --all -M -C --name-only --format='format:' "$@" \
    | sort \
    | grep -v '^$' \
    | uniq -c \
    | sort -n \
    | awk 'BEGIN {print "count\tfile"} {print $1 "\t" $2}'
}
git-unchanged-since() {
  git log --name-only --since="$@" --pretty='format:' '*.rb' | egrep '^(app|lib)/' > /tmp/changed
  git ls-files '*.rb' | egrep '^(app|lib)/' > /tmp/all
  comm -23 <(sort -u /tmp/all) <(sort -u /tmp/changed)
}
alias squash='git reset --soft $(git-main-branch); gaacm "Squashed commits"'
alias squashi='git reset $(git commit-tree HEAD^{tree} -m "Initial commit")'

# Github
alias hc='gh pr create --web'
alias hp='gh pr view --web'
hpatch() {
  local branch=${1:-main}
  open "https://github.com/$(github-repo jeromedalbert)/compare/$branch...$(current-git-branch)"
}
alias hpa='hpatch'
alias hdiff='hpatch'
alias hd='hdiff'
hf() {
  gh repo fork --remote --remote-name=jeromedalbert
  gh repo set-default $(github-repo origin)
}
github-repo() {
  local origin=$1
  git remote get-url $origin | sed -r 's/.*:(.*)\.git/\1/'
}
hb() {
  local current_branch=$(current-git-branch)
  if [[ $current_branch == $(git-main-branch) ]]; then
    gh repo view --web
  else
    gh repo view --web --branch $current_branch
  fi
}
hs() { gh repo sync jeromedalbert/$(basename $PWD) && gl }
alias hcr='gh repo create --private --source=. $(basename $PWD)'
alias hcrp='gh repo create --public --source=. $(basename $PWD)'
alias hi='gi; gci; hcr; gpu'
alias hco='gh pr checkout'
alias hpc='hpc'
alias hpco='hpc'
gpuhc() { gpu "$@" && hc }
alias gpfhc='gpf && hc'
alias gpufhc='gpuf && hc'
alias gphc='gp && hc'

# Docker
alias docker='ensure-docker-is-running; command docker'
ensure-docker-is-running() {
  command docker ps &> /dev/null
  if [[ $? -ne 0 ]]; then
    open -a Docker
    while ! command docker ps &> /dev/null; do sleep 0.1; done
  fi
}
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias ds='docker stop'
alias dsa='docker stop $(docker ps -q)'
alias drmi='docker rmi'
alias drmif='docker rmi -f'
alias drma='docker rm $(docker ps -a -q)'
alias dr='docker run'
alias drit='docker run -it'
alias deit='docker exec -it'
alias deb='docker exec -it /bin/bash'
db() {
  if [[ $# -eq 0 ]]; then
    docker build .
  else
    docker build "$@"
  fi
}
dbt() {
  if [[ $# -eq 0 ]]; then
    docker build -t foo .
  else
    docker build -t "$@"
  fi
}
alias dl='docker pull'
alias dp='docker push'
alias dt='docker tag'
alias dh='docker history'
alias da='docker attach'
drb() {
  if [[ $# -eq 0 ]]; then
    docker run --rm -it foo /bin/bash
  else
    docker run -it "$@" /bin/bash
  fi
}
alias dbr='dbt && drb'
dq() { osascript -e 'quit app "Docker Desktop"' }
alias dc='docker compose'
alias dcb='docker compose build'
alias dcr='docker compose run'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcs='docker compose stop'
alias dcps='docker compose ps'

# Dev containers
alias devcontainer='ensure-docker-is-running; command devcontainer'
alias devup='devcontainer up --workspace-folder .'
alias devb='devcontainer exec --workspace-folder . bash'
alias devs='docker compose -f .devcontainer/compose.yaml stop'

# Directories
alias st2='cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages'
alias st3='cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages'
alias .vim='cd ~/.vim'
alias c='cd ~/c'
alias desk='cd ~/Desktop'
alias dls='cd ~/Downloads'
alias de='desk'

# SSH
alias ssh='TERM=xterm-256color ssh'
alias sshconf="$MAIN_EDITOR ~/.ssh/config"
alias sshc='sshconf'
alias sshk="$MAIN_EDITOR ~/.ssh/known_hosts"
alias ssh-key='cat ~/.ssh/id_jerome.pub | tee >(pbcopy)'
alias ssh-keys='ssh-key'

# Entertainment
alias cowfortune='clear && fortune -a | cowsay | lolcat'
alias cowfact="clear && elinks -dump http://randomfunfacts.com  | sed -n '/^| /p' | tr -d \| | cowsay | lolcat"
alias dunnet='emacs -batch -l dunnet'
alias emacs-games='ls /usr/share/emacs/22.1/lisp/play/*.elc | column -t'
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
  local previous_dir=$(pwd)
  j "$@"
  if [[ "$(pwd)" != "$previous_dir" ]]; then v.; fi
}
jj() {
  cd "$(mdfind "kind:folder" -onlyin ~ -name 2> /dev/null | fzf)"
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
bundle() {
  command bundle "$@"
  if [[ $? -eq 0 && $1 == 'gem' ]]; then cd $2; fi
}
alias b='bundle'
alias be='bundle exec'
alias bo='bundle open'
alias bi='bundle install'
alias bu='bundle update'
bundle-path() {
  VISUAL=echo bundle open $1
}
alias bp='bundle-path'
bs() { ag -C "$@" $(bundle show --paths) }
rails() {
  binstub-command rails "$@"
  if [[ $? -eq 0 && $1 == 'new' && -d "$2" ]]; then cd $2; fi
}
alias rake='binstub-command rake'
alias rspec='binstub-command rspec'
alias spring='binstub-command spring'
alias brakeman='binstub-command brakeman'
alias kamal='bin/kamal'
alias importmap='bin/importmap'
binstub-command() {
  local cmd=$1
  shift
  if [[ -e bin/$cmd ]]; then bin/$cmd "$@"; else command $cmd "$@"; fi
}
alias im='importmap'
alias bd='bin/dev'
alias r='rails'
alias rs='rails server'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rgs='rails generate scaffold'
alias rdm='rails destroy migration'
alias rd='rails destroy'
ruby-console() {
  if [[ -e 'config/application.rb' ]]; then bin/rails c
  elif [[ -e 'bin/console' ]]; then bin/console
  else irb
  fi
}
alias rc='ruby-console'
alias rcs='rails c --sandbox'
alias rr='rails routes'
alias rrs='rails restart'
alias rss='rrs'
alias rst='rrs'
alias rdb='rails db'
alias mi='rake db:migrate'
alias ro='rake db:rollback'
alias romi='ro && mi'
alias rT='rake -T'
alias st='spring stop'
alias strc='st && rc'
alias ss='spring status'
fs() {
  if [[ -e 'bin/dev' ]]; then bin/dev; return; fi
  local options=''
  if [[ -e '.env' ]]; then options='-e .env'; fi
  if [[ -e '.env.local' ]]; then options="$options,.env.local"; fi
  if [[ -e 'Procfile.dev' ]]; then options="$options -f Procfile.dev"; fi
  eval "foreman start $options $@"
}
alias rru='rails runner'
alias rhash='asdf reshim ruby'
alias gmo='gem open'
alias gmi='gem install'
alias gmins='gmi'
alias gminf='gem info'
alias gmun='gem uninstall -x'
alias gmuns='gmun'
alias gmup='gem update'
alias gmupd='gmup'
alias gmu='gem update'
gmd() { open "http://www.rubydoc.info/gems/$1" }
gman() { man $(gem-path $1)/man/* }
gmcd() { cd $(gem-path $1) }
gem-path() {
  VISUAL=echo gem open $1
}
alias gmp='gem-path'
gmb() {
  open $(gem info $1 | awk '/Homepage/ { print $2 }')
}
alias gml='gem list'
alias ocov='open coverage/index.html '
alias cov='COVERAGE=true rspec && ocov'
steps() {
  git checkout $(git-main-branch) &> /dev/null
  local main_mig_num=$(ls db/migrate | wc -l)
  git checkout - &> /dev/null
  local mig_num=$(ls db/migrate | wc -l)
  local delta=$(($mig_num - $main_mig_num))
  echo $delta
}
alias sw='stree write'
rdbg() {
  if [[ $# -eq 0 ]]; then
    rdbg -An
  else
    command rdbg "$@"
  fi
}
alias dbundle='ruby ~/c/rubygems/bundler/spec/support/bundle.rb'
alias dgem='ruby -I ~/c/rubygems/lib ~/c/rubygems/exe/gem'
drails() {
  local previous_dir=$(pwd)
  cd ~/c/rails
  if [[ $1 == 'new' && -n $2 && ! "$@" =~ (--help|-h) ]]; then
    local app_path=$2
    if [[ ! "$app_path" =~ ^~?/ ]]; then app_path="$previous_dir/$app_path"; fi
    bundle exec rails new $app_path ${@:2} --dev
    if [[ $? -eq 0 ]]; then cd $app_path; else; cd $previous_dir; fi
  else
    bundle exec rails $@
    cd $previous_dir
  fi
}
alias rt='rake -T'

# Javascript
alias y='yarn'
alias yr='yarn run'
alias ya='yarn add'
alias yu='yarn upgrade'
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

# Fly.io
alias fl='fly'
fls() {
  local app_name=${1:-jeromeapp}
  DISABLE_SPRING=true fly launch --yes --name $app_name
}
flrm() {
  local app_name=$(fly-app-name)
  fly apps destroy $app_name -y
  fly apps destroy $app_name-db -y
}
fly-app-name() { grep 'app =' fly.toml | sed -r "s/app = '(.*)'/\1/" }
alias flo='fly apps open'
alias fld='fly deploy'
alias flst='fly status'
alias flc='fly console'
alias fll='fly logs'
alias fles='fly secrets set'
alias fleu='fly secrets unset'
alias flb='fly ssh console'
alias fle="fly ssh console -q -C printenv | sort"
alias flrc='fly ssh console -q --pty -C "bin/rails console"'
alias flmi='fly ssh console --pty -C "bin/rails db:migrate"'
alias flr='fly ssh console -q -C'
flru() {
  set -x
  fly ssh console -q -C "bin/rails runner '$*'"
}
alias flrru='kmru'
alias fldb='fly postgres connect -a $(fly-app-name)-db'

# Kamal
alias km='kamal'
alias kms='ensure-docker-is-running; kamal setup'
alias kmd='ensure-docker-is-running; kamal deploy'
alias kmlo='kamal lock'
alias kmlr='kamal lock release'
alias kmrm='kamal remove -y'
alias kma='kamal app'
alias kml='kamal logs -q -n 0'
alias kmae='kamal app exec'
alias kmc="kamal console -q"
alias kmrc='kmc'
alias kmb='kamal shell -q'
alias kmrb='kmb'
alias kme="kamal app exec -q 'printenv | sort'"
alias kmpr='kme'
alias kmep='kamal env push'
alias kmepb='kmep && kmab'
alias kmeu='kmepb'
alias kmu='kmepb'
kmru() {
  set -x
  bin/kamal app exec -q -p "bin/rails runner '$*'"
}
alias kmrru='kmru'
alias kmh='kamal healtcheck'
alias kmdt='kamal details -q'
alias kmac='kamal app containers -q'
alias kmab='kamal app boot'
alias kmacc='kamal accessory'
alias kmaccdt='kamal accessory details all -q'
alias kmacce='kamal accessory exec'
kmaccb() { kamal accessory exec $1 -q -i bash }
alias kmp='kamal proxy'
alias kmdb='kamal dbc -q'
kmo() { bundle exec dotenv -f .kamal/secrets.production sh -c 'open http://$SERVER_IP' }
kmssh() { bundle exec dotenv -f .kamal/secrets.production sh -c 'ssh root@$SERVER_IP' }

# Heroku
alias hps='heroku ps'
alias hl='heroku logs -t --dyno=web'
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
alias he='hpr'
alias hrp='hpr'
alias hrb='heroku run bash'
alias ho='heroku open'
hurl() {
  heroku info -s "$@" | grep web_url | cut -d= -f2
}
gph() { git push heroku $(git-main-branch) }
gpfh() { gpf heroku $(git-main-branch) }
alias gphm='gph'

# Kube
alias kr='kube run'
krc() { kube run $@ rails c }
krb() { kube run $@ bash }
kpr() { kube run $@ printenv | sort }
krru() { kube run $1 $2 rails runner $3 }
alias krbg='kube run:bg'
krrubg() { kube run:bg $1 $2 rails runner $3 }
alias kl='kube logs'
alias ke='kube env'
alias kp='kube pods'

# Brew
brupd() {
  if [[ $# -eq 0 ]]; then
    brew update
  else
    brew upgrade "$@"
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
alias brs='brew search'
alias brl='brew list'
alias brls='brl'
alias bcupd='brupd'
alias bcupg='brew upgrade --cask'
alias bcupgr='bcupg'
alias bcins='brew install --cask'
alias bcinst='bcins'
alias bcinf='brew info --cask'
alias bcinfo='bcinf'
alias bcun='brew uninstall --cask'
alias bcuns='bcun'
alias bcuni='bcun'
alias bcs='brew search --cask'
alias bcl='brew list --cask'
alias bcls='bcl'
alias bsl='brew services list'
alias bss='brew services start'
alias bst='brew services stop'
alias bsr='brew services restart'
alias bsta='brew services stop --all'

# Apps / Binaries
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias subl.='subl .'
alias subl3='command subl'
alias subl3.='subl3 .'
cursor() {
  (/Applications/Cursor.app/Contents/MacOS/Cursor "$@" > /dev/null 2>&1 &)
}
alias cur='cursor'
alias c.='cur .'
alias zzz='pmset sleepnow'
alias say_good='say -v Good ooooooooooooooooooooooooooooooooooooooooooooooooooo'
alias say_bad='say -v Bad ooooooooooooooooooooooooooooooooooooooooooooooooooo'
alias keyboard_disable='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias keyboard_enable='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias iphone="open '/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'"
timer() { sleep $(($1*60)); terminal-notifier -message "${*:2}" }
localip() {
  local ip=$(ipconfig getifaddr en0)
  echo $ip | tr -d '\n' | pbcopy
  echo $ip
}
alias privateip='localip'
publicip() {
  local ip=$(curl -s ipinfo.io/ip)
  echo $ip | pbcopy
  echo $ip
}
alias ip='publicip'
alias myip='publicip'
iploc() {
  curl -s ipinfo.io/"$@" | jq '.city + ", " + .region + ", " + .country' | tr -d '"'
}
alias whereami='iploc'
alias res='system_profiler SPDisplaysDataType | grep Resolution'
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}
alias o='open'
alias o.='open .'
alias toggle-cam='tcam'
alias dpad='sudo kextunload /System/Library/Extensions/AppleUSBMultitouch.kext' # 2> /dev/null"
alias epad='sudo kextload /System/Library/Extensions/AppleUSBMultitouch.kext'
alias emouse='dpad'
alias dmouse='epad'
alias archey='archey -c'
serve() { ruby -run -e httpd . -p 8000 }
servepy() { python -m http.server 8000 }
alias mounted='mount | column -t'
sman() { man "${1}" | col -b | subl }
alias rtop='top -o rsize'
alias ctop='top -o cpu'
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
rn() {
  if [[ $# -eq 0 ]]; then set -- "-o"; fi
  if [[ "$*" =~ " worker" ]]; then set -- "$@" "--api"; fi
  rails new $1 -m /Users/jerome/c/boilerplate/rails-template/template.rb --css tailwind ${@:2}
}
rnm() {
  rn "$@" --main
}
gn() {
  local gem_new_path=~/c/boilerplate/gem-new
  bundle exec --gemfile $gem_new_path/Gemfile $gem_new_path/exe/gem-new "$@"
  if [[ $? -eq 0 && -d "$1" ]]; then cd $1; fi
}
mkpwd() {
  local max_chars=${1:-28}
  cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w $max_chars | head -n 1 | tee >(pbcopy)
}
mkpwd2() {
  local password=$(openssl rand -base64 300 | tr -d '\n=/+')
  local max_chars=${1:-28}
  echo $password | cut -c-$max_chars | tee >(pbcopy)
}
alias password='mkpwd'
alias mkpw='mkpwd'
alias pw='mkpw'
alias fd='fd --type f'
alias ng='ngcp && ngrok http --domain $NGROK_DOMAIN 5000'
alias ngcp='echo "https://$NGROK_DOMAIN" | pbcopy'
smee() {
  echo $SMEE_URL | pbcopy
  command smee -u $SMEE_URL -p 5000 "$@"
}
alias smeecp='echo $SMEE_URL | pbcopy'
alias smeego='open $SMEE_URL'
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
alias curljs='curl -H "Content-type: application/json"'
curlgql() {
  curljs --X POST -s -w '%{time_total}' "$@" | jq
}
alias unused='unused -t .tags'
alias ytdlp='yt-dlp'
alias chrome_no_ssl='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --ignore-urlfetcher-cert-requests &> /dev/null'
alias macname='scutil --get ComputerName'
alias speedtest='networkQuality'
alias cores='nproc'
bench() {
  if [[ $# -eq 0 ]]; then browsertime --help; return; fi
  browsertime --headless --skipHar --resultDir=/tmp "$@"
  echo
  cat /tmp/browsertime.json | jq -r '.[0].statistics.timings.pageTimings | "Average DOM Load Time: \(.domContentLoadedTime.mean) ms\nAverage Load Time: \(.pageLoadTime.mean) ms\n\nMean DOM Load Time: \(.domContentLoadedTime.mean) ms\nMean Load Time: \(.pageLoadTime.mean) ms"'
}
alias nosleep='caffeinate -d'
alias act='ensure-docker-is-running; command act'
imglatlong() { exiftool -n -p '$gpslatitude,$gpslongitude' "$@" }
cs() { gh copilot suggest "$*" }
ce() { gh copilot explain "$*" }
alias ol='ollama'
olr() { ol run "$@" }
oll() { ol run llama3.1 "$@" }
olg() { ol run gemma2 "$@" }
old() { ol run deepseek-r1 "$@" }
