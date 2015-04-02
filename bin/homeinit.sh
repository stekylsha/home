#!/bin/sh
git init
git remote add origin https://github.com/stekylsha/home.git
git fetch
git checkout -t origin/master
git remote set-url origin git@github.com:stekylsha/home.git
