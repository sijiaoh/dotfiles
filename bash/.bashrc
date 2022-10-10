export DOTFILES_ROOT=$(cat ${HOME}/.dotfiles_root)

. ${DOTFILES_ROOT}/lib/brew_path.sh

exec zsh -l
