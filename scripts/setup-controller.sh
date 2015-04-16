#!/bin/bash

HOST_IP=`ifconfig eth0 | grep "inet addr"| cut -d: -f2 | awk '{ print $1}'`

function installController {
    echo "install controller"
    sed s/{HOST_IP}/$HOST_IP/ /vagrant/resources/local.conf.controller > /opt/devstack/local.conf
    su - stack -s /opt/devstack/stack.sh
    echo "controller installed successfully"
}

installController
