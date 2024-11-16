/* TRANSACCIONES: 
Son una secuencia de operaciones que se ejecutan como una única unidad de trabajo lógica
Las transacciones son esenciales para manejar operaciones complejas que afectan múltiples tablas o filas, 
asegurando que se cumplan las reglas de negocio incluso en situaciones de errores o fallos.
  */

START TRANSACTION;
	UPDATE lenguajes SET lenguaje = "JavaScript" WHERE lenguaje_id = 5;
	UPDATE lenguajes SET lenguaje = "Android" WHERE lenguaje_id = 1;
	UPDATE lenguajes SET lenguaje = "Perro" WHERE lenguaje_id = 2;
	UPDATE lenguajes SET lenguaje = "Gallo" WHERE lenguaje_id = 3;
	
	INSERT INTO lenguajes VALUES 
	(0, "Java");
	INSERT INTO lenguajes VALUES 
	(0, "Dart");
	INSERT INTO lenguajes VALUES 
	(0, "Go");
	

	
ROLLBACK; -- REVERTIR CAMBIOS(scripts ejecutados en la transaccion)
COMMIT; -- CONFIRMAR CAMBIOS (scripts ejecutados en la transaccion)
 

/* USO DE LIMIT 
 * LIMIT [posicion_inicial], [cant_filas]
 * Ojo: si no se indica la posicion inicial SQL, por defecto se coloca 0.
 * */

SELECT * FROM frameworks LIMIT 2; -- salta 0 filas, muestra 2 resultados.
SELECT * FROM frameworks LIMIT 0, 4; -- salta 0 filas y muestra 4 resultados.
SELECT * FROM frameworks LIMIT 2, 4; -- salta 2 filas y muestra las siguientes filas 4 en 4;
SELECT * FROM frameworks LIMIT 4, 2; -- salta 4 filas y muestra las siguientes filas de 2 en 2