if [ ${ZSH_VERSION} ]; then
    precmd() { myprompt; }
    setopt PROMPT_BANG
    setopt PROMPT_PERCENT
    bindkey -v
elif [ ${BASH_VERSION} ]; then
    PROMPT_COMMAND=myprompt
    set -o vi
fi

export PROMPT='[%{[34m%}%n%{[0m%}:%{[31m%}%m%{[0m%}]%{[32m%}%20<..<%/%{[0m%} | %{[35m%}!%{[31m%}%#%{[0m%} '

# function called every time shell is about to draw prompt
myprompt() {
    printf "]0;%s@%s:%s\007" "${USER}" "${HOST%%.*}" "${PWD/#$HOME/~}"
}

