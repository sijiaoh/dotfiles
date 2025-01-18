package btop

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.SnapInstall("btop")
	utils.BrewInstall("btop")
}
