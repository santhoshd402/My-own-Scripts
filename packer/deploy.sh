#!/bin/bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
wget https://qt-s3-new-testing.s3-us-west-2.amazonaws.com/spring-petclinic.jar
echo "Spring petclinic is copied at /home/ubuntu/spring-petclinic.jar"