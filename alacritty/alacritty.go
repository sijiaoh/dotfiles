package alacritty

import (
	"os"
	"path"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	utils.BrewCaskInstall("alacritty")
	utils.CreateSymlink("alacritty", "~/.config/alacritty")

	if utils.IsWsl() {
		windowsAppDataDir := os.Getenv("APPDATA")
		targetDir := path.Join(windowsAppDataDir, "alacritty")
		utils.MkdirP(targetDir)

		files := []string{"alacritty/alacritty.toml", "alacritty/dracula.toml", "alacritty/wsl.lnk"}
		for _, file := range files {
			from := path.Join(utils.DotfilesRoot(), file)
			to := path.Join(targetDir, path.Base(file))
			utils.CopyFileTo(from, to)
		}
	}
}
