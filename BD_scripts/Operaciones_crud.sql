-- SENTENCIAS PARA HACER LAS OPERACIONES CRUD

-- CREAR UN REGISTRO/INSERTAR DATOS(CREATE)

-- mala practica
INSERT INTO ejemplo_tabla VALUES(0, "Jerlinson", "Gomez", 83298298,"Direccin de jerlinson", 89);
 -- forma mas usada
INSERT INTO ejemplo_tabla (nombre, apellido, telefono) VALUES ("Juan ", "Emilio", 9849389);
 -- otra forma
INSERT INTO ejemplo_tabla SET nombre = "Federico", apellido = "Valerio", telefono = 202200202;
-- agregar multiples valores a los atributos
INSERT INTO ejemplo_tabla (nombre, apellido, telefono) VALUES
		("Edwin", "roman", 08934030),
		("Braily", "roman", 43908408);


-- LEER UN REGISTRO (READ)
SELECT * FROM ejemplo_tabla; -- el asterisco indica que se deben mostrar todos los registros de esa tabla