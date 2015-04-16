#!/bin/bash

function disableFirewall {
    echo "disabling firewall"
    /sbin/iptables-save
    ufw disable
}

function installUtilities {
    echo "install utilities"
    apt-get update -y
    apt-get install -y git git-review python-pip python-dev
    # install docker
    apt-get -y docker.io
    # install nova-docker
    git clone http://github.com/stackforge/nova-docker.git
    cd nova-docker
    python setup.py install
    # get devstack and create stack user
    cd /opt/
    git clone https://git.openstack.org/openstack-dev/devstack
    /opt/devstack/tools/create-stack-user.sh
    chown -R stack:stack devstack
    # start docker in stack group
    echo "DOCKER_OPTS=\"-G stack\"" >> /etc/default/docker.io
    service docker.io restart
}
echo "setup ubuntu"

disableFirewall
installUtilities

