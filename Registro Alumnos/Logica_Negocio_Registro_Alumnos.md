# Registro Alumnos de una institucion academica

## Lista de entidades

### Alumnos (ED)

- Alumno_ID (PK)
- Nombre
- Apellido 
- Edad
- Grado_ID(FK)
- Calificacion

### Grados (EC)

 - Grado_ID(PK)
 - nombre_grado

### Relaciones

- **Alumno** esta en un **Grado** (1 a 1).

### Reglas de negocio (Operaciones CRUD - Create, Read, Update, Delete)

### Alumnos

 1. Crear un registro de un alumno.
 1. Leer los datos registrados de un alumno.
 1. Leer un registro especifico de un alumno.
 1. Actualizar el registro de un alumno.
 1. Eliminar el registro de un alumno.

### Grados 

 1. Crear un registro de un grado.
 1. Leer los datos registrados de un grado.
 1. Leer un registro especifico de un grado.
 1. Actualizar el registro de un grado.
 1. Eliminar el registro de un grado.