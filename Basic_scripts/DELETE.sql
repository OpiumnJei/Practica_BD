-- ELIMINAR UN REGISTRO (DELETE)

-- LA SENTENCIA DELETE SIEMPRE DEBE IR ACOMPAÑADA DE LA CLAUSULA WHERE 
DELETE FROM ejemplo_tabla WHERE usuario_id = 7;

DELETE FROM ejemplo_tabla; -- ELIMINA POR COMPLETO LA TABLA

TRUNCATE TABLE ejemplo_tabla; -- SE USA PARA REINICIAR UNA TABLA