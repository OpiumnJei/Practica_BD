-- LOS INDICES: mejoran la velocidad de las busquedas, se almacenan en el disco

CREATE DATABASE curso_sql;

DROP DATABASE curso_sql;

USE curso_sql;

SHOW TABLES;

DROP TABLE Naruto;

TRUNCATE TABLE Naruto;

-- Creacion de indices en una tabla

CREATE TABLE Naruto (
    id INT AUTO_INCREMENT PRIMARY KEY,    
    nombre VARCHAR(100) NOT NULL UNIQUE,            
    aldea VARCHAR(50)NOT NULL,          
    rango VARCHAR(50),                       
    clan VARCHAR(100),                       
    habilidad_especial VARCHAR(100),           
    edad INT,  
    INDEX i_rango (rango),  -- por convencion se le coloca i al inicio del index name, y luego se coloca el campo/atributo al que hace referencia
    INDEX i_clan (clan), -- el nombre 'i_clan' es un key name
    INDEX i_naruto (aldea, habilidad_especial) -- un indice para multiples campos
    
);

-- Creacion de campo FULLTEX INDEX para busquedas por indice en toda la tabla

CREATE TABLE Naruto (
    id INT AUTO_INCREMENT PRIMARY KEY,    
    nombre VARCHAR(100) NOT NULL,            
    aldea VARCHAR(50)NOT NULL,          
    rango VARCHAR(50),                       
    clan VARCHAR(100),                       
    habilidad_especial VARCHAR(100),           
    edad INT,
    FULLTEXT INDEX fi_busqueda(nombre, aldea, rango, clan) -- campos en los que se realizaran las busquedas
);

-- INSERCION DE DATOS PARA PRACTICAR

INSERT INTO Naruto (nombre, aldea, rango, clan, habilidad_especial, edad)
VALUES 
('Naruto Uzumaki', 'Konoha', 'Genin', 'Uzumaki', 'Rasengan', 12),
('Sasuke Uchiha', 'Konoha', 'Genin', 'Uchiha', 'Chidori', 12),
('Kakashi Hatake', 'Konoha', 'Jounin', 'Hatake', 'Raikiri', 26),
('Itachi Uchiha', 'Konoha', 'ANBU', 'Uchiha', 'Tsukuyomi', 21),
('Sakura Haruno', 'Konoha', 'Genin', 'Haruno', 'Control de Chakra', 12),
('Rock Lee', 'Konoha', 'Genin', 'Sin clan', 'Taijutsu', 13),
('Gaara', 'Suna', 'Genin', 'Kazekage', 'Control de Arena', 12),
('Shikamaru Nara', 'Konoha', 'Chunin', 'Nara', 'Control de Sombras', 12),
('Neji Hyuga', 'Konoha', 'Genin', 'Hyuga', 'Byakugan', 13),
('Hinata Hyuga', 'Konoha', 'Genin', 'Hyuga', 'Byakugan', 12),
('Orochimaru', 'Otogakure', 'Sannin', 'Sin clan', 'Reencarnación', 50),
('Jiraiya', 'Konoha', 'Sannin', 'Sin clan', 'Invocación de Sapos', 50),
('Tsunade Senju', 'Konoha', 'Hokage', 'Senju', 'Regeneración', 50),
('Zabuza Momochi', 'Kirigakure', 'Jounin', 'Sin clan', 'Técnicas de Agua', 26),
('Haku', 'Kirigakure', 'Genin', 'Sin clan', 'Control de Hielo', 15);

SELECT * FROM naruto; -- mostrar datos de la tabla naruto

SHOW INDEX FROM Naruto; -- Muestra los indices de una tabla;

SELECT * FROM Naruto WHERE clan = 'Sin clan'; -- buscamos en el campo clan coincidencias conforme a la busqueda realizada, este campo tiene asociado un indice por lo que la busqueda es mas eficiente

-- Busqueda usando Fulltext(simula un buscador de google)
SELECT * FROM Naruto 
WHERE MATCH(nombre, aldea, rango, clan) -- campos en los que se realiza la busqueda
AGAINST('sin clan' IN BOOLEAN MODE); -- retorna valor, si encuentra coincidencias de la busqueda en este caso 'sin clan' en los campos especificados en el WHERE MATCH



-- Insertar indices o llave primaria a una tabla ya creada

CREATE TABLE Naruto (
    id INT UNSIGNED,    
    nombre VARCHAR(100) NOT NULL,            
    aldea VARCHAR(50)NOT NULL,          
    rango VARCHAR(50),                       
    clan VARCHAR(100),                       
    habilidad_especial VARCHAR(100),           
    edad INT
    );


-- Agregar primary_key, constraint = restriccion
 ALTER TABLE Naruto ADD CONSTRAINT pk_naruto_id PRIMARY KEY (id); -- pk_naruto_id es el alias con el que se personaliza la restriccion de la llave primaria

 -- Agregar AUTO_INCREMENT a la primary Key o al campo id, modificados la columna para que sea de tipo entero autoincremental
 
 ALTER TABLE Naruto MODIFY COLUMN id INT AUTO_INCREMENT; 

 -- agregar indice unico al atributo/campo nombre
 ALTER TABLE Naruto ADD CONSTRAINt uq_naruto_nombre UNIQUE (nombre); 

 -- Agregar un indice comun y corriente 
 ALTER TABLE Naruto ADD INDEX i_rango(rango); -- el alias o key name es i_rango
 
 -- Agregar indice que haga referencia a multiples campos
ALTER TABLE Naruto ADD INDEX i_aldea_habilidad (aldea, habilidad_especial);

 -- Agregar indice de tipo FULLTEXT INDEX
ALTER TABLE Naruto ADD FULLTEXT INDEX i_busqueda (nombre, clan, aldea);

-- Renombrar un indice 
-- ALTER TABLE Naruto RENAME INDEX i_busqueda TO fi_busqueda; <- esta forma de renombrar se usa en versiones recientes de sql

-- En MariDb usamos la siguiente forma para renombrar un indice:

ALTER TABLE Naruto DROP INDEX fi_busqueda; -- 1. Borrar el indice/columna/campo fi_busqueda

CREATE FULLTEXT INDEX fi_busqueda ON Naruto(nombre, clan, aldea); -- 2. Crear el indice nuevamente 

-- Eliminar indices 
ALTER TABLE Naruto DROP CONSTRAINT uq_naruto_nombre;
ALTER TABLE Naruto DROP INDEX i_rango;
ALTER TABLE Naruto DROP INDEX i_aldea_habilidad;
 
