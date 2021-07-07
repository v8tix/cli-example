# Welcome

Welcome to the CLI Golang example.

## Goal
This project shows you a way to call Bash executables from a CLI built in Golang.

## What this guide covers
1. How to set up the project.
2. How to run this project.

### 1. How to set up the project.
* Once you got this source code, you need to:

    * Add the wrapper folder absolute path to your PATH env variable (preferable to the /etc/bash.bashrc file):
  ````
      export SCRIPTS_HOME=<YOUR_DIR>/go/src/cli-example/scripts/lib/wrapper
      export PATH=${PATH}:${SCRIPTS_HOME}
  ````
    * To refresh the changes from your actual terminal execute:
  ````
      source /etc/bash.bashrc
  ````
    * At the root of this project, you can find a Makefile which contains some useful tasks. To see all of them, you can execute: 
  ````
      $ make help
  
      Usage:
        help             print this help message
        install/cowsay   installs the cowsay utility needed to run the Golang CLI example
        cowsay/test      checks if the cowsay utility is installed on your system
        run/temp-cli     run the temp CLI application
        build/cli        build the CLI application
        run/cli          run the CLI application
        run/help         run the CLI help
  ````
    * Next, we need to install the cowsay executable from the Ubuntu repositories. If all is Ok, you will get the following output:
  ````
      $ make install/cowsay && make cowsay/test
  
      __________
     < Carry on >
      ----------
       \
        \
             .--.
            |o_o |
            |:_/ |
           //   \ \
          (|     | )
         /'\_   _/`\
         \___)=(___/
  ````    
  
### 2. How to run this project.
* There are two ways to run this project:
    * If you want to run a fast test:
  ````
      $ make run/temp-cli
  ````
    * Or if you want to run the final executable:
  ````
      $ make build/cli && make run/cli
  ````
  NOTE: You can find the final executable under the cli-example/bin/linux_amd64 directory, and if you want to obtain help from the executable you can execute:
  ````
      $ make run/help
  ````

## Initial work
![v8tix logo](resources/v8tix-logo.jpg) <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Contact us](mailto:info@v8tix.com)</p> 