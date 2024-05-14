-- cosas "pending": las INSERTS
-- como estamos trabajando con cartas que son reales, no podemos generar valores de los atributos aliatoriamente
-- asi hasta que las tenemos organizado no tenemos implementado las INSERTS para mantener la table coherente y legible
-- pronto lo tendremos arreglado



-- Required updates:

-- DROP TABLES ON EVERYTHING
-- If a table A has a fk that references a table B pk then that B needs to be above A else the table is never created and the problem will undermine the BBDD
-- Every table has a foreign key, this is not possible, revise
-- Alternatively, the ER diagram requires a specialization on Cartas so that all these categories of Cartas can reference the parent entity Carta
-- the Inserts need to be added Immediately

-- Set SQL mode and time zone
SET SQL_MODE= "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Unlock tables if necessary
UNLOCK TABLES;

-- Drop the database if it exists
DROP DATABASE IF EXISTS `JuegoDeMesa`;

-- Creamos base de datos
CREATE DATABASE IF NOT EXISTS `JuegoDeMesa`;
-- Usamos la base de datos
USE JuegoDeMesa;
-- Creamos tablas


Create table Iberian( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Celt( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Etruscan( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Mycenaean( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Phoenician( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Hittite( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Mercenary( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);

Create table Land( 
Nombre varchar (60) not null ,
Id_Carta int  not null primary key ,
coste decimal not null ,
coste_cultural decimal not null ,
Supertipo varchar (30) not null ,
Reglas_De_Texto varchar (100) not null ,
PT varchar (10) not null ,
Set_ varchar (3) not null ,
FOREIGN KEY (`Id_Carta`) REFERENCES Contenidos(`Id_Carta`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Carta`) REFERENCES `cartas_en_consulta`(`Id_Carta`) ON UPDATE CASCADE
);



Create table GameLog(
Id_Juego int primary key not null ,
Contador_Jugador int not null ,
Contador_Turno int not null ,
FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario) ON UPDATE CASCADE ,
FOREIGN KEY (`Id_Juego`) REFERENCES `mazos_registrados`(`Id_Juego`) ON UPDATE CASCADE,
FOREIGN KEY (Id_Mazo) REFERENCES Mazos(Id_Mazo) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Juego`) REFERENCES `usuarios_registrados`(`Id_Juego`) ON UPDATE CASCADE
);

Create table Usuarios(
Id_Usuario int primary key not null ,
Nombre_Usuario varchar (20) not null ,
Contraseña varchar (20) not null ,
Mazos_Creados int not null,
FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios_registrados`(`Id_Usuario`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Usuario`) REFERENCES `ConsultaDeBusqueda`(`Id_Usuario`) ON UPDATE CASCADE,
FOREIGN KEY (`Id_Usuario`) REFERENCES `Mazos`(`Id_Usuario`) ON UPDATE CASCADE
);

Create table Mazos(
Id_Mazo int primary key not null ,
`Id_Usuario` INT NOT NULL ,
Nombre varchar (15) not null ,
Cartas_Totales int not null ,
 FOREIGN KEY (Id_Mazo) REFERENCES Contenidos(Id_Mazo) ON UPDATE CASCADE,
 FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuarios`(`Id_Usuario`) ON UPDATE CASCADE

);

Create table Impresion(
Id_Impresion int primary key not null ,
`Id_Mazo` INT NOT NULL,
 FOREIGN KEY (Id_Mazo) REFERENCES Mazos(Id_Mazo) ON UPDATE CASCADE
);

Create table ConsultaDeBusqueda(
Id_Consulta int primary key not null ,  
Detalles_De_Consulta varchar (20) not null ,
TiempoPedido int not null ,
FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario) ON UPDATE CASCADE,
-- clave foranea id usuario creado
FOREIGN KEY (`Id_Consulta`) REFERENCES `cartas_en_consulta`(`Id_Consulta`) ON UPDATE CASCADE
);

-- Relation n:m entre Search query y Cartas
DROP TABLE IF EXISTS `cartas_en_consulta`;
CREATE TABLE IF NOT EXISTS `cartas_en_consulta` (
	`Id_Consulta` INT NOT NULL,
    `Id_Carta` INT NOT NULL,
    PRIMARY KEY (`Id_Consulta`,`Id_Carta`),
    FOREIGN KEY (`Id_Consulta`) REFERENCES `ConsultaDeBusqueda`(`Id_Consulta`),
    FOREIGN KEY (`Id_Mazo`) REFERENCES `Mazos`(`Id_Mazo`),
    FOREIGN KEY (`Id_Carta`) REFERENCES `Iberian`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Celt`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Etruscan`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Mycenaean`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Phoenician`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Hittite`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Mercenary`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Land`(`Id_Carta`) ON UPDATE CASCADE
);

-- Relation table n:m between Cartas y Mazos
DROP TABLE IF EXISTS `Contenidos`;
CREATE TABLE IF NOT EXISTS `Contenidos` (
    `Id_Mazo` INT NOT NULL,
    `Id_Carta` INT NOT NULL,
    PRIMARY KEY (`Id_Mazo` , `Id_Carta`),
    FOREIGN KEY (`Id_Mazo`) REFERENCES `Mazos`(`Id_Mazo`),
    FOREIGN KEY (`Id_Carta`) REFERENCES `Iberian`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Celt`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Etruscan`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Mycenaean`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Phoenician`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Hittite`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Mercenary`(`Id_Carta`) ON UPDATE CASCADE,
    FOREIGN KEY (`Id_Carta`) REFERENCES `Land`(`Id_Carta`) ON UPDATE CASCADE
    --  (id carta x100)
    -- ^ es decir como aun hemos escrito las 100 lineas que haya anadir a nuestro bbdd
);

-- la relacion n:m entre Decks y Game Log
DROP TABLE IF EXISTS `mazos_registrados`;
CREATE TABLE IF NOT EXISTS `mazos_registrados` (
	`Id_Juego` INT NOT NULL,
    `Id_Mazo` INT NOT NULL,
    PRIMARY KEY (`Id_Juego`,`Id_Mazo`),
	FOREIGN KEY (`Id_Mazo`) REFERENCES `Mazos`(`Id_Mazo`),
    FOREIGN KEY (`Id_Juego`) REFERENCES `GameLog`(`Id_Juego`)
);

-- the relacion n:m that is entre Users y GameLog
DROP TABLE IF EXISTS `usuarios_registrados`;
CREATE TABLE IF NOT EXISTS `usuarios_registrados` (
	`Id_Juego` INT NOT NULL,
    `Id_Usuario` INT NOT NULL,
    PRIMARY KEY (`Id_Juego`,`Id_Usuario`),
    FOREIGN KEY (`Id_Juego`) REFERENCES `GameLog`(`Id_Juego`),
    FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuarios`(`Id_Usuario`)
);

