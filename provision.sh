#!/usr/bin/env bash

echo "Adding epel repository..."
sudo  rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm >/dev/null 2>&1

echo "Installing node.js and Redis..."
sudo yum install -y npm redis

echo "Starting Redis..."
sudo /etc/init.d/redis start

echo "Setting Redis auto start..."
sudo chkconfig redis on

echo "Installing redis-commander..."
sudo npm install -g redis-commander

echo "Setting redis-commander auto start..."
sudo chkconfig redis-commander on

echo "Installing CoffeeScript and Hubot..."
sudo npm install -g coffee-script hubot

echo "Installing Hipchat plugin..."
sudo yum install -y libicu-devel
npm install hubot-hipchat --save

echo "Installing forever package"
sudo npm install forever -g

echo "Installing Apache..."
sudo yum install -y httpd

echo "Setting Apache auto start..."
sudo chkconfig httpd on

echo "Finish!!"
