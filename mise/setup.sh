#!/bin/bash -eu

curl https://mise.run | sh
eval "$(~/.local/bin/mise activate $(basename ${SHELL}))"
