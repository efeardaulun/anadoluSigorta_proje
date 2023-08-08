# anadoluSigorta_proje
anadolu sigorta staj projesi mysql kodları

CREATE DATABASE acentePortal;
USE acentePortal;

create table users (
	id  int(3) NOT NULL AUTO_INCREMENT,
	name varchar(120) NOT NULL,
	email varchar(220) NOT NULL,
	brand varchar(120) NOT NULL,
    plateNo varchar(120) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE login (
  username varchar(45) NOT NULL unique,
  password varchar(45) DEFAULT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE users ADD COLUMN agent_username varchar(45),
ADD CONSTRAINT fk_agent_username
FOREIGN KEY (agent_username)
REFERENCES login(username);

select *from acentePortal.login;


