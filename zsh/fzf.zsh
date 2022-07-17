if [[ ${TERM} =~ "screen" ]] && [ -n ${TMUX} ]; then
  FZF_COMMAND="fzf-tmux"
else
  FZF_COMMAND="fzf"
fi

export FZF_DEFAULT_OPTS="--bind 'ctrl-k:kill-line'"

fe() {
  IFS=$'\n' files=($(${FZF_COMMAND} --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Find git diff.
fgd() {
  IFS=$'\n' files=($(git diff --name-only | ${FZF_COMMAND} --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | ${FZF_COMMAND} +m) &&
    cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | ${FZF_COMMAND} +m) && cd "$dir"
}

fdd() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | ${FZF_COMMAND})
  cd "$DIR"
}

fge() {
  local file

  file="$(git grep --line-number $@ | ${FZF_COMMAND} -0 -1 | awk -F: '{print "+" $2 " ./" $1}')"

  if [[ -n $file ]]
  then
    ${EDITOR:-vim} --no-wait $(echo $file)
  fi
}

fgv() {
  local file

  file="$(ag --nobreak --noheading $@ | ${FZF_COMMAND} -0 -1 | awk -F: '{print $1 " +" $2}')"

  if [[ -n $file ]]
  then
    nvim $(echo $file)
  fi
}
