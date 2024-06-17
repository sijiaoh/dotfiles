if command -v batcat &>/dev/null; then
  alias cat=batcat
else
  alias cat=bat
fi
alias less=cat --plain
