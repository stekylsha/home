#
# .zshenv is sourced :)
#
for i in $HOME/bin/env.d/*.zsh ; do
    if [ -r "$i" ]; then
        if [ "$PROMPT" ]; then
            . $i
        else
            . $i >/dev/null 2>&1
        fi
    fi
done

