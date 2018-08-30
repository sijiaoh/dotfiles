#!/bin/bash -eu

if [ ! -e ~/.anyenv ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

anyenv install rbenv
anyenv install pyenv
anyenv install ndenv
