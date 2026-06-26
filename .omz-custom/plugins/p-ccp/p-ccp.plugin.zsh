#!/usr/bin/env zsh

export \
	API_URL_DEV=https://dev.metadata-service.qateradatacloud.com \
	API_URL_PP=https://preprod.metadata-service.qateradatacloud.com \
	API_URL_APP=https://azurepreprod.metadata-service.qateradatacloud.com \
	API_URL_PROD=https://metadata-service.teradatacloud.com

function get-vce-creds-dev() {
	if [[ -z "${CREDS_DEV}" ]]; then
		export CREDS_DEV=$(get-csm-secret dev | jq -r '"\(.username)@qateradatacloud.com:\(.password)"')
	fi
}

function get-vce-creds-prod() {
	if [[ -z "${CREDS_PROD}" ]]; then
		export CREDS_PROD=$(get-csm-secret prod | jq -r '"\(.username)@teradatacloud.com:\(.password)"')
	fi
}

function get-vce-creds() {
	get-vce-creds-dev
	get-vce-creds-prod
}

function set-api-url() {
	export API_URL=$(
		aws cloudformation describe-stacks \
        --stack-name accp-metadata-service-$(git branch --show-current | cut -c 1-9) \
        --query 'Stacks[0].Outputs[?OutputKey==`ApiUrl`].OutputValue' \
        --output text | sed -E 's#/$##'
	)
}

function __setup-snow__() {
	if [[ ${#} -ne 1 ]]; then
		return 1
	fi
	case ${=${(L)=1}} in
		dev)
			hn=teradatacsdev
			if [[ -z "${CREDS_DEV}" ]]; then
				get-vce-creds-dev
			fi
			creds="${CREDS_DEV}"
			;;
		stage)
			hn=teradatacsstage
			if [[ -z "${CREDS_PROD}" ]]; then
				get-vce-creds-prod
			fi
			creds="${CREDS_PROD}"
			;;
		prod)
			hn=teradatacs
			if [[ -z "${CREDS_PROD}" ]]; then
				get-vce-cred-prod
			fi
			creds="${CREDS_PROD}"
			;;
		*)
			return 1
			;;
	esac
}

function snow-org-site() {
	function usage() {
		echo "Usage: ${1} <dev|stage|prod> <org|site> <org name|site ID>"
	}

	if [[ ${#} -ne 3 ]]; then
		usage ${0}
		return 1
	fi
	op=${=${(L)=2}}
	case ${op} in
		org|site)
			;;
		*)
			usage ${0}
			return 1
			;;
	esac
	__setup-snow__ "${1}"
	curl \
        --silent \
		--show-error \
        --header "Accept: application/json" \
        --header "Content-Type: application/json" \
        --user "$(echo -n ${creds})" \
        --request GET \
        --url "https://${hn}.service-now.com/api/teop/metadata_service/siteDetails?${op}_name=${3}" |\
	jq .
	unset hn creds op
}

function snow-pooling() {
	function usage() {
		echo "Usage: ${1} <dev|stage|prod> <CSP> <CSP region>"
	}

	if [[ ${#} -ne 3 ]]; then
		usage ${0}
		return 1
	fi
	__setup-snow__ "${1}"
	curl \
		--silent \
		--show-error \
		--header "Accept: application/json" \
		--header "Content-Type: application/json" \
		--user "$(echo -n ${creds})" \
		--request GET \
		--url "https://${hn}.service-now.com/api/teop/metadata_service/checkPoolingSite?csp=${(L)2}&region=${(L)3}" |\
	jq --sort-keys .

	unset hn creds
}

function run-ccp() {
    local secrets_file=".runtime_secrets"
    local env_file=".runtime_env"
	local cron_ifs='
'
	if [[ -e ${secrets_file}.local ]]; then
		secrets_file=${secrets_file}.local
	fi
	if [[ -e ${env_file}.local ]]; then
		env_file=${env_file}.local
	fi
	if [[ ! -e ${secrets_file} ]] || [[ ! -e ${env_file} ]]; then
		echo "missing env or secrets file."
	else
		(
			export IFS=${cron_ifs} &&
			env $( sed -E '/^#/d;/^$/d;s/\{\{.*\}\}/dev/' ${secrets_file} ${env_file} ) ${@}
		)
	fi
}
