package btop

import "github.com/sijiaoh/dotfiles/utils"

func Setup() error {
	utils.SnapInstall("btop")
	utils.BrewInstall("btop")
	return nil
}
