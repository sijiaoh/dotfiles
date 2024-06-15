#!/bin/bash

set -eu

curl https://mise.run | sh
eval "$(~/.local/bin/mise activate $(basename ${SHELL}))"

cd ${DOTFILES_ROOT}
mise install

# Ruby build required.
if test ${OS} = "linux"; then
  # From: https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
  sudo apt install -y autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
else
  # From: https://github.com/rbenv/ruby-build/wiki#macos
  brew install openssl@3 readline libyaml gmp
fi
