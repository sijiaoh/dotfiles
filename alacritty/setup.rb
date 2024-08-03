if Utils.wsl?
  target_dir = File.join Utils.windows_appdata_dir, "alacritty"

  FileUtils.mkdir_p target_dir
  Utils.cp "alacritty/alacritty.toml", target_dir
  Utils.cp "alacritty/dracula.toml", target_dir
  Utils.cp "alacritty/wsl.lnk", target_dir
end

Utils.brew_install "alacritty", cask: true

Utils.create_symlink "alacritty", "~/.config/alacritty"
