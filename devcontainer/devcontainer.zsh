alias devcreate='cp -rf ~/.dotfiles/devcontainer .devcontainer'

function devup() {
  pkill -f autossh
  local ports=$(cat .devcontainer/forward_ports)

  for port in $=ports; do
    if nc -z localhost $port; then
      echo "Port $port is already in use"
      return 1
    fi
    autossh -M 0 -f -N -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -L ${port}:localhost:${port} -p 2222 vscode@localhost
  done

  devcontainer up --workspace-folder=. --dotfiles-repository=git@github.com:sijiaoh/dotfiles.git --dotfiles-target-path='~/.dotfiles' --dotfiles-install-command=bootstrap $@
}

alias devreset='devup --remove-existing-container'
alias devin='devcontainer exec --workspace-folder=. zsh'
