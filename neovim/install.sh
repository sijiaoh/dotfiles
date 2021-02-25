#!/bin/bash -eu

# Install vim-plug.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ${ZDOTDIR:-$HOME}/.config/nvim
ln -sfv ${DOTFILES_ROOT}/neovim/init.vim ${ZDOTDIR:-$HOME}/.config/nvim/init.vim
