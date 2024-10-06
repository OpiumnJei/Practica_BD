
/*
La creacion de un usuario se compone de dos partes,
'nombre_usuario'@'nombre_servidor' y la contrasenia o 'IDENTIFIED'
*/

CREATE USER IF NOT EXISTS 'jerlinson1'@'localhost' IDENTIFIED BY '1234'

--Para asignarle privilegios a un usuario en especifico, 
-- con 'GRANT' se conceden todos los permisos
GRANT ALL PRIVILEGES ON para_jerlinson.* TO 'jerlinson1'@'localhost';

-- para que se efectuen los cambios en otros scripts de la misma base de datos o algo asi :)
FLUSH PRIVILEGES;

-- para ver los privilegios que posee un usuario
SHOW GRANTS FOR 'jerlinson1'@'localhost';

-- para eliminar todos los permisos o privilegios de un usuario
REVOKE ALL,GRANT OPTION FROM 'jerlinson1'@'localhost'

-- eliminar un usuario
DROP USER 'jerlinson1'@'localhost';
