# tmux send-keys -R \; send-keys C-l \; clear-history
PROMPT=':! '

# export STATE='initial'
# precmd() {
#   case $STATE in
#     'initial')
#       STATE='check_exit_code'
#       return
#       ;;
#     'stopped') return;;
#     'check_exit_code')
#       local last_exit_code=$?
#       if [[ $last_exit_code -eq 0 ]]; then
#         exit
#       else
#         STATE='stopped'
#       fi
#       ;;
#   esac
# }

precmd() {
  ls
}
