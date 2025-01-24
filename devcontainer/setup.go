package devcontainer

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	utils.BrewInstall("devcontainer")
	utils.BrewInstall("autossh")
}
