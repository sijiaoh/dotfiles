if command -v batcat &>/dev/null; then
  alias cat='batcat --style=auto'
  alias less='batcat'
else
  alias cat='bat --style=default'
  alias less='bat'
  export PAGER='bat'
fi
