if Utils.wsl?
  to = File.join(
    Utils.windows_home_dir,
    "AppData/Local/Microsoft/Windows Terminal/settings.json"
  )
  FileUtils.cp "windows_terminal/settings.json", to
end
