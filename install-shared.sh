#!/bin/sh

# Prerequisites

./install-isolated.sh

# CLI tool complete installation without virtualenv
# TODO: check python3 status of ramses

sudo apt-get -y --no-install-recommends install python3-dev python3-pip
sudo apt-get -y --no-install-recommends install elasticsearch
# + workaround for non-working elasticsearch: apt-get install libjackson2-databind-java libjackson-json-java ? -> does not work
# => BROKEN in jessie + Ubuntu 16.10
sudo pip3 install ramses
sudo pip3 install waitress Paste nefertari_sqla # workarounds... see Dockerfile
# + export PYTHONPATH=. before pserve; already applied by transducer-service

# add to /etc/rc.local: su -c "cd /home/<user>/.../transducer/service && ./transducer-service &" <user>
