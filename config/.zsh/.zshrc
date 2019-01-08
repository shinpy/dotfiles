##
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/prezto/init.zsh"
fi

function load-if-exists() { test -e "$1" && source "$1" }

unsetopt promptcr
unsetopt correct

export HISTCONTROL=ignoreboth

############################################################

# fasd
_FASD_DATA=$ZDOTDIR/fasd

############################################################

# functions
FPATH=$FPATH:$ZDOTDIR/functions
autoload -U ssh-ec2

# peco fasd
autoload -U peco-fasd-search
zle -N peco-fasd-search
bindkey '^f' peco-fasd-search

# peco ghq
autoload -U peco-ghq
zle -N peco-ghq
bindkey '^q' peco-ghq

############################################################

[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`

# config
for i in $ZDOTDIR/config/*.zsh; do
  source $i
done

for i in $HOME/works/.zsh/config/*.zsh; do
  source $i
done

##
## Profiling
##
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

