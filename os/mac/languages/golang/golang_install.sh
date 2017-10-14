#!/bin/bash
# Purpose: Install go language
# TODO: fix relative path to enable running from different directory.
utils_path="../../utils"
brew install go --cross-compile-common

echo "Creating go directory"
mkdir $HOME/go
sh $utils_path/bash_profile_setup.sh

echo "Adding environment variables"
gopath_dir="$HOME/go"
gopath_local="GOPATH=$gopath_dir"
sh $utils_path/envvar_createnotexist.sh "$gopath_local"

# TODO: test to see if this doesn't have side effects...
gopath_local_bin="PATH=$PATH:$gopath_dir/bin"
sh $utils_path/envvar_createnotexist.sh "$gopath_local_bin"