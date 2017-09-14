alias dotfiles='/usr/bin/git --git-dir=/Users/jasonfeng/.dotfiles/ --work-tree=/Users/jasonfeng'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias sandbox='mosh -6 dev -- tmux'

# Tmux auto attach to session "auto"
if [ "$TERM_PROGRAM" != "nuclide" ] && [ "$TERM" != "nuclide" ] && [ -t 0 ] && [ -z "$TMUX" ] && which tmux >/dev/null 2>&1 && [[ "`tmux -V`" == "tmux 1.8" || "`tmux -V`" == "tmux 2.2" ]]; then
  if tmux has-session -t auto >/dev/null 2>&1; then
    tmux -2CC attach-session -t auto
  else
    tmux -2CC new-session -s auto
  fi
fi

# added by travis gem
[ -f /Users/jasonfeng/.travis/travis.sh ] && source /Users/jasonfeng/.travis/travis.sh
