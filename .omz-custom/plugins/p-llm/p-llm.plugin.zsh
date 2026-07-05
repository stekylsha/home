#!/usr/bin/env zsh

# Put other cool llm stuff here, I guess.
#
# Make sure Copilot is using the "global" .agents directory.
if [[ -d "${HOME}/.agents" ]]; then
	export COPILOT_CUSTOM_INSTRUCTIONS_DIRS="$HOME/.agents"
fi
