#!/bin/bash

cd /home/ec2-user/simple_todo
#Install node app dependencies
sudo npm install

#Start the node app
sudo pm2 start server.js
