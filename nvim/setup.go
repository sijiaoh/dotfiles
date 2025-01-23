package nvim

import (
	"fmt"
	"strings"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsLinux() && utils.IsAmd64() {
		tarPath := "./nvim-linux64.tar.gz"
		dirPath := strings.TrimSuffix(tarPath, ".tar.gz")
		tarUrl := "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"

		utils.MustExecCommand(fmt.Sprintf("curl -L %s -o %s", tarUrl, tarPath))
		defer utils.MustExecCommand("rm -f " + tarPath)

		utils.MustExecCommand("tar -xf " + tarPath)
		defer utils.MustExecCommand("rm -rf " + dirPath)

		utils.MustExecCommand(fmt.Sprintf("sudo install %s/bin/nvim /usr/local/bin/nvim", dirPath))
		utils.MustExecCommand(fmt.Sprintf("sudo cp -R %s/lib /usr/local/", dirPath))
		utils.MustExecCommand(fmt.Sprintf("sudo cp -R %s/share /usr/local/", dirPath))
	} else if utils.IsLinux() && utils.IsArm64() {
		utils.AptInstall("ninja-build gettext cmake curl build-essential")
		utils.GitClone("https://github.com/neovim/neovim", "/tmp/neovim")
		defer utils.MustExecCommand("rm -rf /tmp/neovim")
		utils.MustExecCommand("cd /tmp/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install")
	} else {
		utils.BrewInstall("nvim")
	}

	// Use xclip to sync system clipboard with neovim clipboard.
	utils.AptInstall("xclip")

	utils.AutoInstall("gcc")
	utils.AptInstall("g++")
	utils.CreateSymlink("./nvim/lazyvim", "~/.config/nvim")
}
