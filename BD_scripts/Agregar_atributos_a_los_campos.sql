-- AGREGAR CARACTERISTICAS A LOS CAMPOS DE UNA TABLA

CREATE TABLE nombre_tabla(
    --este atributo no puede contener numeros negativos, los valores son autoincrementables y es una llave primaria
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	apellido VARCHAR(50)NOT NULL, -- no puede ser nulo
	telefono INTEGER(50) UNIQUE NOT NULL --es un campo unico y no puede ser nulo
    direccion VARCHAR(100) DEFAULT "Sin direccion", --el campo no es obligatorio, se le agrego un valor por defecto en caso de dejarse vacio,
    edad INT DEFAULT 0; --cero por defecto
);