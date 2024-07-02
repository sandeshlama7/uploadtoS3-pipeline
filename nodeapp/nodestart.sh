#!/bin/bash

cd /home/ec2-user/simple_todo || { echo "Could not find directory" exit 1; }
#Install node app dependencies
npm install || { echo "npm install failed"; exit 1; }

# sleep 10
#Start the node app
pm2 start server.js
