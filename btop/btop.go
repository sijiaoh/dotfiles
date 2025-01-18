package btop

import "github.com/sijiaoh/dotfiles/utils"

func Setup() error {
	if err := utils.SnapInstall("btop"); err != nil {
		return err
	}
	if err := utils.BrewInstall("btop"); err != nil {
		return err
	}
	return nil
}
