package karabiner

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.BrewCaskInstall("karabiner-elements")
	if utils.IsMac() {
		utils.CreateSymlink("./karabiner/karabiner.json", "~/.config/karabiner/karabiner.json")
	}
}
