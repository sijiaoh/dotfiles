package utils

import (
	"io"
	"os"
)

func MkdirP(dir string) {
	dir = ExpandPath(dir)

	if err := os.MkdirAll(dir, 0755); err != nil {
		panic(err)
	}
}

func CopyFileTo(src, dest string) {
	src = ExpandPath(src)
	dest = ExpandPath(dest)

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
	src = ExpandPath(src)
	dest = ExpandPath(dest)

	if _, err := os.Stat(dest); err == nil {
		if err := os.Remove(dest); err != nil {
			panic(err)
		}
	}

	_, err := ExecCommand("ln", "-sf", src, dest)
	if err != nil {
		panic(err)
	}
}
