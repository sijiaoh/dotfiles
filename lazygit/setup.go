package lazygit

import (
	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsLinux() {
		utils.ExecScript("./lazygit/linux.sh")
	} else {
		utils.BrewInstall("lazygit")
	}

	if utils.IsLinux() {
		utils.CreateSymlink("./lazygit/config.yml", "~/.config/lazygit/config.yml")
	} else {
		utils.CreateSymlink("./lazygit/config.yml", "~/Library/Application\\ Support/lazygit/config.yml")
	}
}
