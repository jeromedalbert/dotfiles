#############################
### Environment variables ###
#############################

export EDITOR=$MAIN_EDITOR
export VISUAL=$EDITOR
export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export PROMPT='%~$(git-prompt-info)$(arch-prompt-info)$ '
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export FZF_DEFAULT_OPTS='--reverse --color="info:#000000,spinner:#000000" --prompt="  " --cycle --pointer=">" --style=minimal'
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export PAGER=less
export GIT_PAGER='less -F -X'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GREP_COLORS=auto
export GREP_COLOR=auto
export GOPATH=$HOME/.go
export HOMEBREW_PREFIX=$([[ $(arch) == 'arm64' ]] && echo '/opt/homebrew' || echo '/usr/local')
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export MANPATH=$HOMEBREW_PREFIX/share/man:$MANPATH
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export GH_NO_UPDATE_NOTIFIER=true
export PGGSSENCMODE=disable
export RUBY_DEBUG_NO_HINT=true
export RUBY_DEBUG_IRB_CONSOLE=1
export OVERMIND_TMUX_CONFIG=$HOME/.tmux.overmind.conf
export PATH=$HOME/.bin
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:$HOMEBREW_PREFIX/bin
export PATH=$PATH:$HOMEBREW_PREFIX/sbin
export PATH=$PATH:$HOMEBREW_PREFIX/opt/python/libexec/bin
export PATH=$PATH:$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin

#############################
### General configuration ###
#############################

setopt no_beep
setopt interactive_comments
setopt prompt_subst

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

setopt hup
setopt long_list_jobs
setopt notify

unsetopt nomatch

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''
# case-insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

#############################
### Plugins configuration ###
#############################

source ~/.zsh/z.sh
unalias z

####################
### Key bindings ###
####################
bindkey -e

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '\eb' backward-word
bindkey '\ef' forward-word
bindkey '\ed' kill-word
bindkey '^k' kill-line
bindkey '^d' delete-char
bindkey '\ew' backward-kill-word
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

zmodload zsh/complist
bindkey -M menuselect '^e' accept-line
bindkey -M menuselect '\ef' menu-complete
bindkey -M menuselect '\eb' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

zle -N insert-last-command-output
bindkey '^x^l' insert-last-command-output

autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey '^[m' copy-earlier-word

zle -N expand-or-complete-with-waiting-dots
bindkey '^i' expand-or-complete-with-waiting-dots

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

zle -N fancy-ctrl-z;
bindkey '^z' fancy-ctrl-z

zle -N exit-shell
bindkey '^Sx' exit-shell

bindkey -N paste
zle -N start-paste
bindkey '^[[200~' start-paste
zle -N end-paste
bindkey -M paste '^[[201~' end-paste
zle -N paste-insert paste-insert
bindkey -R -M paste "^@"-"\M-^?" paste-insert
bindkey -M paste -s '^M' '^J'

# bindkey -M emacs 'â' backward-word
# bindkey -M emacs 'æ' forward-word
# bindkey -M emacs 'ä' kill-word
# bindkey -M menuselect 'æ' menu-complete
# bindkey -M menuselect 'â' reverse-menu-complete
# bindkey '®' insert-last-word

#################
### Functions ###
#################

git-prompt-info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  echo " %F{green}($(current-git-branch)%f $(git-dirty)%F{green})%f"
}

current-git-branch() {
  git symbolic-ref --short -q HEAD
}

git-dirty() {
  test -z "$(command git status --porcelain --ignore-submodules -unormal)"
  if [[ $? -eq 1 ]]; then
    echo '%F{red}✗%f'
  else
    echo '%F{green}✔%f'
  fi
}

arch-prompt-info() {
  if [[ $(arch) == 'i386' && $(sysctl -n machdep.cpu.brand_string) == 'Apple M1' ]]; then
    echo ' ℹ️  '
  fi
}

expand-or-complete-with-waiting-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}

insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

exit-shell() {
  exit
}

start-paste() {
  bindkey -A paste main
}

end-paste() {
  bindkey -e
  LBUFFER+=$_paste_content
  unset _paste_content
}

paste-insert() {
  _paste_content+=$KEYS
}

#############
### Other ###
#############

source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
stty -ixon
if [[ -e ~/.local.zsh ]]; then; source ~/.local.zsh; fi
if [[ -n $TMUX && $(tmux show-window-options -t $TMUX_PANE -v automatic-rename) == "off" ]]; then
  export TMUX_AUTOMATIC_RENAME=off
fi
if [[ -z $TMUX && -z $VIM && "$TERM_PROGRAM" != "vscode" ]]; then; tmux-start; fi
