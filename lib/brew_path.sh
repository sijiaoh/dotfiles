. ${DOTFILES_ROOT}/lib/os.sh

if test ${OS} = 'linux'; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:${MANPATH:-""}"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-""}"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
