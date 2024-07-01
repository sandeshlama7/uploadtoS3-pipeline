#!/bin/bash

#Install node app dependencies
npm install

#Start the node app
pm2 start server.js
