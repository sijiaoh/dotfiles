#!/bin/bash -eu

curl https://mise.run | sh
export PATH="$HOME/.local/share/mise/shims:$PATH"
