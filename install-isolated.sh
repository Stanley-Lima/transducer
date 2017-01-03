#!/bin/sh

# CLI tool

sudo apt-get -y --no-install-recommends install python-pip python-setuptools virtualenv docker.io
sudo apt-get -y --no-install-recommends install postgresql-server-dev-9.6 # should not be needed but actually is; is 9.5 for ubuntu 16.10
sudo apt-get -y --no-install-recommends install gcc libpython-dev # should not be needed but actually is for crpytacular

echo "$USER ALL=NOPASSWD: ALL" | sudo tee -a /etc/sudoers >/dev/null

# WS tool

sudo apt-get -y --no-install-recommends install python3-flask python3-setuptools
sudo easy_install3 flask-cors # or perhaps without setuptools: pip3 install -U flask-cors
