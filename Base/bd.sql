DROP DATABASE edowin;
CREATE DATABASE edowin;
USE edowin;

CREATE TABLE Usuario (
	ID INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(30) NOT NULL,
	password VARCHAR(60) NOT NULL,
	mail VARCHAR(45) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	apellidoP VARCHAR(45) NOT NULL,
	apellidoM VARCHAR(45) NOT NULL,
	esAdmin VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE Archivo (
	idArchivo INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(80) NOT NULL,
	tipo VARCHAR(45) NOT NULL,
	url VARCHAR(120),
	numDescargas INT,
	Publico VARCHAR(20) NOT NULL,
	userID INT NOT NULL,
	PRIMARY KEY(idArchivo),
	FOREIGN KEY (userID)
    REFERENCES Usuario(ID)
);

ALTER DATABASE edowin charset=utf8;

INSERT INTO Usuario (username, password, mail, nombre, esAdmin) VALUES ('ChuckNorris', 'clasico', 'yang.silva.neri@gmail.com', 'Chuck Norris', "true");