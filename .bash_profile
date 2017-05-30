alias dotfiles='/usr/bin/git --git-dir=/Users/jasonfeng/.dotfiles/ --work-tree=/Users/jasonfeng'

alias ls='ls -la'

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jasonfeng/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jasonfeng/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jasonfeng/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jasonfeng/Downloads/google-cloud-sdk/completion.bash.inc'; fi
source /usr/local/opt/autoenv/activate.sh
