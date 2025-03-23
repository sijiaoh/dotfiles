package karabiner

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.BrewCaskInstall("karabiner-elements")

	// IME Helper
	// Mac has a bug when change ime
	utils.BrewTap("laishulu/homebrew")
	utils.BrewInstall("macism")

	if utils.IsMac() {
		utils.CreateSymlink("./karabiner/karabiner.json", "~/.config/karabiner/karabiner.json")
	}
}
