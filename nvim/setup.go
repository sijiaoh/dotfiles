package nvim

import (
	"fmt"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsLinux() && !utils.IsDevContainer() {
		appImagePath := "./nvim.appimage"
		appImageUrl := "https://github.com/neovim/neovim/releases/download/v0.10.3/nvim.appimage"

		utils.MustExecCommand(fmt.Sprintf("curl -L %s -o %s", appImageUrl, appImagePath))
		defer utils.MustExecCommand("rm -f " + appImagePath)

		utils.MustExecCommand("chmod +x " + appImagePath)
		utils.MustExecCommand(appImagePath + " --appimage-extract")
		utils.MustExecCommand("sudo rm -rf /usr/local/lib/nvim && sudo mv squashfs-root /usr/local/lib/nvim")
		utils.MustExecCommand("sudo ln -sf /usr/local/lib/nvim/usr/bin/nvim /usr/local/bin/nvim")
	} else {
		utils.BrewInstall("nvim")
	}

	// Use xclip to sync system clipboard with neovim clipboard.
	utils.AptInstall("xclip")

	utils.AutoInstall("gcc")
	utils.AutoInstall("g++")
	utils.CreateSymlink("./nvim/lazyvim", "~/.config/nvim")
}
