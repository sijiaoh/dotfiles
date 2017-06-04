#!/usr/bin/env zsh

set -eu

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sfv ${DOTFILES_ROOT}/zsh/zshrc.zsh ${ZDOTDIR:-$HOME}/.zshrc
