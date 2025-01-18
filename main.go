package main

import (
	"github.com/sijiaoh/dotfiles/alacritty"
	"github.com/sijiaoh/dotfiles/lazygit"
)

func main() {
	setups := []func() error{
		lazygit.Setup,
		alacritty.Setup,
	}

	for _, setup := range setups {
		if err := setup(); err != nil {
			panic(err)
		}
	}
}
