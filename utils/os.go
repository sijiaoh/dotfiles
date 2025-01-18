package utils

import (
	"os"
	"runtime"
	"strings"
)

func IsMac() bool {
	return runtime.GOOS == "darwin"
}

func IsLinux() bool {
	return runtime.GOOS == "linux"
}

func IsWsl() bool {
	if !IsLinux() {
		return false
	}

	output, err := ExecCommand("uname", "-a")
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
	_, err := ExecCommand("sudo", "apt", "install", pkg)
	if err != nil {
		panic(err)
	}
}

func SnapInstall(pkg string) {
	if !IsLinux() || IsDevContainer() {
		return
	}
	_, err := ExecCommand("sudo", "snap", "install", pkg)
	if err != nil {
		panic(err)
	}
}

func BrewInstall(pkg string) {
	if !IsMac() {
		return
	}
	output, err := ExecCommand("brew", "install", pkg)
	if err != nil && !strings.Contains(output.Stderr, "already installed") {
		panic(err)
	}
}

func BrewCaskInstall(pkg string) {
	if !IsMac() {
		return
	}
	output, err := ExecCommand("brew", "install", "--cask", pkg)
	if err != nil && !strings.Contains(output.Stderr, "already installed") {
		panic(err)
	}
}
