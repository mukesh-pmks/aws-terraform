#!/bin/bash

sleep 180

yum update -y

yum install -y wget

wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

rpm -Uvh mysql80-community-release-el7-3.noarch.rpm

yum install -y mysql-community-server

systemctl start mysqld.service

/usr/bin/mysqladmin -u root password 'secret'

mysql -u root -psecret -e "create user 'root'@'%' identified by 'secret';" mysql

mysql -u root -psecret -e 'CREATE TABLE Employees (ID int(11) NOT NULL AUTO_INCREMENT, NAME varchar(45) DEFAULT NULL, ADDRESS varchar(255) DEFAULT NULL, PRIMARY KEY (ID));' test

mysql -u root -psecret -e "INSERT INTO Employees (NAME, ADDRESS) values ('JOHN', 'LONDON UK') ;" test
