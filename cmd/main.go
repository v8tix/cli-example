package main

import (
	"flag"
	"fmt"
)

type config struct {
	message string
}

func main() {
	var cfg config
	flag.StringVar(&cfg.message, "msg", "Carry on", "cowsay message")
	flag.Parse()
	_ = fmt.Sprintf("cowsay path: %s", cfg.message)
	cowsay(&cfg)
}
