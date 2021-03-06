#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

bindkey -v

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

for i in ${HOME}/bin/rc.d/*.zsh; do
    if [ -r "${i}" ]; then
        #typeset -i zrcstart=$( ${HOME}/bin/getepicms ); \
        #. ${i} >> ${HOME}/.zinit_err 2>&1; \
        #echo "${i}: $( echo $( ${HOME}/bin/getepicms ) - ${zrcstart} | bc )"; \
        #unset zrcstart
        . ${i} >> ${HOME}/.zinit_err 2>&1
    fi
done

# The zstyle/compinit uses things defined in the rc.d scripts, so do it *after*
# they've been run.
#zstyle ':completion:*' completer _expand _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completer _complete _ignored _match _approximate _prefix
zstyle ':completion:*' max-errors 1 not-numeric
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit -i
