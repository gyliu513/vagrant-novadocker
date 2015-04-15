#!/bin/bash

function installController {
    echo "install controller"
    cp -f /vagrant/resources/local.conf.controller /opt/devstack/local.conf
}
