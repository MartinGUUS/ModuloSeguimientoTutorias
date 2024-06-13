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


INSERT INTO areas (nombre) VALUES ('Area formación basica');
INSERT INTO areas (nombre) VALUES ('Area formación disciplinaria');
INSERT INTO areas (nombre) VALUES ('Area formación terminal');
INSERT INTO areas (nombre) VALUES ('Area formación libre');







INSERT INTO estatus (nombreEstatus, descripcion) VALUES ('Activo', 'Estado activo');
INSERT INTO estatus (nombreEstatus, descripcion) VALUES ('Inactivo', 'Estado inactivo');




INSERT INTO tutores (nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus)
VALUES ('Juan', 'Carlos', 'Pérez', 'Gómez', '1990-05-15', '5551234567', 'juan@example.com', 'Calle Principal 123', 'contraseña123', 1);





INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus)
VALUES ('s20004426', 'María', 'Isabel', 'García', 'López', '1995-08-25', '5559876543', 'maria@example.com', 'Avenida Secundaria 456', 'contraseña456', 'Licenciatura en Administración', 2, 1, 1);

INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus)
VALUES ('s20004425', 'Martin', 'Gustavo', 'Acosta', 'Romero', '2002-12-01', '2295233407', 'martin@example.com', 'Avenida Secundaria 456', 'contraseña456', 'Licenciatura en Administración', 2, 1, 1);




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





INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (1, 's20004426', 'Notas del alumno nota 1');
INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (1, 's20004426', 'Notas del alumno nota 2');




INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES ('2024-05-29', 'Contexto de la tutoría', 60, 's20004426', 1, 1);
INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES ('2024-06-05', 'Otro contexto de la tutoría', 45, 's20004426', 1, 1);





INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (1, 's20004426', 1, 1, 90);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (2, 's20004426', 1, 1, 85);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (3, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (4, 's20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (5, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (6, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (7, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (8, 's20004426', 1, 1, 86);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (9, 's20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (10, 's20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (11, 's20004426', 1, 1, 82);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (12, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (13, 's20004426', 1, 1, 85);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (14, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (15, 's20004426', 1, 1, 90);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (16, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (17, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (18, 's20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (19, 's20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (20, 's20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (21, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (22, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (23, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (24, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (25, 's20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (26, 's20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (27, 's20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (28, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (29, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (30, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (31, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (32, 's20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (33, 's20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (34, 's20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (35, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (36, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (37, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (38, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (39, 's20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (40, 's20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (41, 's20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (42, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (43, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (44, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (45, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (46, 's20004426', 1, 1, 92);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (47, 's20004426', 1, 1, 84);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (48, 's20004426', 1, 1, 83);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (49, 's20004426', 1, 1, 88);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (50, 's20004426', 1, 1, 87);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (51, 's20004426', 1, 1, 89);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (52, 's20004426', 1, 1, 91);
INSERT INTO materias_alumnos (fkMaterias, fkAlumnos, fkEstatus, inscripcion, calificacion) VALUES (53, 's20004426', 1, 1, 92);





INSERT INTO mensajes (mensaje, asunto, fecha, fkTutor, fkAlumno) VALUES ('Mensaje de prueba', 'Hola profe', '2024-06-05', 1, 's20004426');
INSERT INTO mensajes (mensaje, asunto, fecha, fkTutor, fkAlumno) VALUES ('Otro mensaje de prueba', 'Tengo dudas maestro', '2024-06-05', 1, 's20004426');
