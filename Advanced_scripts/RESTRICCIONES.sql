/* 
 Motores de busqueda o motores de almacenamiento:
 son sistemas que permiten almacenar, gestionar y recuperar datos de manera eficiente. 
 MySQL 5.0 y versiones anteriores: MyISAM era el motor de almacenamiento predeterminado.
 MySQL 5.5 y versiones posteriores: InnoDB se convirtió en el motor predeterminado.
 */

-- indicar manualmente el motor de busqueda que usara la tabla y el character set
CREATE TABLE tabla_myisam(
	aldea_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	aldea_nombre VARCHAR(30) NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE tabla_innoDB(
	aldea_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	aldea_nombre VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- indicar el juego de caracteres que se utilizara en la tabla
CREATE TABLE aldeas(
	aldea_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	aldea_nombre VARCHAR(30) NOT NULL
)DEFAULT CHARSET=utf8mb4; -- character set (juego de caracteres) estandar 

/* 
RESTRICCIONES: 
las restricciones son reglas que se aplican a las columnas de una tabla para garantizar 
la integridad y validez de los datos que se almacenan en la base de datos.

RESTRICCIONES (DELETE Y UPDATE)
  - CASCADE: si se elimina un campo de la tabla padre tambien se elimina en la tabla hija.
  - SET NULL: si se elimina un campo de la tabla padre en la tabla hija se rellena el espacio con null.
  - SET DEFAULT: 
  - RESTRICT: restringe la eliminacion o actualizacion de un campo en la tabla padre.
*/ 

-- TABLA PARA LENGUAJES 
CREATE TABLE lenguajes (
  lenguaje_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  lenguaje VARCHAR(30) NOT NULL DEFAULT 'no lenguaje'
);

-- INSERCION DE DATOS
INSERT INTO lenguajes (lenguaje) VALUES
  ("JavaScript"),
  ("PHP"),
  ("Python"),
  ("Ruby"),
  ("JAVA");
 
 -- TABLA PARA FRAMEWORKS CON RESTRICCION POR DEFAULT
 CREATE TABLE frameworks (
  framework_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  framework VARCHAR(30) NOT NULL,
  lenguaje INT UNSIGNED,
  FOREIGN KEY (lenguaje) REFERENCES lenguajes(lenguaje_id)
);

 -- TABLA PARA FRAMEWORKS CON RESTRICT Y CASCADE PARA (DELETE Y UPDATE) 
 CREATE TABLE frameworks (
  framework_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  framework VARCHAR(30) NOT NULL,
  lenguaje INT UNSIGNED,
  FOREIGN KEY (lenguaje) REFERENCES lenguajes(lenguaje_id)
 	ON DELETE SET NULl ON UPDATE CASCADE -- los campos se actualizan en cascada y en campos vacios o eliminados de la tabla padre se rellena con null
);

 CREATE TABLE frameworks (
  framework_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  framework VARCHAR(30) NOT NULL,
  lenguaje INT UNSIGNED,
  FOREIGN KEY (lenguaje) REFERENCES lenguajes(lenguaje_id)
 	ON DELETE RESTRICT ON UPDATE CASCADE -- se restringe la eliminacion de campos y se actualiza en cascada
);

-- INSERCION
INSERT INTO frameworks (framework, lenguaje) VALUES
  ("React", 1),
  ("Angular", 1),
  ("Vue", 1),
  ("Svelte", 1),
  ("Laravel", 2),
  ("Symfony", 2),
  ("Flask", 3),
  ("Django", 3),
  ("On Rails", 4);

 -- join entre frameworks y lenguajes
 SELECT * FROM frameworks f
 	INNER JOIN lenguajes l 
    ON f.lenguaje = l.lenguaje_id;
 
 SELECT * FROM frameworks f
 	LEFT JOIN lenguajes l 
    ON f.lenguaje = l.lenguaje_id;
 
   
SELECT * FROM lenguajes;
SELECT * FROM frameworks;
   
-- campos para hacer pruebas con las restricciones  
DELETE FROM lenguajes WHERE lenguaje_id =1; 
UPDATE lenguajes SET lenguaje_id = 7 WHERE lenguaje_id = 2; 

DROP TABLE frameworks;
DROP TABLE lenguajes;