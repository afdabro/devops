#!/bin/bash
# Purpose: Clone repository and execute Ansible install script

echo "Starting Developer setup"
installdir="/tmp/devsetup-$RANDOM"
mkdir $installdir

git clone https://github.com/afdabro/devops.git $installdir 
if [ ! -d $installdir ]; then
    echo "git cloned failed"
    exit 1
else
    cd $installdir 
    sh install.sh
fi

echo "cleaning up..."

rm -Rfv /tmp/$installdir

echo "finished"

exit 0