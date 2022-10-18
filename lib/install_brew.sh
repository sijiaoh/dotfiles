. ${DOTFILES_ROOT}/lib/os.sh

if test ${OS} = "macos"; then
  SUDO=1
fi
NONINTERACTIVE=1 /bin/bash -c "$(${SUDO:+sudo} curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
