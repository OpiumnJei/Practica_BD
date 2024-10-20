-- EXPRESIONES REGULARES EN SQL, son una poderosa herramienta para realizar búsquedas y manipulaciones de texto.

SELECT * FROM productos WHERE nombre REGEXP '[m-z]'; -- filtras resultados en donde la inicial entra en el rango de m - z.

SELECT * FROM pokemones WHERE nivel REGEXP '[0-9]'; -- filtra resultados que contengan valores numerico del 0 al 9

SELECT * FROM productos WHERE nombre REGEXP '[0-9]'; -- filtra resultados que contengan valores numerico del 0 al 9