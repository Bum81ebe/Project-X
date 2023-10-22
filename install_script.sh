#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Update the system
sudo apt-get update

# Install necessary utilities
sudo apt-get install -y curl build-essential dnsutils net-tools tcpdump dsniff grepcidr unzip

# Install dos deflate
wget https://github.com/jgmdev/ddos-deflate/archive/master.zip -O ddos.zip
unzip ddos.zip

if [ ! -d "ddos-deflate-master" ]; then
    echo "Error: Directory ddos-deflate-master does not exist."
    exit 1
fi

cd ddos-deflate-master
./install.sh

# Enable and start the ddos service
sudo systemctl enable ddos
sudo systemctl start ddos

# Install haproxy
sudo apt-get install -y haproxy

# Verify installations
if ! which haproxy > /dev/null; then
    echo "Error: haproxy installation failed."
    exit 1
fi

/usr/sbin/ddos --version

echo "Installation and configuration complete!"
