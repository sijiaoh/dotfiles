package utils

import (
	"fmt"
	"io"
	"os"
	"path"
	"strconv"
	"strings"
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

	MkdirP(path.Dir(dest))

	_, err := ExecCommand(fmt.Sprintf("ln -sf %s %s", src, dest))
	if err != nil {
		panic(err)
	}
}

type GitCloneOptions struct {
	Tag   *string
	Depth *int
}

func GitClone(repo, dest string, opts *GitCloneOptions) {
	if opts == nil {
		opts = &GitCloneOptions{}
	}

	commandOpts := ""
	if opts.Tag != nil {
		commandOpts += " --branch=" + *opts.Tag
	}
	if opts.Depth != nil {
		commandOpts += " --depth=" + strconv.Itoa(*opts.Depth)
	}

	output, err := ExecCommand(fmt.Sprintf("git clone --recursive %s %s %s", commandOpts, repo, dest))
	if err != nil && !strings.Contains(output.Stderr, "already exists") {
		panic(err)
	}
}
