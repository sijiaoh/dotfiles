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

func AutoInstall(pkg string) error {
	if err := AptInstall(pkg); err != nil {
		return err
	}
	if err := BrewInstall(pkg); err != nil {
		return err
	}
	return nil
}

func AptInstall(pkg string) error {
	if !IsLinux() {
		return nil
	}
	_, err := ExecCommand("sudo", "apt", "install", pkg)
	return err
}

func SnapInstall(pkg string) error {
	if !IsLinux() || IsDevContainer() {
		return nil
	}
	_, err := ExecCommand("sudo", "snap", "install", pkg)
	return err
}

func BrewInstall(pkg string) error {
	if !IsMac() {
		return nil
	}
	output, err := ExecCommand("brew", "install", pkg)
	if err != nil && !strings.Contains(output.Stderr, "already installed") {
		return err
	}
	return nil
}

func BrewCaskInstall(pkg string) error {
	if !IsMac() {
		return nil
	}
	output, err := ExecCommand("brew", "install", "--cask", pkg)
	if err != nil && !strings.Contains(output.Stderr, "already installed") {
		return err
	}
	return nil
}
