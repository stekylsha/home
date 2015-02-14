#!/bin/sh
git init
git remote add origin git@github.com:stekylsha/home.git
git fetch
git checkout -t origin/master
