package fzf

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.AutoInstall("fzf")
	utils.AutoInstall("coreutils")
}
