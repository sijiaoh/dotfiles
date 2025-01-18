package alacritty

import (
	"os"
	"path"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() error {
	if err := utils.BrewCaskInstall("alacritty"); err != nil {
		return err
	}
	utils.CreateSymlink("alacritty", "~/.config/alacritty")

	if utils.IsWsl() {
		windowsAppDataDir := os.Getenv("APPDATA")
		targetDir := path.Join(windowsAppDataDir, "alacritty")
		if err := utils.MkdirP(targetDir); err != nil {
			return err
		}

		files := []string{"alacritty/alacritty.toml", "alacritty/dracula.toml", "alacritty/wsl.lnk"}
		for _, file := range files {
			from := path.Join(utils.DotfilesRoot(), file)
			to := path.Join(targetDir, path.Base(file))
			if err := utils.CopyFileTo(from, to); err != nil {
				return err
			}
		}
	}

	return nil
}
