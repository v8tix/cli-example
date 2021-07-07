package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
)

func getExecutablePath(executable string) (string, error) {
	path, err := exec.LookPath(executable)
	if err != nil {
		return "", err
	}
	return path, nil
}

func buildCmd(path string, args []string) *exec.Cmd {
	pathAndArgs := []string{path}
	pathAndArgs = append(pathAndArgs, args...)
	cmd := &exec.Cmd{
		Path:   path,
		Args:   pathAndArgs,
		Stdout: os.Stdout,
		Stderr: os.Stdout,
	}
	return cmd
}

func execCmd(cmd *exec.Cmd) {
	cmdToExecute := fmt.Sprintf("%s", cmd.String())
	if err := cmd.Run(); err != nil {
		log.Fatalf("Error running %s: %s", cmdToExecute, err)
	}
}
