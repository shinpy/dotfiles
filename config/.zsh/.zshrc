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

# z
_Z_DATA=$ZDOTDIR/z_data/z

load-if-exists $ZDOTDIR/z/z.sh && {
  . ${ZDOTDIR}/z/z.sh
  function precmd_z() {
     _z --add "$(pwd -P)"
  }
}

############################################################

# functions
FPATH=$FPATH:$ZDOTDIR/functions
autoload -U ssh-ec2

# peco z
autoload -U peco-z-search
zle -N peco-z-search
bindkey '^f' peco-z-search

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

# Measure
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

