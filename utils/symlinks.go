package utils

import (
	"os"
	"path"
)

// src: 自動でDotfilesRoot()が付与される
func CreateSymlink(src, dest string) error {
	absoluteSrc := path.Join(DotfilesRoot(), src)

	if dest[:2] == "~/" {
		dest = path.Join(os.Getenv("HOME"), dest[2:])
	}

	_, err := ExecCommand("ln", "-sf", absoluteSrc, dest)
	return err
}
