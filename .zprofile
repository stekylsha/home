#
# .zprofile is sourced :)
#
for i in ${HOME}/bin/env.d/*.zsh; do
    if [ -r "${i}" ]; then
        #typeset -i zpstart=$( ${HOME}/bin/getepicms ); \
        #. ${i} >> ${HOME}/.zinit_err 2>&1; \
        #echo "${i}: $( echo $( ${HOME}/bin/getepicms ) - ${zpstart} | bc )"; \
        #unset zpstart
        . ${i} >> ${HOME}/.zinit_err 2>&1
    fi
done
