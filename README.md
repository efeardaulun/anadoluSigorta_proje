# anadoluSigorta_proje
anadolu sigorta staj projesi mysql kodları


CREATE DATABASE demo;
USE demo;

create table users (
	id  int(3) NOT NULL AUTO_INCREMENT,
	name varchar(120) NOT NULL,
	email varchar(220) NOT NULL,
	brand varchar(120),
	PRIMARY KEY (id)
);
