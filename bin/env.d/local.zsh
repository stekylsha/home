#!/bin/zsh
# Set up the path and library path for usr/local
export PATH=$( echo $PATH | sed 's#\(.*\)\(:/usr/local/bin\)\(:.*\)#/usr/local/bin:\1\3#' )
