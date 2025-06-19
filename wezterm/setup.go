package wezterm

import (
	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	utils.BrewCaskInstall("wezterm")
}
