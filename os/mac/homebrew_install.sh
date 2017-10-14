#!/bin/bash
# Purpose: Install homebrew
sh ./bash_profile_setup.sh
# xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## insert the Homebrew directory at the top of your PATH environment variable. You can do this by adding the following line at the bottom of your ~/.profile file
## export PATH=/usr/local/bin:/usr/local/sbin:$PATH
