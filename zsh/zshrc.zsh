export DOTFILES_ROOT=$(cat ${HOME}/.dotfiles_root)

export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH=${DOTFILES_ROOT}/bin:${PATH}

# Python pip will install scripts to ~/.local/bin when --user option is specified.
export PATH=${HOME}/.local/bin:${PATH}

. ${DOTFILES_ROOT}/lib/os.sh

if test ${OS} = "macos"; then
  . ${DOTFILES_ROOT}/lib/brew_path.sh
fi

# 256 color support.
export TERM=xterm-256color
export COLORTERM=truecolor

# Source Prezto.
# brew のパスを通してからでないと tmux が自動で立ち上がらない。
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# `mise activate`が推奨だが、スクリプト実行時にもmiseを動かすにはshimsを使用する必要がある。
# https://mise.jdx.dev/dev-tools/shims.html
export PATH="$HOME/.local/share/mise/shims:$PATH"

if type "direnv" >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

export GOPATH=${HOME}/work/go
export PATH=${GOPATH}/bin:${PATH}

if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g X='| xargs'
alias -g XG='| xargs grep'
alias GF='find . -type f | xargs grep'

alias cdr='cd $(git rev-parse --show-toplevel)'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

bindkey '^[h' backward-kill-word

source ${DOTFILES_ROOT}/nvim/nvim.zsh
source ${DOTFILES_ROOT}/fzf/fzf.zsh
source ${DOTFILES_ROOT}/eza/eza.zsh
source ${DOTFILES_ROOT}/zoxide/zoxide.zsh
source ${DOTFILES_ROOT}/bat/bat.zsh

function estart() {
  if ! emacsclient -e 0 >/dev/null 2>&1; then
    cd >/dev/null 2>&1
    emacs &
    cd - >/dev/null 2>&1
  fi
}

alias e='emacsclient --no-wait'

function macvim() {
  if [ ! -e ${1} ]; then
    touch ${1}
  fi
  open -a MacVim ${1}
}
alias m='macvim'

alias b='bundle'
compdef b='bundle'
alias be='bundle exec'
alias bi='bundle install'

alias g='git'
compdef g='git'
alias lg='lazygit'

alias ex='explorer.exe'

# utilities

# Use to change owner of files created in docker to current user.
# Run this command before git add because you need to change owner of directories.
function chown_git_status_files() {
  sudo chown -R $(whoami):$(whoami) $(git status -s | awk '{print $2}')
}

function docker_stop_all() {
  docker ps -aq | xargs docker stop
}

# Speed up tab completion in wsl2.
unsetopt PATH_DIRS

source ${DOTFILES_ROOT}/devcontainer/devcontainer.zsh

if [ -f "${HOME}/.zshrc.local" ]; then source "${HOME}/.zshrc.local"; fi

source ${DOTFILES_ROOT}/zsh/proxy.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use cute prompt.
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION="(#'-'%)/"
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='(#;-;%)\\'
autoload -Uz colors
colors
SPROMPT="%{$fg[blue]%}%{$suggest%}(#'o'%)? < もしかして %B%r%b %{$fg[blue]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

# Enable rbenv prompt.
typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=true

# Tiling window manager.
if test ${OS} = "macos"; then
  . ${DOTFILES_ROOT}/yabai/yabai.zsh
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kiyoshi_ou/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
