package utils

import (
	"path"
	"path/filepath"
)

func LinkDotfiles() {
	dotfiles, err := filepath.Glob(path.Join(DotfilesRoot(), "*", ".*"))
	if err != nil {
		panic(err)
	}

	for _, dotfile := range dotfiles {
		to := path.Join(HomeDir(), path.Base(dotfile))
		CreateSymlink(dotfile, to)
	}
}
