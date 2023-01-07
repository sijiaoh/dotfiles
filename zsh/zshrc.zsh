export EDITOR='code'

export DOTFILES_ROOT=$(cat ${HOME}/.dotfiles_root)

export PATH=/usr/local/sbin:/usr/local/bin:${PATH}

. ${DOTFILES_ROOT}/lib/os.sh

if test ${OS} = "macos"; then
  . ${DOTFILES_ROOT}/lib/brew_path.sh
fi

# Source Prezto.
# brew のパスを通してから出ないと tmux が自動で立ち上がらない
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - zsh)"

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

alias b='bundle'
alias be='bundle exec'

# utilities

# Use to change owner of files created in docker to current user.
# Run this command before git add because you need to change owner of directories.
function chown_git_status_files() {
  sudo chown -R $(whoami):$(whoami) $(git status -s | awk '{print $2}')
}

# Speed up tab completion in wsl2.
unsetopt PATH_DIRS

if [ -f "${HOME}/.zshrc.local" ]; then source "${HOME}/.zshrc.local"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
