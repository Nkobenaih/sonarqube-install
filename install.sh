#!/bin/bash
#author:neville
#date: feb 2023
#describtion: install sonarqube on centos7

su - vagrant
# java installation
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
#download sonarqube latest version on your server
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
#extract packages
sudo yum install unzip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
#change ownership to the userand switch to linux binariers directory to start service
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-x.x/bin/linux-x86-64 
 ./sonar.sh start
#enable the firewall
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
 echo "the installation is complete. you can ut your IP address to test it"


