alias ls='eza --group-directories-first --icons --git'
alias ltbase='ls --tree --level=2 --long --header --color=always'
alias lt='ltbase | cat --plain'
alias lta='ltbase --all | cat --plain'

function chpwd() {
  ls
}
