package bat

import "github.com/sijiaoh/dotfiles/utils"

func Setup() error {
	utils.AutoInstall("bat")
	utils.CreateSymlink("bat/config", "~/.config/bat/config")
	return nil
}
