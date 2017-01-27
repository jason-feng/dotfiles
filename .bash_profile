alias dotfiles='/usr/bin/git --git-dir=/Users/jasonfeng/.dotfiles/ --work-tree=/Users/jasonfeng'

eval "$(rbenv init -)"

# Bash Auto Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi

# Git Auto Completion
source ~/.git.completion.bash

# Virtualenv Auto Activate
source ~/.virtualenv-auto-activate.sh

source ~/.bash.theme
