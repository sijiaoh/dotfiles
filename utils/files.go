package utils

import (
	"io"
	"os"
)

func MkdirP(dir string) error {
	return os.MkdirAll(dir, 0755)
}

func CopyFileTo(src, dest string) error {
	srcFile, err := os.Open(src)
	if err != nil {
		return err
	}
	defer srcFile.Close()

	destFile, err := os.Create(dest)
	if err != nil {
		return err
	}
	defer destFile.Close()

	_, err = io.Copy(destFile, srcFile)
	return err
}
