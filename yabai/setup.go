package yabai

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.BrewInstall("jq")
	utils.BrewInstall("koekeishiya/formulae/yabai")
	utils.BrewInstall("koekeishiya/formulae/skhd")

	// https://github.com/FelixKratz/JankyBorders
	utils.BrewTap("FelixKratz/formulae")
	utils.BrewInstall("borders")
}
