package main

import (
	"github.com/sijiaoh/dotfiles/alacritty"
	"github.com/sijiaoh/dotfiles/bat"
	"github.com/sijiaoh/dotfiles/btop"
	"github.com/sijiaoh/dotfiles/eza"
	"github.com/sijiaoh/dotfiles/fzf"
	"github.com/sijiaoh/dotfiles/karabiner"
	"github.com/sijiaoh/dotfiles/lazygit"
	"github.com/sijiaoh/dotfiles/lf"
	"github.com/sijiaoh/dotfiles/mac"
	"github.com/sijiaoh/dotfiles/windows_terminal"
	"github.com/sijiaoh/dotfiles/yabai"
	"github.com/sijiaoh/dotfiles/zoxide"
)

func main() {
	setups := []func(){
		alacritty.Setup,
		bat.Setup,
		btop.Setup,
		eza.Setup,
		fzf.Setup,
		karabiner.Setup,
		lazygit.Setup,
		lf.Setup,
		mac.Setup,
		windows_terminal.Setup,
		yabai.Setup,
		zoxide.Setup,
	}

	for _, setup := range setups {
		setup()
	}
}
