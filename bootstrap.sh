#!/usr/bin/env bash
yum -y install -y epel-release centos-release-scl
yum -y install -y wget curl xorg-x11-xauth xterm lsof strace socat nc tree tcpdump vim jq git cmake3 rh-git218 devtoolset-9 glibc.i686

# Remove the firewall
systemctl stop firewalld
systemctl mask firewalld

# Enable git-2.18 for vagrant
echo "source /opt/rh/rh-git218/enable" >> ~vagrant/.bashrc
echo "source /opt/rh/devtoolset-9/enable" >> ~vagrant/.bashrc
echo "set -o vi" >> ~vagrant/.bashrc

# Download the test subject 
cd /tmp
wget -O billygoat_executable.zip https://www.battelle.org/docs/librariesprovider4/default-document-library/billygoat_executable.zip?sfvrsn=a0a48288_2
unzip -p billygoat_executable.zip > billygoat
chmod +x billygoat
file billygoat

