# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

if test ${OS} = 'macos'; then
  export ANDROID_HOME=/usr/local/Caskroom/android-sdk/$(brew cask info android-sdk | head -1 | tr ' ' '\n' | tail -1)
fi
