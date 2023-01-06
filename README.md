# run.sh
The most minimalistic multi OS bash entry point for your programs to start build on top of ... 

## CHECK USAGE

```bash
./run --help
```

## SIMPLE INSTALL 
Let's say that you want to create a new tool called `"my-app"`

```bash
cd /tmp/ ; wget https://github.com/csitea/run.sh/archive/refs/tags/current.zip
# rename into "my-app"
unzip -o current.zip -d . && mv -v run.sh-current my-app
# check the usage: 
cd /tmp/my-app ; ./run --help
```

## FEATURES & FUNCTIONALITIES 
The `run.sh` has the following function
 
 - minimalistic multi-os support 
 - etrexemely versatile logging function
 - capability to generically run any bash functions in the `lib/bash/funcs/` and `src/bash/run` dirs
 - json configuration file parsing function
 - package zipping function
 - variables provisioning requiring function
 - cmd args parsing functionality to start building on top of ...
 - directories resolution functionality - use always absolute paths in your functions for stability ...
 - use the `exit_code=$?` to fail early in your functions on errors ...