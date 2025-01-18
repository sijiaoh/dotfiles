package zsh

import (
	"fmt"
	"path"
	"strings"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	zpreztoRoot := utils.ExpandPath("~/.zprezto")
	utils.AutoInstall("zsh")
	output, err := utils.ExecCommand("git clone https://github.com/sorin-ionescu/prezto.git " + zpreztoRoot)
	if err != nil && !strings.Contains(output.Stderr, "already exists") {
		panic(err)
	}

	command := fmt.Sprintf("find %s -type f -not -name README.md", path.Join(zpreztoRoot, "runcoms"))
	output, err = utils.ExecCommand(command)
	if err != nil {
		panic(err)
	}
	runcomsStr := output.Stdout
	runcoms := strings.Split(runcomsStr, "\n")
	for _, runcom := range runcoms {
		if runcom == "" {
			continue
		}
		utils.CreateSymlink(runcom, path.Join("~", "."+path.Base(runcom)))
	}

	utils.CreateSymlink("./zsh/zshrc.zsh", "~/.zshrc")
	utils.CreateSymlink("./zsh/p10k.zsh", "~/.p10k.zsh")
	utils.CreateSymlink("./zsh/zpreztorc.zsh", "~/.zpreztorc")
}
