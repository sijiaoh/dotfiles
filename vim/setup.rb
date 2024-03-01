Utils.download_file "https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage"
Utils.exec "chmod +x nvim.appimage"
Utils.exec "./nvim.appimage --appimage-extract"
File.delete "nvim.appimage"
Utils.exec "sudo rm -rf /usr/local/lib/nvim && sudo mv squashfs-root /usr/local/lib/nvim"
Utils.exec "sudo ln -sf /usr/local/lib/nvim/usr/bin/nvim /usr/local/bin/nvim"

Utils.create_symlink "vim/init.lua", "~/.config/nvim/init.lua"
