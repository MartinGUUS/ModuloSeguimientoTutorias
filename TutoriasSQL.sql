-- Active: 1718340788917@@127.0.0.1@5432@tutorias



--create database tutorias



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


INSERT INTO areas (nombre) VALUES ('Area formación basica');
INSERT INTO areas (nombre) VALUES ('Area formación disciplinaria');
INSERT INTO areas (nombre) VALUES ('Area formación terminal');
INSERT INTO areas (nombre) VALUES ('Area formación libre');







INSERT INTO estatus (nombreEstatus, descripcion) VALUES ('Activo', 'Estado activo');
INSERT INTO estatus (nombreEstatus, descripcion) VALUES ('Inactivo', 'Estado inactivo');




INSERT INTO tutores (nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus)
VALUES ('Juan', 'Carlos', 'Pérez', 'Gómez', '1990-05-15', '5551234567', 'juan@example.com', 'Calle Principal 123', 'contraseña123', 1);





INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus)
VALUES ('S20004426', 'María', 'Isabel', 'García', 'López', '1995-08-25', '5559876543', 'maria@example.com', 'Avenida Secundaria 456', 'contraseña456', 'Ingeniería en Electrónica y Comunicaciones', 6, 1, 1);

INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus)
VALUES ('S20004425', 'Martin', 'Gustavo', 'Acosta', 'Romero', '2002-12-01', '2295233407', 'martin@example.com', 'Avenida Secundaria 456', 'contraseña456', 'Ingeniería en Electrónica y Comunicaciones', 2, 1, 1);

INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, correo, numero, direccion, fechaNac, carrera, semestre, fkTutor) VALUES 
('S00000001', 'Juan', 'Carlos', 'Gomez', 'Perez', 'juan.carlos.gomez@ejemplo.com', '5551234567', 'Calle 123, Ciudad', '2000-01-01', 'Ingeniería Informática', 1, 1),
('S00000002', 'Ana', 'Maria', 'Lopez', 'Martinez', 'ana.maria.lopez@ejemplo.com', '5551234568', 'Avenida 456, Ciudad', '1999-02-01', 'Ingeniería Mecatrónica', 1, 1),
('S00000003', 'Luis', 'Fernando', 'Hernandez', 'Garcia', 'luis.fernando.hernandez@ejemplo.com', '5551234569', 'Boulevard 789, Ciudad', '1998-03-01', 'Ingeniería Civil', 1, 1),
('S00000004', 'Maria', 'Luisa', 'Ramirez', 'Sanchez', 'maria.luisa.ramirez@ejemplo.com', '5551234570', 'Calle 101, Ciudad', '2001-04-01', 'Ingeniería Química', 1, 1),
('S00000005', 'Jose', 'Manuel', 'Vega', 'Torres', 'jose.manuel.vega@ejemplo.com', '5551234571', 'Avenida 102, Ciudad', '1997-05-01', 'Ingeniería Industrial', 1, 1),
('S00000006', 'Sofia', 'Isabel', 'Gonzalez', 'Morales', 'sofia.isabel.gonzalez@ejemplo.com', '5551234572', 'Boulevard 103, Ciudad', '2002-06-01', 'Ingeniería Topográfica', 1, 1),
('S00000007', 'Carlos', 'Eduardo', 'Diaz', 'Ortiz', 'carlos.eduardo.diaz@ejemplo.com', '5551234573', 'Calle 104, Ciudad', '1996-07-01', 'Ingeniería Mecánica Eléctrica', 1, 1),
('S00000008', 'Laura', 'Beatriz', 'Castro', 'Nunez', 'laura.beatriz.castro@ejemplo.com', '5551234574', 'Avenida 105, Ciudad', '2000-08-01', 'Ingeniería Informática', 1, 1),
('S00000009', 'Ricardo', 'Antonio', 'Martinez', 'Ruiz', 'ricardo.antonio.martinez@ejemplo.com', '5551234575', 'Boulevard 106, Ciudad', '1999-09-01', 'Ingeniería en Electrónica y Comunicaciones', 1, 1),
('S00000010', 'Patricia', 'Alejandra', 'Sosa', 'Jimenez', 'patricia.alejandra.sosa@ejemplo.com', '5551234576', 'Calle 107, Ciudad', '2001-10-01', 'Ingeniería Mecatrónica', 1, 1);




INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Precalculo', 6, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Quimica', 6, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Física', 6, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Lectura y Redacción de Textos Académicos', 8, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Literacidad Digital', 8, 3);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Pensamiento Crítico para la Resolución de Problemas', 8, 3);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Lengua I', 4, 4);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Lengua II', 4, 4);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Geometría Analítica', 6, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Cálculo de una Variable', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Cálculo Multivariable', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Álgebra Lineal', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Probabilidad y Estadística', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Técnicas de Medición', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Fund. de Redes de Computadoras', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Redes de Computadoras', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Métodos Numéricos', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Ecuaciones Diferenciales', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Sistemas Operativos', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Bases de Datos', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Diseño y Análisis de Algoritmos', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Introducción a la Inteligencia Artificial', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Grafificación por Computadora', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Ingeniería de Software', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Microcontroladores y Microprocesadores', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Lenguajes Formales y Compiladores', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Programación de Redes', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Arquitectura Computacional', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Servicio Social', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Cálculo Multivariable', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Fund. de Redes de Computadoras', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Programación Estructurada', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Estructura de Datos', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Docencia en Ingeniería', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Tecnologías y Aplic. Móviles', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Diseño de Aplicaciones Web', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Paradigmas de Programación', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Evaluación de Proyectos', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Introducción a la Programación', 7, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Gestión Empresarial', 3, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Ingeniería Económica', 6, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Gestión por Procesos', 6, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Optativa I', 6, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Optativa II', 6, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Optativa III', 6, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Optativa IV', 6, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Ética y Derecho Informático', 3, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Bases de Datos Avanzadas', 8, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Paradigmas de Programación II', 8, 2);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Matemáticas Discretas II', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Investigación Dirigida', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Acreditación del Idioma Inglés', 3, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Estancia Profesional', 12, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Experiencia Recepcional', 12, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Sistemas de Interacción Humano Computadora', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Matemáticas Discretas', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Probabilidad y Estadística Avanzada', 8, 1);
INSERT INTO materias (nombre, creditos, fkArea) VALUES ('Probabilidad y Estadística', 8, 1);





INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (1, 'S20004426', 'Notas del alumno nota 1');
INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (1, 'S20004426', 'Notas del alumno nota 2');




INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES ('2024-05-29', 'Contexto de la tutoría', 60, 'S20004426', 1, 1);
INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES ('2024-06-05', 'Otro contexto de la tutoría', 45, 'S20004426', 1, 1);





INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (1, 'S20004426', 1, 1, 90);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (2, 'S20004426', 1, 1, 85);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (3, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (4, 'S20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (5, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (6, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (7, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (8, 'S20004426', 1, 1, 86);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (9, 'S20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (10, 'S20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (11, 'S20004426', 1, 1, 82);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (12, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (13, 'S20004426', 1, 1, 85);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (14, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (15, 'S20004426', 1, 1, 90);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (16, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (17, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (18, 'S20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (19, 'S20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (20, 'S20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (21, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (22, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (23, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (24, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (25, 'S20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (26, 'S20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (27, 'S20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (28, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (29, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (30, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (31, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (32, 'S20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (33, 'S20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (34, 'S20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (35, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (36, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (37, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (38, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (39, 'S20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (40, 'S20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (41, 'S20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (42, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (43, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (44, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (45, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (46, 'S20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (47, 'S20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (48, 'S20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (49, 'S20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (50, 'S20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (51, 'S20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (52, 'S20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (53, 'S20004426', 1, 1, 92);





INSERT INTO mensajes (mensaje, asunto, fecha, fkTutor, fkAlumno) VALUES ('Mensaje de prueba', 'Hola profe', '2024-06-05', 1, 'S20004426');
INSERT INTO mensajes (mensaje, asunto, fecha, fkTutor, fkAlumno) VALUES ('Otro mensaje de prueba', 'Tengo dudas maestro', '2024-06-05', 1, 'S20004426');
