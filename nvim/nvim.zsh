export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

alias v='nvim'
compdef v='nvim'

# Neovim with Godot integration
alias gv='nvim --listen /tmp/nvim-godot-server.pipe'
# Configure Godot
# Editor Settings... -> Text Editor -> External
# - Exec Path: /usr/local/bin/nvim
# - Exec Flags: --server /tmp/nvim-godot-server.pipe --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"
