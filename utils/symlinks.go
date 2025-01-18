package utils

import (
	"os"
	"path"
)

// src: 自動でDotfilesRoot()が付与される
func CreateSymlink(src, dest string) {
	absoluteSrc := path.Join(DotfilesRoot(), src)

	if dest[:2] == "~/" {
		dest = path.Join(os.Getenv("HOME"), dest[2:])
	}

	if _, err := os.Stat(dest); err == nil {
		if err := os.Remove(dest); err != nil {
			panic(err)
		}
	}

	_, err := ExecCommand("ln", "-sf", absoluteSrc, dest)
	if err != nil {
		panic(err)
	}
}
