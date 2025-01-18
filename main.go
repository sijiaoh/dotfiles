package main

import (
	"github.com/sijiaoh/dotfiles/alacritty"
	"github.com/sijiaoh/dotfiles/bat"
	"github.com/sijiaoh/dotfiles/btop"
	"github.com/sijiaoh/dotfiles/lazygit"
)

func main() {
	setups := []func(){
		alacritty.Setup,
		bat.Setup,
		btop.Setup,
		lazygit.Setup,
	}

	for _, setup := range setups {
		setup()
	}
}
