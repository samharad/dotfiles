#!/usr/bin/env bash

##
# Note that the symlink commands delete any existing files of the same name.
##

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Zsh
ln -sf ${BASEDIR}/.zshrc ~/.zshrc
ln -sf ${BASEDIR}/samadams.zsh-theme ~/.oh-my-zsh/custom/themes/samadams.zsh-theme

# Git
ln -sf ${BASEDIR}/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Macos
source ${BASEDIR}/.macos

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf ${BASEDIR}/ghostty-config ~/.config/ghostty/config

# Vim
ln -sf ${BASEDIR}/.vimrc ~/.vimrc
# Because the second argument is a directory, ln will make a symlink
# to .vim and place this link within the ~ directory
ln -sFf ${BASEDIR}/.vim ~
cd ${BASEDIR}/.vim
git submodule update --init

# IdeaVim RC
ln -sf ~/.vimrc ~/.ideavimrc

# Brew
source ${BASEDIR}/brew-once.sh

# Brew packages
brew bundle

# Firefox extensions (via enterprise policy)
FIREFOX_DIST="/Applications/Firefox Developer Edition.app/Contents/Resources/distribution"
if [ -d "/Applications/Firefox Developer Edition.app" ]; then
  mkdir -p "${FIREFOX_DIST}"
  cp "${BASEDIR}/firefox-policies.json" "${FIREFOX_DIST}/policies.json"
  echo "Firefox policies installed. Extensions will be added on next launch."
else
  echo "Firefox Developer Edition not found, skipping extension setup."
fi

