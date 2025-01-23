package utils

import (
	"fmt"
	"os"
	"runtime"
	"strings"
)

func IsCommandExist(command string) bool {
	_, err := ExecCommand("which " + command)
	return err == nil
}

func IsMac() bool {
	return runtime.GOOS == "darwin"
}

func IsLinux() bool {
	return runtime.GOOS == "linux"
}

func IsAmd64() bool {
	return runtime.GOARCH == "amd64"
}

func IsArm64() bool {
	return runtime.GOARCH == "arm64"
}

func IsWsl() bool {
	if !IsLinux() {
		return false
	}

	output, err := ExecCommand("uname -a")
	if err != nil {
		panic(err)
	}

	return strings.Contains(string(output.Stdout), "microsoft")
}

func IsDevContainer() bool {
	return os.Getenv("REMOTE_CONTAINERS") == "true"
}

func AutoInstall(pkg string) {
	AptInstall(pkg)
	BrewInstall(pkg)
}

func AptInstall(pkg string) {
	if !IsLinux() {
		return
	}
	_, err := ExecCommand(fmt.Sprintf("sudo apt install -y %s", pkg))
	if err != nil {
		panic(err)
	}
}

func SnapInstall(pkg string) {
	if !IsCommandExist("snap") {
		return
	}
	_, err := ExecCommand(fmt.Sprintf("sudo snap install %s", pkg))
	if err != nil {
		panic(err)
	}
}

func BrewTap(fomula string) {
	if !IsMac() {
		return
	}
	_, err := ExecCommand(fmt.Sprintf("brew tap %s", fomula))
	if err != nil {
		panic(err)
	}
}

func BrewInstall(pkg string) {
	if !IsMac() {
		return
	}
	output, err := ExecCommand(fmt.Sprintf("brew install %s", pkg))
	if err != nil && !strings.Contains(output.Stderr, "already installed") {
		panic(err)
	}
}

func BrewCaskInstall(pkg string) {
	if !IsMac() {
		return
	}
	output, err := ExecCommand(fmt.Sprintf("brew install --cask %s", pkg))
	if err != nil && !strings.Contains(output.Stderr, "already installed") {
		panic(err)
	}
}
