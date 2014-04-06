#!/usr/bin/env bash
# Installs puppet
# Source http://blog.kloudless.com/2013/07/01/automating-development-environments-with-vagrant-and-puppet/
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

if which puppet > /dev/null ; then
        echo "Puppet is already installed"
        exit 0
fi

echo "Installing Puppet repo for Debain Wheezy"
wget -qO /tmp/puppetlabs-release-wheezy.deb \
http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb

dpkg -i /tmp/puppetlabs-release-wheezy.deb
rm /tmp/puppetlabs-release-wheezy.deb
aptitude update
#aptitude upgrade -y
echo Installing puppet
aptitude install -y puppet
echo "Puppet installed!"
