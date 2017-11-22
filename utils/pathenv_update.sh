#!/bin/bash
# Purpose: Update $PATH environment variable with new path
# ArgumentN: New path or paths to add to $PATH
bashprofile_local=~/.bash_profile

for ARG in "$@"
do
if [ "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
    echo "Adding $ARG to PATH"
    PATH="${PATH:+"$PATH:"}$ARG"
fi
done
sed -i '' '/export PATH=/d' $bashprofile_local
echo "export PATH=$PATH" >> $bashprofile_local
echo "Reloading $bashprofile_local settings"
. $bashprofile_local

exit 0