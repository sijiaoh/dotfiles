package utils

import (
	"runtime"
	"strings"
)

func IsMac() bool {
	return runtime.GOOS == "darwin"
}

func IsLinux() bool {
	return runtime.GOOS == "linux"
}

func IsWsl() (bool, error) {
	if !IsLinux() {
		return false, nil
	}

	output, err := ExecCommand("uname", "-a")
	if err != nil {
		return false, err
	}

	return strings.Contains(string(output.Stdout), "microsoft"), nil
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
