DROP TABLE IF EXISTS conference CASCADE;
DROP TABLE IF EXISTS places CASCADE;
DROP TABLE IF EXISTS invoice CASCADE;
DROP TABLE IF EXISTS partecipant CASCADE;

CREATE TABLE conference(
nome varchar(100) PRIMARY KEY,
object_conference varchar(100) NOT NULL,
conference_description varchar(256),
location varchar(100) NOT NULL,
price integer NOT NULL,
conference_date datetime NOT NULL,
end_date  datetime NOT NULL
);

CREATE TABLE places(
name varchar(100) PRIMARY KEY,
location varchar(100) NOT NULL,
phone varchar(100) NOT NULL,
capacity integer NOT NULL,
reserved integer NOT NULL
);

CREATE TABLE invoice(
name varchar(100) PRIMARY KEY,
details varchar(256) PRIMARY KEY,
adress varchar(100) PRIMARY KEY,
ammount integer NOT NULL 
);

CREATE TABLE partecipant(
name varchar(100) PRIMARY KEY,
surname varchar(100)  NOT NULL,
job varchar(100) NOT NULL ,
sex varchar(100) NOT NULL,
addres varchar(100) NOT NULL 
);


