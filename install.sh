#!/usr/bin/env bash

##
# Note that the symlink commands delete any existing files of the same name.
##

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Zsh
echo "==> Zsh"
ln -sf ${BASEDIR}/.zshrc ~/.zshrc
ln -sf ${BASEDIR}/samadams.zsh-theme ~/.oh-my-zsh/custom/themes/samadams.zsh-theme

# Git
echo "==> Git"
ln -sf ${BASEDIR}/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Macos
echo "==> macOS defaults"
source ${BASEDIR}/.macos

# Ghostty
echo "==> Ghostty"
mkdir -p ~/.config/ghostty
ln -sf ${BASEDIR}/ghostty-config ~/.config/ghostty/config

# Vim
echo "==> Vim"
ln -sf ${BASEDIR}/.vimrc ~/.vimrc
# Because the second argument is a directory, ln will make a symlink
# to .vim and place this link within the ~ directory
ln -sFf ${BASEDIR}/.vim ~/.vim
echo "==> Vim: syncing submodules"
(cd ${BASEDIR}/.vim && git submodule sync)
echo "==> Vim: installing plugins"
(cd ${BASEDIR}/.vim && git submodule update --init)

# IdeaVim RC
echo "==> IdeaVim"
ln -sf ~/.vimrc ~/.ideavimrc

# Brew
echo "==> Homebrew setup"
source ${BASEDIR}/brew-once.sh

# Brew packages
echo "==> Homebrew packages"
brew bundle

# Firefox extensions (via enterprise policy)
echo "==> Firefox"
FIREFOX_DIST="/Applications/Firefox Developer Edition.app/Contents/Resources/distribution"
if [ -d "/Applications/Firefox Developer Edition.app" ]; then
  mkdir -p "${FIREFOX_DIST}"
  cp "${BASEDIR}/firefox-policies.json" "${FIREFOX_DIST}/policies.json"
  echo "Firefox policies installed. Extensions will be added on next launch."
else
  echo "Firefox Developer Edition not found, skipping extension setup."
fi

