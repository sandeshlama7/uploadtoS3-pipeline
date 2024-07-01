#!/bin/bash

cd /home/ec2-user/simple_todo
#Install node app dependencies
npm install

#Start the node app
pm2 start server.js
