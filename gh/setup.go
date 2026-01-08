package gh

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	if utils.IsLinux() {
		utils.ExecScript("./gh/linux.sh")
	} else {
		utils.BrewInstall("gh")
	}
}
