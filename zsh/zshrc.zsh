# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR="emacsclient -nw -a ''"

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

eval "$(direnv hook zsh)"

export GOPATH=${HOME}/work/go
export PATH=${GOPATH}/bin:${PATH}

function chpwd() { ls }

alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g X='| xargs'
alias -g XG='| xargs grep'

function estart() {
  if ! emacsclient -e 0 > /dev/null 2>&1; then
    pushd ${HOME} > /dev/null 2>&1
    emacs --daemon
    popd > /dev/null 2>&1
  fi
}

alias e="emacsclient -nw -a ''"
alias ekill="emacsclient -e '(kill-emacs)'"

estart
