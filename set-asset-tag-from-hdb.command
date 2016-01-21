#!/bin/bash

RunAsRoot()
{
        ## Pass in the full path to the executable as $1
        if [[ "${USER}" != "root" ]] ; then
echo
echo "*** This application must be run as root. Please authenticate below. ***"
                echo
sudo "${1}" && exit 0
        fi
}

RunAsRoot "${0}"

# go go gadget curl
asset=$(curl http://hdb.ic.ac.uk/Zope/complete_reg/self_info | grep 'assetid=' | cut -f2 -d';')

echo Setting asset tag number to \"${asset}\".

defaults write /Library/Preferences/com.apple.RemoteDesktop.plist Text2 $asset
