-- La clave foránea permite vincular datos entre tablas de manera que se mantenga la integridad referencial.

-- SINTAXIS PARA DECLARAR UNA FOREIGN KEY:
-- FOREIGN KEY(nombre-campo-en-tabla) REFERENCES nombre-tabla-referente(campo-referente)

CREATE TABLE personajes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,    
    nombre VARCHAR(100) NOT NULL,            
    aldea INT UNSIGNED,          
    rango INT UNSIGNED,                       
    clan INT UNSIGNED,                       
    habilidad INT UNSIGNED,           
    edad INT,
    FOREIGN KEY(aldea) REFERENCES aldeas(aldea_id), 
    FOREIGN KEY(rango) REFERENCES rangos(rango_id),
    FOREIGN KEY(clan) REFERENCES clanes(clan_id),
    FOREIGN KEY(habilidad) REFERENCES habilidades(habilidad_id)
    );
   