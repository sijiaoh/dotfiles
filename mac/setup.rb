Utils.brew_install "1password", cask: true
Utils.brew_install "google-chrome", cask: true
Utils.brew_install "visual-studio-code", cask: true

# To disable cursor blinking in Firefox, set `ui.caretBlinkTime` to `0` in `about:config`.
Utils.brew_install "firefox", cask: true

if Utils.macos?
  # Disable cursor blinking.
  Utils.exec "defaults write -g NSTextInsertionPointBlinkPeriodOn -float 999999"
  Utils.exec "defaults write -g NSTextInsertionPointBlinkPeriodOff -float 1"

  # Enable key repeat.
  Utils.exec "defaults write -g ApplePressAndHoldEnabled -bool false"
  Utils.exec "defaults write -g InitialKeyRepeat -int 20"
  Utils.exec "defaults write -g KeyRepeat -int 3"
end
