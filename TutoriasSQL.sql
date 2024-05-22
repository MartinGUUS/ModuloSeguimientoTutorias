-- Active: 1715003786902@@127.0.0.1@5432@tutorias

create table areas (
    idAreas serial PRIMARY KEY,
    nombre TEXT
);

create table materias (
    idMaterias serial PRIMARY KEY,
    nombre TEXT,
    creditos int,
    fkAreas int,
    Foreign Key (fkAreas) REFERENCES areas (idAreas)
);

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
    clave text
);

create table estatus (
    idEstatus serial PRIMARY KEY,
    nombreEstatus TEXT,
    descripcion text
);

create table tutores (
    matricula varchar(9) NOT NULL PRIMARY KEY,
    fkUsuarios int,
    fkEstatus int,
    Foreign Key (fkUsuarios) REFERENCES usuarios (idUsuarios),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);

create table alumnos (
    matricula varchar(9) NOT NULL PRIMARY KEY,
    carrera text,
    semestre int,
    fkUsuarios int,
    fkTutores varchar(9),
    fkEstatus int,
    Foreign Key (fkUsuarios) REFERENCES usuarios (idUsuarios),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus),
    Foreign Key (fkTutores) REFERENCES tutores (matricula)
);

create table notasAlumnos (
    fkTutores varchar(9),
    fkAlumnos varchar(9),
    notas TEXT,
    Foreign Key (fkTutores) REFERENCES tutores (matricula),
    Foreign Key (fkAlumnos) REFERENCES alumnos (matricula)
);

create table tutorias (
    idTutorias serial PRIMARY KEY,
    fecha Date,
    contexto TEXT,
    duracion int,
    fkAlumnos varchar(9),
    fkTutores varchar(9),
    fkEstatus int,
    Foreign Key (fkTutores) REFERENCES tutores (matricula),
    Foreign Key (fkAlumnos) REFERENCES alumnos (matricula),
    Foreign Key (fkEstatus) REFERENCES estatus (idEstatus)
);

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