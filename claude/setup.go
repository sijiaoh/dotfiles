package claude

import "github.com/sijiaoh/dotfiles/utils"

func Setup() {
	if !utils.IsCommandExist("claude") {
		utils.MustExecCommand("curl -fsSL https://claude.ai/install.sh | bash")
	}

	utils.CreateSymlink("./claude/settings.json", "~/.claude/settings.json")
}
