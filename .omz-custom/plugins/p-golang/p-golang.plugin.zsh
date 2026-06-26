#!/usr/bin/env zsh
#if [[ -z "${GOPATH}" ]]; then
#    export GOPATH=${HOME}/src/go
#    export GOPRIVATE=github.td.teradata.com
#    #export GOLANG_DIR=/usr/local/Cellar/go
#    #export GO111MODULE=on
#
#    #if [[ ! ( ${PATH} =~ "${GOLANG_DIR}" ) && -d ${GOLANG_DIR}/bin ]]; then
#    #    export PATH=$PATH:${GOLANG_DIR}/bin
#    #fi
#
#    if [[ ! ( ${PATH} =~ "${GOPATH}/bin" ) ]]; then
#        export PATH=$PATH:${GOPATH}/bin
#    fi
#fi

# Set GOPATH in go with `go env -w GOPATH=${HOME}/src/go`
#
GOPATH=$( go env GOPATH )
if [[ ! ( ${PATH} =~ "${GOPATH}/bin" ) ]]; then
    export PATH=$PATH:${GOPATH}/bin
fi
