if Utils.wsl?
  target_dir = File.join Utils.windows_appdata_dir, "alacritty"

  Utils.cp "alacritty/alacritty.toml", target_dir
  Utils.cp "alacritty/dracula.toml", target_dir
  Utils.cp "alacritty/wsl.lnk", target_dir
end
