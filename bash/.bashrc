export DOTFILES_ROOT=$(cat ${HOME}/.dotfiles_root)

. ${DOTFILES_ROOT}/lib/os.sh

if test ${OS} = "macos"; then
  . ${DOTFILES_ROOT}/lib/brew_path.sh
fi

exec zsh -l

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kiyoshi_ou/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
