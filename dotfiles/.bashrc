# ~/.bashrc

source ~/.git-completion.bash

TERM=xterm
CHEFDK_RUBY=/opt/chefdk/bin:/opt/chefdk/embedded/bin

if [ "`id -u`" -eq 0 ]; then
  PROMPT='# '
else
  PROMPT='$ '
fi

# LS COMMANDS
alias la='ls $LS_OPTIONS -alF'

# export PS1='\[\033]0;\w\007\]\[\033[20m\]\[[\t] \u'${PROMPT}'\[\033[0m\]'
export PS1='[chefdk] \u'${PROMPT}'\[\033[0m\]'
export CLICOLOR="yes"
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=${CHEFDK_RUBY}:${PATH}
