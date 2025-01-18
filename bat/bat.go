package bat

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.AutoInstall("bat")
	utils.CreateSymlink("./bat/config", "~/.config/bat/config")
}
