#!/bin/zsh
# Set up the path and library path for usr/local, forcing it to be first.
export PATH=$( echo $PATH | sed 's#\(.*\)\(:/usr/local/bin\)\(:.*\)#/usr/local/bin:\1\3#' )
# Set up the path and library path for opt/homebrew, forcing it to be first.
export PATH=$( echo $PATH | sed 's#\(.*\)\(:/opt/homebrew/bin\)\(:.*\)#/opt/homebrew/bin:\1\3#' )
