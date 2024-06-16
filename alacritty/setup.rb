require_relative "../src/utils"

if Utils.wsl?
  target_dir = File.join Utils.windows_appdata_dir, "alacritty"

  FileUtils.mkdir_p target_dir
  FileUtils.cp "alacritty/alacritty.toml", target_dir
  FileUtils.cp "alacritty/dracula.toml", target_dir
  FileUtils.cp "alacritty/wsl.lnk", target_dir
end
