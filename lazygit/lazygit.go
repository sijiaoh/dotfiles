package lazygit

import (
	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() error {
	if err := utils.BrewInstall("lazygit"); err != nil {
		return err
	}

	if utils.IsLinux() {
		if err := utils.CreateSymlink("lazygit/config.yml", "~/.config/lazygit/config.yml"); err != nil {
			return err
		}
	} else {
		if err := utils.CreateSymlink("lazygit/config.yml", "~/Library/Application Support/lazygit/config.yml"); err != nil {
			return err
		}
	}

	return nil
}
