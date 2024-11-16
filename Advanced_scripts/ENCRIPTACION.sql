/*
 * ENCRIPTACION:
 *La encriptación en SQL se utiliza para proteger los datos sensibles almacenados en una base de datos.
 * 
 * 
 * Algoritmos que usa MySQL para encriptar: 
 * 
 * 1 - AES_ENCRYPT
 * 2 - MD5
 * 3 - SHA1
 * 4 - SHA2
 * */

USE curso_sql;

SELECT MD5("Esta es mi contrasenia");
SELECT SHA1("Esta es mi contrasenia");
SELECT SHA2("Esta es mi contrasenia", 256);
SELECT AES_ENCRYPT("Esta es mi contrasenia", "secret_key");


CREATE TABLE cuentas_bancarias(
	num_cuenta VARCHAR(15) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	tarjeta BLOB
);

-- INSERCION CON DATOS ENCRIPTADOS
INSERT INTO cuentas_bancarias VALUES
('187483743312', 'Federico', AES_ENCRYPT('308043049303', 'secret_key')),
('287483743312', 'Juan', AES_ENCRYPT('408043049303', 'secret_key')),
('387483743312', 'Julia', AES_ENCRYPT('508043049303', 'secret_key')),
('487483743312', 'Jerlinson', AES_ENCRYPT('608043049303', 'secret_key')),
('587483743312', 'Antonio', AES_ENCRYPT('708043049303', 'secret_key'));

SELECT * FROM cuentas_bancarias;

UPDATE cuentas_bancarias SET tarjeta = AES_ENCRYPT('708043049303', '12345') WHERE nombre = 'Antonio';

/*
 * DESENCRIPTAR LOS DATOS USANDO CASTING
 * CAST('Dato_a_convertir' AS 'tipo_dato_resultante_de_la_conversion') AS nombre_campo;
 */
 
SELECT CAST(AES_DECRYPT(tarjeta, 'secret_key') AS CHAR) AS datos_desencriptados, nombre
FROM cuentas_bancarias;

SELECT CAST(AES_DECRYPT(tarjeta, '12345') AS CHAR) AS datos_desencriptados, nombre
FROM cuentas_bancarias;

SELECT CAST(100000 AS CHAR) as conversion;
SELECT CAST('100000'AS INTEGER) as conversion;

