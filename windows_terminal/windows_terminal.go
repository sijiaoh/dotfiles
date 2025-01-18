package windows_terminal

import (
	"path"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if !utils.IsWsl() {
		return
	}
	from := "./windows_terminal/settings.json"
	to := path.Join(utils.WindowsHomeDir(), "AppData/Local/Microsoft/Windows Terminal/settings.json")
	utils.CopyFileTo(from, to)
}
