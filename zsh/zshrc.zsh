export EDITOR='emacsclient'

export DOTFILES_ROOT=$(cat ${HOME}/.dotfiles_root)

. ${DOTFILES_ROOT}/lib/os.sh

export PATH=/usr/local/sbin:/usr/local/bin:${PATH}

# brew
if test ${OS} = 'linux'; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:${MANPATH}"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH}"
fi

# Source Prezto.
# brew のパスを通してから出ないと tmux が自動で立ち上がらない
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

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
alias GF='find . -type f | xargs grep'

bindkey '^[h' backward-kill-word

source ${DOTFILES_ROOT}/zsh/fzf.zsh

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

function macvim() {
  if [ ! -e ${1} ]; then
    touch ${1}
  fi
  open -a MacVim ${1}
}
alias m='macvim'
