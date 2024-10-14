-- GROUP BY Agrupa los resultados en función de una o más columnas.

-- se agrupa la tabla mediante el nombre y se organiza en funcion del precio maximo
SELECT nombre,precio, MAX(precio) AS precio_maximo FROM productos GROUP BY  nombre, precio; 
-- agrupa la tabla en funcion de los precios y nombres, es decir, trea las dos columnas  y con ORDER BY se ordenan los resultados en orden ascendente o descendente
SELECT nombre,precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio ORDER BY precio_maximo DESC; 

-- Siempre que se usa en cojunto a las funciones de agrupamiento, se debe colocar GROUP BY para que se muestren todos los registros 
SELECT tipo, COUNT(*) AS total_tipos FROM Pokemones GROUP BY tipo; -- Selecciona la columna tipo de la tabla pokemon, y con COUNT se hace un conteo de los diferentes tipos de pokemones
SELECT nivel, COUNT(*) AS total_niveles FROM Pokemones GROUP BY nivel; -- Selecciona la columna tipo de la tabla pokemon, y con COUNT se hace un conteo de los diferentes tipos de pokemones

-- USO DE WHERE CON GROUP BY
SELECT tipo, COUNT(*) AS total FROM Pokemones WHERE tipo = "Agua" GROUP BY tipo;

-- AGREGANDO HAVING AL QUERY, having filtra los resultados de GROUP BY
SELECT tipo, COUNT(*) AS total FROM Pokemones WHERE tipo = "Agua" GROUP BY tipo HAVING total >= 2; -- HAVING FILTRA LOS RESULTADOS DE GROUP BY

SELECT nombre,precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio  HAVING precio > 100 ORDER BY precio_maximo DESC; -- HAVING FILTRA LOS RESULTADOS EN LA COLUMNA PRECIO_MAXIMO QUE SEAN MAYORES A 100
