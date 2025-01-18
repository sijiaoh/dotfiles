package alacritty

import (
	"path"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	utils.BrewCaskInstall("alacritty")
	utils.CreateSymlink("alacritty", "~/.config/alacritty")

	if utils.IsWsl() {
		targetDir := path.Join(utils.WindowsAppDataDir(), "alacritty")
		utils.MkdirP(targetDir)

		files := []string{"alacritty/alacritty.toml", "alacritty/dracula.toml", "alacritty/wsl.lnk"}
		for _, file := range files {
			from := path.Join(utils.DotfilesRoot(), file)
			to := path.Join(targetDir, path.Base(file))
			utils.CopyFileTo(from, to)
		}
	}
}
