package utils

import "path"

func WindowsUserName() string {
	output, err := ExecCommand("cmd.exe /c echo %USERNAME%")
	if err != nil {
		panic(err)
	}
	return output.Stdout
}

func WindowsHomeDir() string {
	return path.Join("/", "mnt", "c", "Users", WindowsUserName())
}

func WindowsAppDataDir() string {
	return path.Join(WindowsHomeDir(), "AppData", "Roaming")
}
