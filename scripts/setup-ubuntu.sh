#!/bin/bash

function disableFirewall {
    echo "disabling firewall"
    /sbin/iptables-save
    ufw disable
}

function installUtilities {
    echo "install utilities"

	# install docker in ubuntu http://docs.docker.com/installation/ubuntulinux/
	apt-get update -y
	apt-get install -y curl git git-review python-pip python-dev
	curl -sSL https://get.docker.com/ubuntu/ | sh

    # install nova-docker
    git clone https://github.com/qiujian16/nova-docker.git
    cd nova-docker
    python setup.py install

    # get devstack and create stack user
    cd /opt/
    git clone https://git.openstack.org/openstack-dev/devstack
    /opt/devstack/tools/create-stack-user.sh
    chown -R stack:stack devstack

    # start docker in stack group
    echo "DOCKER_OPTS=\"-G stack\"" >> /etc/default/docker
    service docker restart
}
echo "setup ubuntu"

disableFirewall
installUtilities

