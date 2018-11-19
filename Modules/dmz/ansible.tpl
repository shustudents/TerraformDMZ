#!/bin/bash 

apt-get update 
apt-get install mysql-server 
mysql -u root -p
CREATE DATABASE app;
USE app; 
CREATE TABLE users ( id smallint unsigned not null auto_increment, name varchar(20) not null, lastname varchar(20) not null ) );

// INSERT INTO users ( id, name ) VALUES ( null, 'Sample data' );


