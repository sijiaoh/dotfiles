if Utils.linux? && !Utils.dev_container?
  Utils.download_file "https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage"
  Utils.exec "chmod +x nvim.appimage"
  Utils.exec "./nvim.appimage --appimage-extract"
  File.delete "nvim.appimage"
  Utils.exec "sudo rm -rf /usr/local/lib/nvim && sudo mv squashfs-root /usr/local/lib/nvim"
  Utils.exec "sudo ln -sf /usr/local/lib/nvim/usr/bin/nvim /usr/local/bin/nvim"
else
  Utils.brew_install "nvim"
end

# Use xclip to sync system clipboard with neovim clipboard.
Utils.apt_install "xclip"

# Use LazyVim.
# Utils.auto_install "gcc g++"
# Utils.create_symlink "nvim/lazyvim", "~/.config/nvim"

# init.lua is a configuration file that works without LazyVim.
Utils.create_symlink "nvim/init.lua", "~/.config/nvim/init.lua"

# vscode-neovim.lua is a configuration file that works with VSCode.
# Utils.create_symlink "nvim/vscode-neovim.lua", "~/.config/nvim/init.lua"
