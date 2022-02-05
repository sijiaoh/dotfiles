if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv export zsh)"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR='vim'

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

if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

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

alias cdr='cd $(git rev-parse --show-toplevel)'

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
