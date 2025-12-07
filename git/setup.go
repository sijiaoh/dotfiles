package git

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/sijiaoh/dotfiles/utils"
)

func Setup() {
	if utils.IsLinux() {
		utils.MustExecCommand("sudo curl -fL --output /usr/local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo")
		utils.MustExecCommand("sudo chmod +x /usr/local/bin/git-filter-repo")
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
	version := "0.16.5"
	arch := "x86_64"
	if utils.IsArm64() {
		arch = "aarch64"
	}

	// /tmpを使用して一時ファイルを配置
	tmpDir, err := os.MkdirTemp("", "delta-install-")
	if err != nil {
		panic(err)
	}
	defer os.RemoveAll(tmpDir)

	tarName := fmt.Sprintf("delta-%s-%s-unknown-linux-musl.tar.gz", version, arch)
	tarPath := filepath.Join(tmpDir, tarName)
	downloadURL := fmt.Sprintf("https://github.com/dandavison/delta/releases/download/%s/%s", version, tarName)

	// -f オプションで404時に失敗させる
	utils.MustExecCommand(fmt.Sprintf("curl -fL %s -o %s", downloadURL, tarPath))

	// tmpDir内に展開
	utils.MustExecCommand(fmt.Sprintf("tar -xzf %s -C %s", tarPath, tmpDir))

	// 展開されたディレクトリ名
	extractedDir := filepath.Join(tmpDir, fmt.Sprintf("delta-%s-%s-unknown-linux-musl", version, arch))
	deltaBinary := filepath.Join(extractedDir, "delta")

	utils.MustExecCommand(fmt.Sprintf("sudo mv %s /usr/local/bin/delta", deltaBinary))
	utils.MustExecCommand("sudo chmod +x /usr/local/bin/delta")
}
