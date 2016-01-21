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
new_hostname=$(curl http://hdb.ic.ac.uk/Zope/complete_reg/self_info 2>/dev/null | grep 'hostname=' | cut -f2 -d';')

echo Setting hostname to \"${new_hostname}\".

for thing in ComputerName LocalHostName HostName; do
	echo -ne "\t$thing...\n"
	scutil --set "$thing" "$new_hostname"
done
