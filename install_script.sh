#!/bin/bash

# Update the system and install necessary utilities
sudo apt-get update && sudo apt-get install -y curl build-essential

# Add the Universe repository and install packages
sudo add-apt-repository -y universe
sudo apt-get update
sudo apt-get install -y dnsutils net-tools tcpdump dsniff grepcidr unzip haproxy

# Install dos deflate
wget https://github.com/jgmdev/ddos-deflate/archive/master.zip -O ddos.zip
unzip ddos.zip

if [ -d "ddos-deflate-master" ]; then
    cd ddos-deflate-master
    ./install.sh
else
    echo "Error: Directory ddos-deflate-master does not exist."
    exit 1
fi

# Ensure the ddos service is enabled and started
sudo systemctl enable ddos
sudo systemctl start ddos

# Verify installations
which haproxy
/usr/sbin/ddos --version

echo "Installation and configuration complete!"
