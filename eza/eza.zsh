alias ls='eza --group-directories-first --icons --git'

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
