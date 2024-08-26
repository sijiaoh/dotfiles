if command -v batcat &>/dev/null; then
  alias cat='batcat --style=default'
else
  alias cat='bat --style=default'
fi
alias less='bat'

export PAGER='bat'
