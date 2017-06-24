#!/bin/bash -eu

RUBY_VERSION=2.4.1

brew install rbenv
rbenv install --skip-existing ${RUBY_VERSION}
rbenv global ${RUBY_VERSION}

eval "$(rbenv init -)"

gem install bundle
gem install google-ime-skk
