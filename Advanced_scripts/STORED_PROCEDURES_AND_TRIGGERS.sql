-- 	SCRIPT ENFOCADO EN LA PRACTICA DE STORED PROCEDURE(procedimientos almacenados) Y TRIGGERS(disparadores)

USE curso_sql;

SHOW TABLES;

-- tabla para almacenar suscripciones
CREATE TABLE suscripciones(
 suscripcion_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 suscripcion VARCHAR(30) NOT NULL,
 precio DECIMAL(5,2) NOT NULL
);

 INSERT INTO suscripciones VALUES 
 (0, "bronce", 199.99),
 (0, "plata", 299.99),
 (0, "oro", 399.99);
 
-- tabla para almacenar clientes
CREATE TABLE clientes (
  cliente_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  correo VARCHAR(50) UNIQUE
);

-- tabla para almacenar tarjetas
CREATE TABLE tarjetas (
  tarjeta_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente INT UNSIGNED,
  tarjeta BLOB,
  FOREIGN KEY (cliente)
    REFERENCES clientes(cliente_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- tabla para gestionar los servicios 
CREATE TABLE servicios(
  servicio_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente INT UNSIGNED,
  tarjeta INT UNSIGNED,
  suscripcion INT UNSIGNED,
  FOREIGN KEY(cliente)
    REFERENCES clientes(cliente_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  FOREIGN KEY(tarjeta)
    REFERENCES tarjetas(tarjeta_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  FOREIGN KEY(suscripcion)
    REFERENCES suscripciones(suscripcion_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- tabla usada en el triggers para gestionar la actividad de los clientes 
CREATE TABLE actividad_clientes(
  ac_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente INT UNSIGNED,
  fecha DATETIME,
  FOREIGN KEY (cliente)
    REFERENCES clientes(cliente_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

SELECT * FROM clientes;
SELECT * FROM suscripciones;
SELECT * FROM tarjetas;
SELECT * FROM servicios;

/* CREACION DE UN STORE PROCEDURE 

DELIMITER // -- se usa para delimitar el predimiento y para que sql reconozca que cada instruccion forma parte del mismo
	CREATE PROCEDURE sp_obtener_subs() -- nombre del procedimiento 
		
		BEGIN -- inicio del procedimiento
			SELECT * FROM suscripciones; 
			
		END // -- fin del procedimiento 
		

DELIMITER ;

LLAMAR AL PROCEDIMIENTO

CALL sp_obtener_subs();

*/

SHOW PROCEDURE STATUS WHERE db = 'curso_sql';--  ver todos los precedure almacenados en una base de datos

DROP PROCEDURE sp_obtener_subs; -- eliminar un procedure



DELIMITER //

-- procedure con parametros de entrada IN y salida OUT
CREATE PROCEDURE sp_asignar_servicio( -- nombre procedure 
  IN i_suscripcion INT UNSIGNED,
  IN i_nombre VARCHAR(30),
  IN i_correo VARCHAR(50),
  IN i_tarjeta VARCHAR(16),
  OUT o_respuesta VARCHAR(50)
)
  
  BEGIN
    
	  -- declaracion de variables locales 
    DECLARE existe_correo INT DEFAULT 0;
    DECLARE cliente_id INT DEFAULT 0;
    DECLARE tarjeta_id INT DEFAULT 0;
    
    START TRANSACTION;
  
  /*
    En caso de encontrar una coincidencia entre correo y i_correo, el valor la funcion COUNT(*) = 1 y se
    le asigna a la variable existe_correo que anteriormente tenia almacenado el valor de 0, y ahora existe_correo = 1.
  */ 
      SELECT COUNT(*) INTO existe_correo
        FROM clientes
        WHERE correo = i_correo; 
      
      IF existe_correo != 0 THEN -- si correo existe es diferente de 0
        
      -- mensaje de retorno en caso de que se cumpla la condicion
        SELECT 'Tu correo ya ha sido registrado' INTO o_respuesta; 
      
      ELSE
      
        INSERT INTO clientes VALUES (0, i_nombre, i_correo);
       
        -- devuelve el último valor generado por una columna con AUTO_INCREMENT en la sesión actual de la base de datos. 
        SELECT LAST_INSERT_ID() INTO cliente_id; 
      
        INSERT INTO tarjetas
          VALUES (0, cliente_id, AES_ENCRYPT(i_tarjeta, cliente_id));-- como secret_key se usa el id del cliente
        SELECT LAST_INSERT_ID() INTO tarjeta_id;
      
        INSERT INTO servicios VALUES (0, cliente_id, tarjeta_id, i_suscripcion);
      
       -- mensaje de retorno en caso de que se cumpla la condicion
        SELECT 'Servicio asignado con éxito' INTO o_respuesta; 
      
      END IF; -- se cierra el if
    
    COMMIT;
    
  END //
  
DELIMITER ;

SELECT * FROM suscripciones;
SELECT * FROM clientes;
SELECT * FROM tarjetas;
SELECT * FROM servicios;
SELECT * FROM actividad_clientes;

-- @res se usa guardar el valor generado por la variable de salida en el procedure 
CALL sp_asignar_servicio(2, 'braily', 'brailyromang@gmail.com', '2239567890123490', @res);

SELECT @res; -- imprimir resultado






/*
Trigger: Es un bloque/evento de código SQL que se ejecuta automáticamente antes o después
de un evento específico en una tabla de la base de datos.

SINTAXIS TRIGGERS:

DELIMITER //
CREATE TRIGGER nombre_disparador
  [BEFORE | AFTER] [INSERT | UPDATE | DELETE]
  ON nombre_tabla_asociada
  FOR EACH ROW
BEGIN
END //
DELIMITER ;

*/

DELIMITER //

CREATE TRIGGER tg_actividad_clientes -- nombre trigger
  AFTER INSERT -- se ejecuta despues de un insert
  ON clientes -- esta asociado a la tabla clientes, por lo que cada vez que ocurra una insercion el trigger se ejecutara
  FOR EACH ROW -- para cada columna, registro que se haga en la tabla clientes

  BEGIN
    										-- new extrae los nuevos registros realizados en la tabla clientes
    INSERT INTO actividad_clientes VALUES (0, NEW.cliente_id, NOW());
    
  END //

DELIMITER ;


SHOW TRIGGERS FROM curso_sql; -- mostrar triggers en la base de datos
DROP TRIGGER tg_actividad_clientes; -- eliminar un trigge