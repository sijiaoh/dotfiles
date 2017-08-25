#!/bin/bash -eu

brew install emacs

if ! test -e ${HOME}/.emacs.d; then
  git clone https://github.com/regashia/emacs.d.git ${HOME}/.emacs.d
fi
