#!/usr/bin/env zsh

set -eu

brew install zsh

if ! test -e "${ZDOTDIR:-$HOME}/.zprezto"; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sfv "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sfv ${DOTFILES_ROOT}/zsh/zshrc.zsh ${ZDOTDIR:-$HOME}/.zshrc
ln -sfv ${DOTFILES_ROOT}/zsh/zpreztorc.zsh ${ZDOTDIR:-$HOME}/.zpreztorc
