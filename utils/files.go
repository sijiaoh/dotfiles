package utils

import (
	"io"
	"os"
	"path"
)

func MkdirP(dir string) {
	if err := os.MkdirAll(dir, 0755); err != nil {
		panic(err)
	}
}

func CopyFileTo(src, dest string) {
	srcFile, err := os.Open(src)
	if err != nil {
		panic(err)
	}
	defer srcFile.Close()

	destFile, err := os.Create(dest)
	if err != nil {
		panic(err)
	}
	defer destFile.Close()

	_, err = io.Copy(destFile, srcFile)
	if err != nil {
		panic(err)
	}
}

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
