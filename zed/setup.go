package zed

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.BrewCaskInstall("zed")

	utils.CreateSymlink("./zed/settings.json", "~/.config/zed/settings.json")
	utils.CreateSymlink("./zed/keymap.json", "~/.config/zed/keymap.json")
}
