#!/bin/bash

# utils
sudo apt-get install -y --no-install-recommends \
    openjdk-7-jre-headless \
    chromium \
    xvfb

# nodejs 5
curl -sL https://deb.nodesource.com/setup_5.x | sudo bash -
sudo apt-get install -y nodejs

# mongo 3
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update && sudo apt-get install -y mongodb-org

# mean tools
sudo npm install -g \
    grunt-cli \
    bower \
    yo \
    generator-angular-fullstack

# development by default
echo "export NODE_ENV=development" >> /home/vagrant/.bashrc
