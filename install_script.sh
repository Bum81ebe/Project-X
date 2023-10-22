#!/bin/bash

# Update the system and install necessary utilities
sudo apt-get update && sudo apt-get install -y curl build-essential && sudo apt install dnsutils && sudo apt-get install net-tools && sudo apt-get install tcpdump && sudo apt-get install dsniff -y && sudo apt install grepcidr && sudo apt install unzip


# Install dos deflate
wget https://github.com/jgmdev/ddos-deflate/archive/master.zip -O ddos.zip
unzip ddos.zip
cd ddos-deflate-master
./install.sh

# Note: The above commands change the number of connections, email, and ban period.
# You can adjust the sed commands to modify other parameters in the configuration file.

sudo systemctl enable ddos
sudo systemctl start ddos

# Install haproxy
sudo apt-get install -y haproxy

# Verify installations
which haproxy
/usr/sbin/ddos --version

echo "Installation and configuration complete!"
