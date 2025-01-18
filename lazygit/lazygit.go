package lazygit

import (
	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() error {
	if err := utils.BrewInstall("lazygit"); err != nil {
		return err
	}

	if utils.IsLinux() {
		utils.CreateSymlink("lazygit/config.yml", "~/.config/lazygit/config.yml")
	} else {
		utils.CreateSymlink("lazygit/config.yml", "~/Library/Application Support/lazygit/config.yml")
	}

	return nil
}
