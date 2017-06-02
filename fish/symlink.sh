#!/bin/bash -eu

mkdir -pv ${HOME}/.config
ln -sfv ${DOTFILES_ROOT}/fish/fish ${HOME}/.config
