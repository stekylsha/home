TD_TTU="/Library/Application Support/teradata/client/16.20"
if [[ ! ( "${PATH}" =~ "${TD_TTU}" ) && -d "${TD_TTU}" ]]; then
    export PATH="${PATH}":"${TD_TTU}"/bin
fi
