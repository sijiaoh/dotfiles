#!/bin/bash -eu

# Install vim-plug.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -fLO https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip
unzip zenhan.zip
chmod u+x zenhan/bin64/zenhan.exe
sudo mv zenhan/bin64/zenhan.exe /usr/local/bin/zenhan
rm -rf zenhan.zip zenhan

mkdir -p ${ZDOTDIR:-$HOME}/.config/nvim
ln -sfv ${DOTFILES_ROOT}/neovim/init.vim ${ZDOTDIR:-$HOME}/.config/nvim/init.vim
