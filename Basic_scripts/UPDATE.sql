-- ACTUALIZAR UN REGISTRO(UPDATE)
 
-- LA SENTENCIA UPDATE SIEMPRE DEBE IR ACOMPAÑADA DE LA CLAUSULA WHERE 
 
UPDATE ejemplo_tabla SET direccion = "Direccion de juan", edad = 23 WHERE usuario_id = 2; -- SIEMPRE USAR WHERE PARA ESPECIFICAR QUE CAMPO SE VA A ACTUALIZAR

UPDATE ejemplo_tabla SET direccion = "Direccion de Federico", edad = 29 WHERE usuario_id = 3;

UPDATE ejemplo_tabla SET edad = 30 WHERE usuario_id = 6;