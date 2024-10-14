-- LAS FUNCIONES DE AGRUPAMIENTO PERMITEN REALIZAR CALCULOS SOBRE UN CONJUNTO DE DATOS

SELECT SUM(cantidad) AS sumatoria FROM productos; -- calcular la sumatoria de una columna
SELECT MAX(precio) AS precio_maximo FROM productos; -- busca el valor maximo en una columna 
SELECT MIN(precio) AS precio_minimo FROM productos; -- busca el valor minimo en una columna 
SELECT AVG(precio) AS promedio FROM productos; -- calcular el promedio de una columna 
SELECT COUNT(*) AS cantidad_filas FROM productos; -- retorna la cantidad de filas de una columna