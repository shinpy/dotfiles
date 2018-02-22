#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

[ -f $ZDOTDIR/.zshenv_`uname` ] && . $ZDOTDIR/.zshenv_`uname`
[ -f $ZDOTDIR/.zshenv_local ] && . $ZDOTDIR/.zshenv_local

