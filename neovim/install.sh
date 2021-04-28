#!/bin/bash -eu

brew install unzip

curl -fLO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install vim-plug.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -fLO https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip win32yank-x64.zip -d win32yank
chmod u+x win32yank/win32yank.exe
sudo mv win32yank/win32yank.exe /usr/local/bin/win32yank
rm -rf win32yank-x64.zip win32yank

curl -fLO https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip
unzip zenhan.zip
chmod u+x zenhan/bin64/zenhan.exe
sudo mv zenhan/bin64/zenhan.exe /usr/local/bin/zenhan
rm -rf zenhan.zip zenhan

mkdir -p ${ZDOTDIR:-$HOME}/.config/nvim
ln -sfv ${DOTFILES_ROOT}/neovim/init.vim ${ZDOTDIR:-$HOME}/.config/nvim/init.vim
