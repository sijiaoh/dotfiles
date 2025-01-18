package eza

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	if utils.IsLinux() {
		utils.ExecScript("./eza/linux.sh")
	}
	utils.BrewInstall("eza")
}
