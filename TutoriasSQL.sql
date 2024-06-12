-- Active: 1715003786902@@127.0.0.1@5432@tutorias







drop table if exists mensajes cascade;
drop table if exists usuarios cascade;
drop table if exists materias_alumnos cascade;
drop table if exists tutorias cascade;
drop table if exists notas cascade;
drop table if exists alumnos cascade;
drop table if exists tutores cascade;
drop table if exists estatus cascade;
drop table if exists materias cascade;
drop table if exists areas cascade;


--------------------------------------------------------------------------------------
create table areas (
    idAreas serial PRIMARY KEY,
    nombre text
);
--------------------------------------------------------------------------------------

create table estatus (
    idEstatus serial PRIMARY KEY,
    nombreEstatus text,
    descripcion text
);
--------------------------------------------------------------------------------------

create table tutores (
    idTutores serial PRIMARY KEY,
    nombre text,
    segundoNombre text,
    apPaterno text,
    apMaterno text,
    fechaNac DATE,
    numero text,
    correo text,
    direccion text,
    contra text,
    fkEstatus int,
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);
--------------------------------------------------------------------------------------

create table alumnos (
    matricula varchar(9) PRIMARY KEY,
    nombre varchar,
    segundoNombre varchar,
    apPaterno varchar,
    apMaterno varchar,
    fechaNac DATE,
    numero varchar,
    correo varchar,
    direccion varchar,
    contra varchar,
    carrera varchar,
    semestre int,
    fkTutor int,
    fkEstatus int,
    Foreign Key (fkTutor) REFERENCES tutores (idTutores),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);
--------------------------------------------------------------------------------------

create table materias (
    idMaterias serial PRIMARY KEY,
    nombre varchar,
    creditos int,
    fkArea int,
    Foreign Key (fkArea) REFERENCES areas (idAreas)
);
--------------------------------------------------------------------------------------

create table notas (
    idNotas serial PRIMARY KEY,
    fkTutor int,
    fkAlumno varchar,
    notas text,
    Foreign Key (fkTutor) REFERENCES tutores (idTutores),
    Foreign Key (fkAlumno) REFERENCES alumnos (matricula)
);
--------------------------------------------------------------------------------------

create table tutorias (
    idTutorias serial PRIMARY KEY,
    fecha Date,
    contexto text,
    duracion int,
    fkAlumno varchar,
    fkTutor int,
    fkEstatus int,
    Foreign Key (fkTutor) REFERENCES tutores (idTutores),
    Foreign Key (fkAlumno) REFERENCES alumnos (matricula),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);
--------------------------------------------------------------------------------------

create table materias_alumnos (
    fkMaterias int,
    fkAlumnos varchar,
    fkEstatus int,
    inscripcion int,
    calificacion int,
    Foreign Key (fkAlumnos) REFERENCES alumnos (matricula),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus),
    Foreign Key (fkMaterias) REFERENCES materias (idMaterias)
);
--------------------------------------------------------------------------------------

create table mensajes (
    idMensajes serial PRIMARY KEY,
    mensaje text,
    asunto text,
    fecha DATE,
    fkTutor int,
    fkAlumno varchar,
    fkEstatus int,
    Foreign Key (fkTutor) REFERENCES tutores (idTutores),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus),
    Foreign Key (fkAlumno) REFERENCES alumnos (matricula)
);
--------------------------------------------------------------------------------------


-- Insertar en la tabla de áreas
INSERT INTO areas (nombre) VALUES ('Área 1');
INSERT INTO areas (nombre) VALUES ('Área 2');
-- Puedes agregar más inserciones según sea necesario para las áreas

-- Insertar en la tabla de estatus
INSERT INTO estatus (nombreEstatus, descripcion) VALUES ('Activo', 'Estado activo');
INSERT INTO estatus (nombreEstatus, descripcion) VALUES ('Inactivo', 'Estado inactivo');
-- Puedes agregar más inserciones según sea necesario para los estatus

-- Insertar en la tabla de tutores
INSERT INTO tutores (nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus)
VALUES ('Juan', 'Carlos', 'Pérez', 'Gómez', '1990-05-15', '555-123-4567', 'juan@example.com', 'Calle Principal 123', 'contraseña123', 1);
-- Puedes agregar más inserciones para tutores

-- Insertar en la tabla de alumnos
INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus)
VALUES ('s20004426', 'María', 'Isabel', 'García', 'López', '1995-08-25', '555-987-6543', 'maria@example.com', 'Avenida Secundaria 456', 'contraseña456', 'Licenciatura en Administración', 2, 1, 1);




-- Insertar en la tabla de materias
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Materia 1', 5, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Materia 2', 4, 2);
-- Puedes agregar más inserciones para materias

-- Insertar en la tabla de notas
INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (1, 's20004426', 'Notas del alumno A12345678');
INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (1, 's20004426', 'Notas del alumno A12345678');

-- Puedes agregar más inserciones para notas

-- Insertar en la tabla de tutorías
INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES ('2024-05-29', 'Contexto de la tutoría', 60, 's20004426', 1, 1);
INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES ('2024-06-05', 'Otro contexto de la tutoría', 45, 's20004426', 1, 1);
-- Puedes agregar más inserciones para tutorías

-- Insertar en la tabla de materias_alumnos
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (1, 's20004426', 1, 2023, 90);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (1, 's20004426', 1, 2022, 85);
-- Puedes agregar más inserciones para materias_alumnos

-- Insertar en la tabla de mensajes
INSERT INTO mensajes (mensaje, asunto, fecha, fkTutor, fkAlumno) VALUES ('Mensaje de prueba', 'Hola profe', '2024-06-05', 1, 's20004426');
INSERT INTO mensajes (mensaje, asunto, fecha, fkTutor, fkAlumno) VALUES ('Otro mensaje de prueba', 'Tengo dudas maestro', '2024-06-05', 1, 's20004426');
-- Puedes agregar más inserciones para mensajes
