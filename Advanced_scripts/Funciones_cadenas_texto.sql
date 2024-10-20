-- FUNCIONES DE CADENAS DE TEXTO

SELECT 'hola mundo'; 
SELECT UPPER('Hola Mundo'); -- convertir a mayusculas
SELECT UCASE('Hola Mundo'); -- convertir a mayusculas
SELECT LOWER('Hola Mundo'); -- convertir a minusculas
SELECT LCASE('Hola Mundo'); -- convertir a minusculas
SELECT LENGTH('Hola Mundo'); -- retorna la longitud de la cadena
SELECT LEFT('Hola Mundo', 3); -- sustrae 3 valores de la cadena de texto, empezando de izquierda a derecha "Hol"
SELECT RIGHT('Hola Mundo', 3); -- sustrae 3 valores de la cadena de texto, empezando de derecha a izquierda "ndo"
SELECT REPEAT('Jerlinson Gonzalez', 4); -- repite una cadena de texto, una x cantidad de veces en este caso 4 veces.
SELECT REVERSE('nosnilreJ'); -- invierte una cadena de texto 
SELECT REPLACE('Ramona Genao', 'a', 'o'); -- primero se pasa la cadena, luego se pasa el caracter que se quiere reemplazar, luego se pasa el caracter de reemplazo
SELECT TRIM('   Rosi la loca   '); -- elimina espacios en blanco, tanto al inicio, como al final.
SELECT CONCAT('I hate everithing, ', ' about you'); -- concatena dos o mas cadenas de texto
SELECT CONCAT_WS(' - ', 'Word', 'Mundo', ' Apple', 'Manzana'); -- aparte de concatenar dos o mas cadenas de texto, agrega un separador en medio de la concatenacion, en este caso el separador es '-';

-- USO

SELECT UPPER(nombre), LENGTH(nombre) As Longitud_nombre FROM pokemones;
SELECT LCASE(nombre), REPEAT(tipo, 2) FROM pokemones;