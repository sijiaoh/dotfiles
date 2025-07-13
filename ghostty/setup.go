package ghostty

import (
	"os"
	"strings"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsMac() {
		utils.BrewCaskInstall("ghostty")

		fileByte, err := os.ReadFile(utils.ExpandPath("./ghostty/config"))
		if err != nil {
			panic(err)
		}

		newFile := strings.ReplaceAll(string(fileByte), "./", utils.DotfilesRoot()+"/")
		newFileByte := []byte(newFile)

		utils.MkdirP("~/Library/Application Support/com.mitchellh.ghostty/")
		os.WriteFile(utils.ExpandPath("~/Library/Application Support/com.mitchellh.ghostty/config"), newFileByte, 0644)
	}
}
