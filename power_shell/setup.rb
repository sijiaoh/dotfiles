if Utils.wsl?
  Utils.exec "powershell.exe -Command Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"

  to = File.join(
    Utils.windows_home_dir,
    "Documents/WindowsPowerShell/Profile.ps1"
  )
  Utils.cp "power_shell/Profile.ps1", to
end
