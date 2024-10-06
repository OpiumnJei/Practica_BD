-- Si es que 'nombre_ejemplo' no existe, se ejecuta el comando que crea la base de datos

CREATE DATABASE IF NOT EXISTS nombre_ejemplo;

-- Si es que 'nombre_ejemplo' existe, se ejecuta el comando que elimina la base de datos

DROP DATABASE IF EXISTS nombre_ejemplo;