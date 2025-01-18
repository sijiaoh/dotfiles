package git

import (
	"fmt"
	"path"
	"strings"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsLinux() {
		utils.MustExecCommand("sudo curl --output /usr/local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo")
	}
	utils.BrewInstall("git-filter-repo")

	utils.AutoInstall("git-lfs")
	utils.MustExecCommand("sudo git lfs install --system")

	if utils.IsLinux() {
		installLinuxDelta()
	} else {
		utils.BrewInstall("git-delta")
	}

	if utils.IsWsl() {
		utils.CopyFileTo("./git/.gitconfig", utils.WindowsHomeDir())
	}
}

func installLinuxDelta() {
	deltaTarPath := utils.ExpandPath("./delta-0.16.5-x86_64-unknown-linux-musl.tar.gz")
	utils.MustExecCommand("curl -L https://github.com/dandavison/delta/releases/download/0.16.5/delta-0.16.5-x86_64-unknown-linux-musl.tar.gz -o " + deltaTarPath)
	defer utils.MustExecCommand("rm -rf " + deltaTarPath)

	utils.MustExecCommand("tar -xvf " + deltaTarPath)
	deltaDirPath := utils.ExpandPath("./" + strings.TrimSuffix(deltaTarPath, ".tar.gz"))
	defer utils.MustExecCommand("rm -rf " + deltaDirPath)

	utils.MustExecCommand(fmt.Sprintf("sudo mv %s /usr/local/bin", path.Join(deltaDirPath, "delta")))
}
