#!/bin/bash -eu

rm -f /usr/local/bin/ctags
brew unlink ctags
brew link ctags
