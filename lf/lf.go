package lf

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.CreateSymlink("./lf/lfrc", "~/.config/lf/lfrc")
}
