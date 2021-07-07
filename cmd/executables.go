package main

import "log"

func cowsay(cfg *config) {
	if path, err := getExecutablePath("cowsay_wrapper.sh"); err != nil {
		log.Fatalln("Error: ", err)
	} else {
		args := make([]string, 0)
		args = append(args, cfg.message)
		cmd := buildCmd(path, args)
		execCmd(cmd)
	}
}

