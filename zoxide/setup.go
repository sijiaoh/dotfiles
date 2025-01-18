package zoxide

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.MustExecCommand("curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh")
}
