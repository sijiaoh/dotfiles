# Disable --git option for aarch64.
# TODO: Always enable --git option.
# https://github.com/eza-community/eza/issues/1060
if uname -m | grep -vq aarch64; then
  GIT_OPTS='--git'
fi
alias ls="eza --group-directories-first --icons ${GIT_OPTS}"

alias llbase='ls --long --header --icons=always --color=always'
alias ll='llbase L'
alias la='llbase --all L'

alias ltbase='llbase --tree --level=2'
alias lt='ltbase L'
alias lta='ltbase --all L'

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

function chpwd() {
  ls
}
