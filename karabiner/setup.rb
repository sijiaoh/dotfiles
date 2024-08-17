Utils.brew_install "karabiner-elements", cask: true
Utils.create_symlink "karabiner/karabiner.json", "~/.config/karabiner/karabiner.json" if Utils.macos?
