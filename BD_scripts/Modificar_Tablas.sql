-- modificar las propiedades de una tabla --

-- Para agregar una nueva columna/atributo a nuestra tabla
ALTER TABLE nombre_tabla ADD COLUMN nombre_columna TIPO_DE_DATO; --tipo de dato

-- Ejemplo: 
ALTER TABLE usuarios ADD COLUMN numero_telefonico INTEGER;

-- con MODIFY modificamos algun atributo/columna
ALTER TABLE nombre_tabla MODIFY nombre_columna TIPO_DE_DATO;
-- Ejemplo: 
ALTER TABLE usuarios1 MODIFY numero_telefonico INTEGER(20);

-- cambiar el nombre a una columna;
ALTER TABLE nombre_tabla RENAME COLUMN nombre_actual TO nuevo_nombre; --En MySql

ALTER TABLE nombre_tabla CHANGE nombre_actual  nuevo_nombre TIPO_DE_DATO; -- En mariaDB

-- Ejemplo: 
ALTER TABLE usuarios1 CHANGE correo correo_electronico VARCHAR(100);

-- eliminar una columna
ALTER TABLE usuarios1 DROP COLUMN numero_telefonico;

-- eliminar una tabla
DROP TABLE nombre_tabla;