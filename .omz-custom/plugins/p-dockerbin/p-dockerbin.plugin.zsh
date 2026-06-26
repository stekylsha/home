#!/usr/bin/env zsh
#
# Define docker bin path
export DOCKER_HOME="${HOME}/.docker"
export DOCKER_BIN="${DOCKER_HOME}/bin"

# Check if docker bin exists in the path.
if [[ ! ( ${PATH} =~ ${DOCKER_BIN} ) &&  -d ${DOCKER_BIN} ]]; then
  # Nope. Add the docker bin path
  export PATH="${PATH}:${DOCKER_BIN}"
fi
