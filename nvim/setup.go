package nvim

import (
	"fmt"
	"strings"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsLinux() && utils.IsAmd64() {
		tarPath := "./nvim-linux-x86_64.tar.gz"
		dirPath := strings.TrimSuffix(tarPath, ".tar.gz")
		tarUrl := "https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz"

		utils.MustExecCommand(fmt.Sprintf("curl -L %s -o %s", tarUrl, tarPath))
		defer utils.MustExecCommand("rm -f " + tarPath)

		utils.MustExecCommand("tar -xf " + tarPath)
		defer utils.MustExecCommand("rm -rf " + dirPath)

		utils.MustExecCommand(fmt.Sprintf("sudo install %s/bin/nvim /usr/local/bin/nvim", dirPath))
		utils.MustExecCommand(fmt.Sprintf("sudo cp -R %s/lib /usr/local/", dirPath))
		utils.MustExecCommand(fmt.Sprintf("sudo cp -R %s/share /usr/local/", dirPath))
	} else if utils.IsLinux() && utils.IsArm64() {
		utils.AptInstall("ninja-build gettext cmake curl build-essential")
		utils.GitClone(
			"https://github.com/neovim/neovim",
			"/tmp/neovim",
			&utils.GitCloneOptions{
				Tag:   utils.ToStringPtr("v0.10.4"),
				Depth: utils.ToIntPtr(1),
			},
		)
		defer utils.MustExecCommand("rm -rf /tmp/neovim")
		utils.MustExecCommand("cd /tmp/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install")
	} else {
		tarPath := "./nvim-macos-arm64.tar.gz"
		dirPath := strings.TrimSuffix(tarPath, ".tar.gz")
		tarUrl := "https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-macos-arm64.tar.gz"

		utils.MustExecCommand(fmt.Sprintf("curl -L --output %s %s", tarPath, tarUrl))
		defer utils.MustExecCommand("rm -f " + tarPath)

		utils.MustExecCommand("xattr -c " + tarPath)
		utils.MustExecCommand("tar xzvf " + tarPath)
		defer utils.MustExecCommand("rm -rf " + dirPath)

		utils.MustExecCommand(fmt.Sprintf("sudo cp %s/bin/nvim /usr/local/bin/nvim", dirPath))
		utils.MustExecCommand(fmt.Sprintf("sudo cp -R %s/lib /usr/local/", dirPath))
		utils.MustExecCommand(fmt.Sprintf("sudo cp -R %s/share /usr/local/", dirPath))
	}

	// Use xclip to sync system clipboard with neovim clipboard.
	utils.AptInstall("xclip")

	utils.AutoInstall("gcc")

	// For lua language server packages.
	utils.AptInstall("unzip")

	// For vim snacks picker
	utils.AptInstall("ripgrep")
	utils.BrewInstall("rg")

	// For vim snacks explorer
	utils.BrewInstall("fd")
	utils.AptInstall("fd-find")

	utils.AptInstall("g++")
	utils.CreateSymlink("./nvim/lazyvim", "~/.config/nvim")
}
