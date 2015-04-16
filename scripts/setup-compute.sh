#!/bin/bash

HOST_IP=`ifconfig eth0 | grep "inet addr"| cut -d: -f2 | awk '{ print $1}'`

MASTER_IP="127.0.0.1"

while getopts m: option
do
        case "${option}"
        in
                m) MASTER_IP=${OPTARG};;
        esac
done

function installCompute {
    echo "install compute"
    sed -e 's/{HOST_IP}/$HOST_IP/' -e 's/{MASTER_IP}/$MASTER_IP/' /vagrant/resources/local.conf.compute > /opt/devstack/local.conf
    su stack
    /opt/devstack/stack.sh
    cp -f /vagrant/resources/docker.filter /etc/nova/rootwrap.d/
    echo "compute installed succesfully"
}

installCompute
