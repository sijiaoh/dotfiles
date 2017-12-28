#!/bin/bash -eu

mkdir -p "${HOME}/.config/karabiner"
ln -sfv ${DOTFILES_ROOT}/karabiner/karabiner.json "${HOME}/.config/karabiner"
