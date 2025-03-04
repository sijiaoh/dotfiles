package utils

import (
	"bytes"
	"errors"
	"io"
	"os"
	"os/exec"
)

type CommandOutput struct {
	Stdout string
	Stderr string
}

func ExecCommand(command string) (*CommandOutput, error) {
	cmd := exec.Command("sh", "-c", command)

	outBuffer := bytes.Buffer{}
	errBuffer := bytes.Buffer{}

	cmd.Stdin = os.Stdin
	cmd.Stdout = io.MultiWriter(os.Stdout, &outBuffer)
	cmd.Stderr = io.MultiWriter(os.Stderr, &errBuffer)

	err := cmd.Run()

	output := CommandOutput{
		Stdout: outBuffer.String(),
		Stderr: errBuffer.String(),
	}

	if err != nil {
		return &output, errors.New(output.Stderr)
	}
	return &output, nil
}

func MustExecCommand(command string) *CommandOutput {
	output, err := ExecCommand(command)
	if err != nil {
		panic(err)
	}
	return output
}

func ExecScript(script string) (*CommandOutput, error) {
	script = ExpandPath(script)
	return ExecCommand(script)
}
