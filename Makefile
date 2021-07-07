include .envrc

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

# ==================================================================================== #
# INSTALLATION
# ==================================================================================== #

## install/cowsay: installs the cowsay utility needed to run the Golang CLI example
.PHONY: install/cowsay
install/cowsay:
	@sudo apt-get update -y && sudo apt-get install -y cowsay

## cowsay/test: checks if the cowsay utility is installed on your system
.PHONY: cowsay/test
cowsay/test:
	@cowsay_wrapper.sh ${COWSAY_MSG}

# ==================================================================================== #
# DEVELOPMENT
# ==================================================================================== #

## run/temp-cli: run the temp CLI application
.PHONY: run/temp-cli
run/temp-cli:
	@go run ./cmd -msg=${COWSAY_MSG}

# ==================================================================================== #
# BUILD
# ==================================================================================== #

## build/cli: build the CLI application
.PHONY: build/cli
build/cli:
	@echo 'Building ...'
	@GOOS=linux GOARCH=amd64 go build -o=./bin/linux_amd64/cli ./cmd
	@echo 'Artifact ready !'

# ==================================================================================== #
# CLI
# ==================================================================================== #

## run/cli: run the CLI application
.PHONY: run/cli
run/cli:
	@echo 'Running ...'
	@./bin/linux_amd64/cli -msg=${COWSAY_MSG}

## run/help: run the CLI help
.PHONY: run/help
run/help:
	@./bin/linux_amd64/cli -h