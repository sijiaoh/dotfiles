package lazydocker

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	if utils.IsLinux() {
		utils.MustExecCommand("./lazydocker/linux.sh")
	}
}
