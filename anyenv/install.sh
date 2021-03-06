#!/bin/bash -eu

if [ ! -e ~/.anyenv ]; then
  git clone https://github.com/anyenv/anyenv ~/.anyenv
  ~/.anyenv/bin/anyenv install --force-init
fi

PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init)"

mkdir -p $(anyenv root)/plugins
if [ ! -e $(anyenv root)/plugins/anyenv-update ]; then
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi
