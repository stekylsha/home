## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
HISTSIZE=20000
HISTFILE=$HOME/.zsh_history
SAVEHIST=2000

export HISTSIZE HISTFILE SAVEHIST

fc -R
