#!/bin/bash
sudo apt update
sudo apt install -y openjdk-11-jdk git maven unzip
cd ~
git clone https://gerrit.onosproject.org/onos
cd onos
tools/build/onos-buck build onos
