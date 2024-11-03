-- SUBCONSULTAS
-- definicion: son consultas anidadas dentro de otra consulta más grande.
-- son utiles para recuperar datos que luego serán utilizados como criterio o filtro en la consulta principal. 

SELECT aldea_nombre, -- consulta principal
 (SELECT COUNT(*) FROM personajes p WHERE p.aldea = a.aldea_id) -- subconsulta, hace un conteo de todas las coincidencias de ids de la tabla personajes con la tabla aldea
  AS total_ninjas_x_aldeas -- nombre del campo que almacena la subconsulta
FROM aldeas a;

-- la consulta principal trae el nombre de los clanes, mientras que la subconsulta hace un conteo de todsas las coincidencias en el campo p.clan con c.clan_id
SELECT clan_nombre,
 (SELECT COUNT(*) FROM personajes p WHERE p.clan = c.clan_id)
  AS total_clan_x_ninja -- campo generado dinamicamente
FROM clanes c;

SELECT habilidad_nombre,
	(SELECT COUNT(*) FROM personajes p WHERE p.habilidad = h.habilidad_id)
	AS habilidades_x_personajes
FROM habilidades h;