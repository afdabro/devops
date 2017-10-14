#!/bin/bash
# Purpose: Create environment var if it does not exist
# Argument1: key=value environment variable to add
bashprofile_local=~/.bash_profile
exportvar="export $1"
if ! grep "$exportvar" $bashprofile_local; then
    echo "Appending $exportvar to $bashprofile_local"
    echo "$exportvar" >> $bashprofile_local
    echo "Reloading $bashprofile_local settings"
    . $bashprofile_local
else
    echo "$exportvar exists in $bashprofile_local. No action taken."
fi