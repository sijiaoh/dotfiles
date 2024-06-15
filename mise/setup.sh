#!/bin/bash

set -eu

curl https://mise.run | sh
eval "$(~/.local/bin/mise activate $(basename ${SHELL}))"

cd ${DOTFILES_ROOT}
mise install
