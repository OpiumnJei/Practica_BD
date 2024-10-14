-- ORDER BY, Ordena los resultados de una consulta de manera ascendente o descendente.

-- USO DE ORDER BY, por defecto se usa el agrupamiento ascendente
SELECT * FROM Pokemones ORDER BY nombre; -- ordena los nombres en orden ascendente
SELECT * FROM Pokemones ORDER BY tipo; -- ordena los tipos en orden ascendente

SELECT * FROM Pokemones ORDER BY nivel DESC; -- ordena los niveles en orden descendente
SELECT * FROM Pokemones ORDER BY nivel, tipo; 
SELECT * FROM Pokemones WHERE tipo = "Planta" ORDER BY ataque DESC; -- selcciona todos los registros donde los pokemones sean del tipo planta, luego se ordena el ataque en orden Descendente

SELECT nombre,precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio HAVING precio > 100 ORDER BY nombre DESC; 