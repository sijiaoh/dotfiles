package utils

import (
	"os"
	"path"
)

func DotfilesRoot() string {
	return path.Join(os.Getenv("HOME"), ".dotfiles")
}
