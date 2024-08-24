Utils.brew_install "zed", cask: true

Utils.create_symlink "zed/settings.json", "~/.config/zed/settings.json"
Utils.create_symlink "zed/keymap.json", "~/.config/zed/keymap.json"
