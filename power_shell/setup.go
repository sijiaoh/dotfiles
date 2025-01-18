package power_shell

import (
	"path"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if !utils.IsWsl() {
		return
	}

	utils.MustExecCommand("powershell.exe -Command Set-ExecutionPolicy RemoteSigned -Scope CurrentUser")

	from := "./power_shell/Profile.ps1"
	to := path.Join(utils.WindowsHomeDir(), "Documents/WindowsPowerShell/Profile.ps1")
	utils.CopyFileTo(from, to)
}
