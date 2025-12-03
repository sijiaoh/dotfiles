package tmux

import (
	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	utils.BrewInstall("tmux")

	if utils.IsLinux() {
		utils.AptInstall("libevent-dev ncurses-dev build-essential bison pkg-config")

		tarPath := "./tmux.tar.gz"
		utils.DownloadFile("https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz", tarPath)
		defer utils.RemoveFileOrDirectory(tarPath)

		utils.MustExecCommand("tar -zxf tmux.tar.gz")
		defer utils.RemoveFileOrDirectory("tmux-*")

		utils.MustExecCommand("cd tmux-* && ./configure")
		utils.MustExecCommand("cd tmux-* && make && sudo make install")
	}

	// TPM (Tmux Plugin Manager)
	tpmPath := utils.ExpandPath("~/.tmux/plugins/tpm")
	utils.GitClone("https://github.com/tmux-plugins/tpm", tpmPath, nil)
}
