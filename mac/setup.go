package mac

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.BrewCaskInstall("scroll-reverser")
	utils.BrewCaskInstall("1password")

	// To disable cursor blinking in Firefox, set `ui.caretBlinkTime` to `0` in `about:config`.
	utils.BrewCaskInstall("firefox")

	if utils.IsMac() {
		// Disable cursor blinking.
		utils.MustExecCommand("defaults write -g NSTextInsertionPointBlinkPeriodOn -float 999999")
		utils.MustExecCommand("defaults write -g NSTextInsertionPointBlinkPeriodOff -float 1")

		// Enable key repeat.
		utils.MustExecCommand("defaults write -g ApplePressAndHoldEnabled -bool false")
		utils.MustExecCommand("defaults write -g InitialKeyRepeat -int 20")
		utils.MustExecCommand("defaults write -g KeyRepeat -int 3")
	}
}
