# For terminal colour
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# for custom prompt like `username directory $` in pretty colours
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'

# Add boxen to path
source /opt/boxen/env.sh

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/thomas/.gvm/bin/gvm-init.sh" ]] && source "/Users/thomas/.gvm/bin/gvm-init.sh"
