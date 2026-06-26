#!/usr/bin/env zsh

export AWS_PROFILE="icaws-accp-metadata-service-nonprod"
#if [[ -e ${HOME}/.aws/${AWS_PROFILE}-identity.json ]]; then
#    export AWS_IDENTITY_FILE=${HOME}/.aws/${AWS_PROFILE}-identity.json
#    export AWS_IDENTITY="$( cat ${AWS_IDENTITY_FILE} )"
#    export AWS_ACCOUNT="$( jq -r '.Account' ${AWS_IDENTITY_FILE} )"
#fi

# Make aws not require --profile for every command.
#function aws () {
#	local awsp=() 
#	[[ -n ${AWS_PROFILE} ]] && awsp=(--profile ${AWS_PROFILE}) 
#	command aws ${awsp[@]} ${@}
#}

