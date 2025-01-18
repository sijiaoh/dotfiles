package bat

import "github.com/sijiaoh/dotfiles/utils"

func Setup() error {
	if err := utils.AutoInstall("bat"); err != nil {
		return err
	}
	if err := utils.CreateSymlink("bat/config", "~/.config/bat/config"); err != nil {
		return err
	}

	return nil
}
