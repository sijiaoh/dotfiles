# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR='nvim'

export DOTFILES_ROOT=$(cat ${HOME}/.dotfiles_root)

. ${DOTFILES_ROOT}/lib/os.sh

export PATH=/usr/local/sbin:/usr/local/bin:${PATH}

# brew
if test ${OS} = 'linux'; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:${MANPATH}"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH}"
fi

eval "$(rbenv init -)"

if [ $(which pyenv) ]; then
  export PATH=$(pyenv root)/shims:${PATH}
fi

eval "$(direnv hook zsh)"

export GOPATH=${HOME}/work/go
export PATH=${GOPATH}/bin:${PATH}

if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

function chpwd() { ls }

alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g X='| xargs'
alias -g XG='| xargs grep'

bindkey '^[h' backward-kill-word

export FZF_DEFAULT_OPTS="--bind 'ctrl-k:kill-line'"

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && eval "emacsclient --no-wait ${files[@]}"
}

fv() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && eval "nvim ${files[@]}"
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf-tmux +m) &&
    cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux +m) && cd "$dir"
}

fdd() {
  local dir
  dir=$(${DOTFILES_ROOT}/bin/list_parent_directories | fzf-tmux +m) &&
    cd "$dir"
}

fge() {
  local file

  file="$(git grep --line-number $@ | fzf-tmux -0 -1 | awk -F: '{print "+" $2 " ./" $1}')"

  if [[ -n $file ]]
  then
    emacsclient --no-wait $(echo $file)
  fi
}

fgv() {
  local file

  file="$(ag --nobreak --noheading $@ | fzf-tmux -0 -1 | awk -F: '{print $1 " +" $2}')"

  if [[ -n $file ]]
  then
    nvim $file
  fi
}

alias a='atom'

function estart() {
  if ! emacsclient -e 0 > /dev/null 2>&1; then
    cd > /dev/null 2>&1
    emacs&
    cd - > /dev/null 2>&1
  fi
}

alias e='emacsclient --no-wait'
alias v='nvim'
