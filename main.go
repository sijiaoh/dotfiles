package main

import (
	"github.com/sijiaoh/dotfiles/alacritty"
	"github.com/sijiaoh/dotfiles/bat"
	"github.com/sijiaoh/dotfiles/lazygit"
)

func main() {
	setups := []func() error{
		alacritty.Setup,
		bat.Setup,
		lazygit.Setup,
	}

	for _, setup := range setups {
		if err := setup(); err != nil {
			panic(err)
		}
	}
}
