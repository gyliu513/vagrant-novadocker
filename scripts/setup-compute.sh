#!/bin/bash

function installController {
    echo "install controller"
    cp -f /vagrant/resources/local.conf.compute /opt/devstack/local.conf
}
