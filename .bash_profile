alias dotfiles='/usr/bin/git --git-dir=/Users/jasonfeng/.dotfiles/ --work-tree=/Users/jasonfeng'
alias ls='ls -la'

# Bash Auto Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi

source ~/.bash.theme

## hg ________________

alias st='hg status'
alias sm='hg summary'

# BEGIN: Block added by chef, to set environment strings
# Please see https://fburl.com/AndroidProvisioning if you do not use bash
# or if you would rather this bit of code 'live' somewhere else
. ~/.fbchef/environment
# END: Block added by chef
