alias devcreate='cp -rf ~/.dotfiles/devcontainer .devcontainer'

function devup() {
  pkill -f autossh
  local forward_ports=$(cat .devcontainer/forward_ports)

  for port in $=forward_ports; do
    if nc -z localhost $port; then
      echo "Local port $port is already in use"
      return 1
    fi
    autossh -M 0 -f -N -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -L localhost:${port}:localhost:${port} -p 2222 vscode@localhost
  done

  local reverse_ports=$(cat .devcontainer/reverse_ports)
  for port in $=reverse_ports; do
    autossh -M 0 -f -N -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -R localhost:${port}:localhost:${port} -p 2222 vscode@localhost
  done

  devcontainer up --workspace-folder=. --dotfiles-repository=git@github.com:sijiaoh/dotfiles.git --dotfiles-target-path='~/.dotfiles' --dotfiles-install-command=bootstrap $@
}

alias devreset='devup --remove-existing-container'
alias devin='devcontainer exec --remote-env SHELL=/usr/bin/zsh --workspace-folder=. zsh'
