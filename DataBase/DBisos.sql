DROP TABLE IF EXISTS conference CASCADE;
DROP TABLE IF EXISTS places CASCADE;
DROP TABLE IF EXISTS invoice CASCADE;
DROP TABLE IF EXISTS partecipant CASCADE;

CREATE TABLE conference(
name varchar(100) NOT NULL,
object_conference varchar(100) NOT NULL,
conference_description varchar(256),
location varchar(100) NOT NULL,
price integer NOT NULL,
conference_date date NOT NULL,
end_date date NOT NULL,
reserved integer NOT NULL,
PRIMARY KEY (name)
);

CREATE TABLE places(
name varchar(100) NOT NULL,
location varchar(100) NOT NULL,
phone varchar(100) NOT NULL,
capacity integer NOT NULL,
PRIMARY KEY (name)
);

CREATE TABLE invoice(
name varchar(100) NOT NULL,
details varchar(256) NOT NULL,
adress varchar(100) NOT NULL,
ammount integer NOT NULL,
PRIMARY KEY (name)
);

CREATE TABLE partecipant(
name varchar(100) NOT NULL,
surname varchar(100)  NOT NULL,
job varchar(100) NOT NULL ,
sex varchar(100) NOT NULL,
addres varchar(100) NOT NULL,
PRIMARY KEY  (name, surname)
);
