package main

import (
	"os"

	"github.com/sijiaoh/dotfiles/alacritty"
	"github.com/sijiaoh/dotfiles/bat"
	"github.com/sijiaoh/dotfiles/btop"
	"github.com/sijiaoh/dotfiles/eza"
	"github.com/sijiaoh/dotfiles/fzf"
	"github.com/sijiaoh/dotfiles/git"
	"github.com/sijiaoh/dotfiles/karabiner"
	"github.com/sijiaoh/dotfiles/lazydocker"
	"github.com/sijiaoh/dotfiles/lazygit"
	"github.com/sijiaoh/dotfiles/lf"
	"github.com/sijiaoh/dotfiles/mac"
	"github.com/sijiaoh/dotfiles/nvim"
	"github.com/sijiaoh/dotfiles/power_shell"
	"github.com/sijiaoh/dotfiles/tmux"
	"github.com/sijiaoh/dotfiles/utils"
	"github.com/sijiaoh/dotfiles/wezterm"
	"github.com/sijiaoh/dotfiles/windows_terminal"
	"github.com/sijiaoh/dotfiles/yabai"
	"github.com/sijiaoh/dotfiles/zed"
	"github.com/sijiaoh/dotfiles/zoxide"
	"github.com/sijiaoh/dotfiles/zsh"
)

type SetupFunc struct {
	Name  string
	Setup func()
}

func main() {
	args := os.Args[1:]

	setupFuncs := []SetupFunc{
		{"alacritty", alacritty.Setup},
		{"bat", bat.Setup},
		{"btop", btop.Setup},
		{"eza", eza.Setup},
		{"fzf", fzf.Setup},
		{"git", git.Setup},
		{"karabiner", karabiner.Setup},
		{"lazydocker", lazydocker.Setup},
		{"lazygit", lazygit.Setup},
		{"lf", lf.Setup},
		{"mac", mac.Setup},
		{"nvim", nvim.Setup},
		{"power_shell", power_shell.Setup},
		{"tmux", tmux.Setup},
		{"wezterm", wezterm.Setup},
		{"windows_terminal", windows_terminal.Setup},
		{"yabai", yabai.Setup},
		{"zed", zed.Setup},
		{"zoxide", zoxide.Setup},
		{"zsh", zsh.Setup},
	}

	for _, setupFunc := range setupFuncs {
		isNeedCall := len(args) == 0

		if !isNeedCall {
			for _, arg := range args {
				if setupFunc.Name == arg {
					isNeedCall = true
					break
				}
			}
		}

		if isNeedCall {
			setupFunc.Setup()
		}
	}

	utils.LinkDotfiles()
}
