-- Los `JOINs` en SQL se utilizan para combinar datos de dos o más tablas basándose en una columna relacionada.

-- JOINS AND UNIONS, la "tabla de la izquierda" es la primera tabla.

-- LEFT JOIN Devuelve todas las filas de la tabla de la izquierda y las coincidencias de la derecha. 
-- Si no hay coincidencia, rellena con `NULL`
SELECT * FROM personajes p 
LEFT JOIN habilidades h ON p.habilidad = h.habilidad_id;

-- RIGHT JOIN Devuelve todas las filas de la tabla de la derecha y las coincidencias de la izquierda. 
-- Si no hay coincidencia, rellena con `NULL`.
SELECT * FROM personajes p 
RIGHT JOIN habilidades h 
ON p.habilidad = h.habilidad_id;


-- Devuelve solo las filas que tienen coincidencias en ambas tablas(izquierda y derecha).
SELECT * FROM personajes p 
INNER JOIN habilidades h 
ON p.habilidad = h.habilidad_id;

-- Devuelve todas las filas cuando hay coincidencia en una tabla o en ambas. 
-- Rellena con `NULL` donde no haya coincidencias.
-- Ya que en MySQL y MariaDB no estan permitidos los FULL JOINS toca hacer uso de los UNIONS, que permiten unir dos joins o subcoonsultas.
SELECT * FROM personajes p 
LEFT JOIN habilidades h ON p.habilidad = h.habilidad_id
UNION -- Sirve para unir subconsultas
SELECT * FROM personajes p 
RIGHT JOIN habilidades h ON p.habilidad = h.habilidad_id;


-- JOINS DE MULTIPLES TABLAS
SELECT p.id, p.nombre, c.clan_nombre, a.aldea_nombre, h.habilidad_nombre -- estos son los nombres de los campos que queremos mostrar con caada unos de los joins
FROM personajes p -- tabla principal en la que se realizan los joins
INNER JOIN clanes c ON p.clan = c.clan_id -- el campo p.clan de la tabla personajes se asocia con el campo c.clan_id de la tabla clanes
INNER JOIN aldeas a ON p.aldea = a.aldea_id -- el campo p.aldea de la tabla personajes se asocia con el campo a.aldea_id de la tabla aldeas
INNER JOIN habilidades h ON p.habilidad = h.habilidad_id -- el campo p.habilidad de la tabla personajes se asocia con el campo h.habilidad_id de la tabla habilidades


SELECT p.nombre, h.habilidad_nombre -- campos a mostrar en caso de encontrar coincidencias en el inner join
FROM personajes p
INNER JOIN habilidades h ON p.habilidad = h.habilidad_id; 