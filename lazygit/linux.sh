#!/bin/bash -eu

cd lazygit

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

ARCH=$(uname -m)
if [ "$ARCH" = "aarch64" ]; then
  ARCH="arm64"
fi

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_${ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit.tar.gz lazygit
