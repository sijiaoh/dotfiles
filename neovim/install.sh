#!/bin/bash -eu

mkdir -p ${ZDOTDIR:-$HOME}/.config/nvim
ln -sfv ${DOTFILES_ROOT}/neovim/init.vim ${ZDOTDIR:-$HOME}/.config/nvim/init.vim
