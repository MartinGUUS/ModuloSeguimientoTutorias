-- Active: 1715003786902@@127.0.0.1@5432@tutorias

drop table areas cascade;

create table areas (
    idAreas serial PRIMARY KEY,
    nombre TEXT
);

drop table materias cascade;

create table materias (
    idMaterias serial PRIMARY KEY,
    nombre TEXT,
    creditos int,
    fkAreas int,
    Foreign Key (fkAreas) REFERENCES areas (idAreas)
);

drop table estatus cascade;

create table estatus (
    idEstatus serial PRIMARY KEY,
    nombreEstatus TEXT,
    descripcion text
);

drop table usuarios cascade;

create table usuarios (
    idUsuarios serial PRIMARY KEY,
    nombre text,
    segundoNombre text,
    apPaterno text,
    apMaterno text,
    fechaNac DATE,
    numero varchar(10),
    correo text,
    direccion text,
    clave text,
    fkEstatus int,
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);

drop table tutores cascade;

create table tutores (
    idTutores serial PRIMARY KEY,
    fkUsuarios int,
    fkEstatus int,
    Foreign Key (fkUsuarios) REFERENCES usuarios (idUsuarios),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);

drop table alumnos cascade;

create table alumnos (
    matricula varchar(9) NOT NULL PRIMARY KEY,
    carrera text,
    semestre int,
    fkUsuarios int,
    fkTutores int,
    fkEstatus int,
    Foreign Key (fkUsuarios) REFERENCES usuarios (idUsuarios),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus),
    Foreign Key (fkTutores) REFERENCES tutores (idTutores)
);

drop table notas cascade;

create table notas (
    idNotas serial PRIMARY KEY,
    fkTutores int,
    fkAlumnos varchar(9),
    notas TEXT,
    Foreign Key (fkTutores) REFERENCES tutores (idTutores),
    Foreign Key (fkAlumnos) REFERENCES alumnos (matricula)
);

drop table tutorias cascade;

create table tutorias (
    idTutorias serial PRIMARY KEY,
    fecha Date,
    contexto TEXT,
    duracion int,
    fkAlumnos varchar(9),
    fkTutores int,
    fkEstatus int,
    Foreign Key (fkTutores) REFERENCES tutores (idTutores),
    Foreign Key (fkAlumnos) REFERENCES alumnos (matricula),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);

drop table materias_alumnos cascade;

create table materias_alumnos (
    fkMaterias int,
    fkAlumnos varchar(9),
    fkEstatus int,
    inscripcion int,
    calificacion FLOAT,
    Foreign Key (fkAlumnos) REFERENCES alumnos (matricula),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus),
    Foreign Key (fkMaterias) REFERENCES materias (idMaterias)
);

drop table mensajes cascade;

create table mensajes(
    idMensaje serial PRIMARY KEY,
    mensaje text,
    fkAlumnoUsuario int,
    fkTutorUsuario int,
    Foreign Key (fkAlumnoUsuario) REFERENCES usuarios (idUsuarios),
    Foreign Key (fkTutorUsuario) REFERENCES usuarios (idUsuarios)
);