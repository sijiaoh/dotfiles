export EDITOR='nvim --listen /tmp/nvim-server.pipe'
export VISUAL='nvim --listen /tmp/nvim-server.pipe'
export GIT_EDITOR='nvim --listen /tmp/nvim-server.pipe'

alias nvim='nvim --listen /tmp/nvim-server.pipe'
alias v='nvim --listen /tmp/nvim-server.pipe'
compdef v='nvim'

# Neovim with Godot integration
alias gv='/usr/local/bin/nvim --listen /tmp/nvim-godot-server.pipe'
# Configure Godot
# Editor Settings... -> Text Editor -> External
# - Exec Path: /usr/local/bin/nvim
# - Exec Flags: --server /tmp/nvim-godot-server.pipe --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"
