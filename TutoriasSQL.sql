






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
    fkTutor int,
    fkAlumno varchar,
    Foreign Key (fkTutor) REFERENCES tutores (idTutores),
    Foreign Key (fkAlumno) REFERENCES alumnos (matricula)
);
--------------------------------------------------------------------------------------
