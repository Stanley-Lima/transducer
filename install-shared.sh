#!/bin/sh

# Prerequisites

./install-isolated.sh

# CLI tool complete installation without virtualenv
# TODO: check python3 status of ramses

sudo apt-get -y --no-install-recommends install python3-dev
sudo apt-get -y --no-install-recommends install elasticsearch
# + workaround for non-working elasticsearch: apt-get install libjackson2-databind-java libjackson-json-java ? -> does not work
# => BROKEN in jessie
sudo pip3 install ramses
sudo pip3 install waitress Paste nefertari_sqla # workarounds... see Dockerfile
# + export PYTHONPATH=. before pserve
