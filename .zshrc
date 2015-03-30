#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

zstyle :compinstall filename '/home/sksharp/.zshrc'
autoload -Uz compinit
compinit

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

for i in $HOME/bin/rc.d/*.zsh ; do
    if [ -r "$i" ]; then
        if [ "$PS1" ]; then
            . $i
        else
            . $i >/dev/null 2>&1
        fi
    fi
done

