-- Def: Una vista es una forma de simplificar y reutilizar consultas complejas, 
-- ya que permite a los usuarios acceder a datos específicos
-- de una o varias tablas sin tener que escribir una consulta completa cada vez.
-- Las vistas en SQL son consultas almacenadas que actúan como tablas virtuales.

-- crear una vista usando una join
CREATE VIEW vista_personajes_naruto AS
 SELECT p.id, p.nombre, c.clan_nombre, a.aldea_nombre, h.habilidad_nombre -- estos son los nombres de los campos que queremos mostrar con cada uno de los joins
	FROM personajes p -- tabla principal en la que se realizan los joins
	INNER JOIN clanes c ON p.clan = c.clan_id -- el campo p.clan de la tabla personajes se asocia con el campo c.clan_id de la tabla clanes
	INNER JOIN aldeas a ON p.aldea = a.aldea_id -- el campo p.aldea de la tabla personajes se asocia con el campo a.aldea_id de la tabla aldeas
	INNER JOIN habilidades h ON p.habilidad = h.habilidad_id -- el campo p.habilidad de la tabla personajes se asocia con el campo h.habilidad_id de la tabla habilidades

-- crear una vista usando una subconsulta 
CREATE VIEW vista_cantidad_clanes_x_personaje AS
	SELECT clan_nombre,
 	(SELECT COUNT(*) FROM personajes p WHERE p.clan = c.clan_id)
 		 AS total_clan_x_ninja -- campo generado dinamicamente
	FROM clanes c;

-- consultar datos de una vista
SELECT * FROM vista_personajes_naruto vpn;
SELECT * FROM vista_cantidad_clanes_x_personaje;

-- eliminar una vista
DROP VIEW vista_personajes_naruto;

-- consultar todas las vistas almacenadas en nuestra base de datos
SHOW FULL TABLES IN curso_sql WHERE TABLE_TYPE LIKE 'VIEW';