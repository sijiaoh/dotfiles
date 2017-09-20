#!/bin/bash -eu

mkdir -p "${HOME}/Library/Application Support/Keyhac"
ln -sfv ${DOTFILES_ROOT}/keyhac/config.py "${HOME}/Library/Application Support/Keyhac"
