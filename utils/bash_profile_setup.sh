#!/bin/bash
# Purpose: Create .bash_profile if it does not exist.
filename=~/.bash_profile
if [ ! -f "$filename" ]
then
echo "File $filename does not exists in the current directory"
echo "Creating $filename"
touch .bash_profile
echo "Reloading $filename settings"
. .bash_profile
else
echo "File $filename exists"
fi
exit 0