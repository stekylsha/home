#!/usr/bin/env zsh

# Don't search home for a git repo.
export GIT_CEILING_DIRECTORIES=${HOME}

# old habits ...
alias gs='git status'
alias gbcg='git branch -vv | awk '\''/: gone/{print $1}'\'''

function gwtclone() {
	# usage: gwtclone git@host:org/repo.git myrepo
	if [[ "${#}" -lt 1 ]] || [[ -z "${1}" ]]; then
		echo "Usage: ${0} <git repo url> [<local dir>]" >&2
		return 1
	fi
	local url="${1}" dir="${2:-${${${${1%/}##*:}##*/}:r}}"
	if [[ -z "${dir}" ]]; then
		echo "${0}: ${1} is not a valid repo url" >&2
		return 1
	fi
	if [[ -e "${dir}/.git" || -e "${dir}/.bare" ]]; then
		echo "${0}: ${dir} already looks like a repo" >&2
		return 1
	fi
	# Make the repo dir bare and populate inside it.
	git init --bare "${dir}/.bare"                     || return 1
	echo "gitdir: ./.bare" > "${dir}/.git"             || return 1
	git -C "${dir}" remote add origin "${url}"         || return 1
	git -C "${dir}" fetch origin                       || return 1
	git -C "${dir}" remote set-head origin --auto      || return 1
	# Check out the remote's default branch as the first worktree. Strip the
	# `origin/` from the front, if it's there.
	local def="${$(git -C "${dir}/.bare" symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null)#origin/}"
	[[ -n "${def}" ]] && {
		git -C "${dir}" worktree add "${def}" "${def}" || return 1
	}
	cd "${dir}"
}

# Everything else comes from the git plugin.
