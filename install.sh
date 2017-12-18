#!/usr/bin/env bash

##
# Note that the symlink commands delete any existing files of the same name.
##

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -sf ${BASEDIR}/.vimrc ~/.vimrc
# Because the second argument is a directory, ln will make a symlink
# to .vim and place this link within the ~ directory
ln -sFf ${BASEDIR}/.vim ~

# Zsh
ln -sf ${BASEDIR}/.zshrc ~/.zshrc

# Git
ln -sf ${BASEDIR}/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

source .macos
