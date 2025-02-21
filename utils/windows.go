package utils

import (
	"path"
	"strings"
)

func WindowsUserName() string {
	output, err := ExecCommand("cmd.exe /c echo %USERNAME%")
	if err != nil {
		panic(err)
	}
	return strings.TrimRight(output.Stdout, "\r\n")
}

func WindowsHomeDir() string {
	return path.Join("/", "mnt", "c", "Users", WindowsUserName())
}

func WindowsAppDataDir() string {
	return path.Join(WindowsHomeDir(), "AppData", "Roaming")
}
