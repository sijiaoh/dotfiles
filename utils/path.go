package utils

import (
	"os"
	"path"
)

func DotfilesRoot() string {
	return path.Join(HomeDir(), ".dotfiles")
}

func HomeDir() string {
	return os.Getenv("HOME")
}

func ExpandPath(p string) string {
	if p[:2] == "~/" {
		p = path.Join(HomeDir(), p[2:])
	}
	if p[:2] == "./" {
		p = path.Join(DotfilesRoot(), p[2:])
	}
	return p
}
