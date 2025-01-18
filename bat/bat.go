package bat

import "github.com/sijiaoh/dotfiles/utils"

func Setup() error {
	if err := utils.AutoInstall("bat"); err != nil {
		return err
	}
	utils.CreateSymlink("bat/config", "~/.config/bat/config")
	return nil
}
