CREATE TABLE departamento (
    id_departamento INT(10) PRIMARY KEY,
    Nombre_departamento VARCHAR(50)
);

CREATE TABLE profesor (
    id_profesor INT(10) PRIMARY KEY,
    Nombre_profesor VARCHAR(50),
    Apellido1_profesor VARCHAR(50),
    Apellido2_profesor VARCHAR(50),
    id_departamento INT(10)
);

CREATE TABLE profesor_detalle (
    id_profesor_detalle INT(10) PRIMARY KEY,
    id_profesor INT(10),
    id_ubicacion INT(10),
    id_contacto INT(10)
);

CREATE TABLE Asignatura (
    id_asignatura INT(10) PRIMARY KEY,
    Nombre_asignatura VARCHAR(100),
    creditos FLOAT,
    id_profesor INT(10),
    id_grado INT(10)
);

CREATE TABLE TipoAsignatura (
    id_tipo INT(10) PRIMARY KEY,
    tipo ENUM('Obligatoria', 'Optativa')
);

CREATE TABLE Curso (
    id_curso INT(10) PRIMARY KEY,
    curso TINYINT(3),
    cuatrimestre TINYINT(3)
);

CREATE TABLE AsignaturaTipo (
    id_asignatura INT(10),
    id_tipo INT(10),
    PRIMARY KEY (id_asignatura, id_tipo)
);

CREATE TABLE AsignaturaCurso (
    id_asignatura INT(10),
    id_curso INT(10),
    PRIMARY KEY (id_asignatura, id_curso)
);

CREATE TABLE curso_escolar (
    id_curso_escolar INT(10) PRIMARY KEY,
    anyo_inicio YEAR(4),
    anyo_fin YEAR(4)
);

CREATE TABLE ubicacion (
    id_ubicacion INT PRIMARY KEY,
    ciudad VARCHAR(100)
);

CREATE TABLE contacto (
    id_contacto INT PRIMARY KEY,
    nif VARCHAR(9),
    fecha_nacimiento DATE,
    sex ENUM('H', 'M'),
    direccion VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE alumno (
    id_alumno INT(10) PRIMARY KEY,
    Nombre_alumno VARCHAR(50),
    Apellido1_alumno VARCHAR(50),
    Apellido2_alumno VARCHAR(50),
    id_ubicacion INT(10)
);

CREATE TABLE alumno_detalle (
    id_alumno_detalle INT(10) PRIMARY KEY,
    id_alumno INT(10),
    id_contacto INT(10)
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT(10),
    id_asignatura INT(10),
    id_curso_escolar INT(10),
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar)
);
CREATE TABLE Grado (
    id_grado INT(10) PRIMARY KEY,
    nombre_grado VARCHAR(100)
);



-- profesor
ALTER TABLE profesor
ADD CONSTRAINT fk_profesor_departamento
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);

-- profesor_detalle
ALTER TABLE profesor_detalle
ADD CONSTRAINT fk_profesor_detalle_profesor
FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
ADD CONSTRAINT fk_profesor_detalle_ubicacion
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion),
ADD CONSTRAINT fk_profesor_detalle_contacto
FOREIGN KEY (id_contacto) REFERENCES contacto(id_contacto);

-- Asignatura
ALTER TABLE Asignatura
ADD CONSTRAINT fk_asignatura_profesor
FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
ADD CONSTRAINT fk_asignatura_grado
FOREIGN KEY (id_grado) REFERENCES Grado(id_grado);

-- AsignaturaCurso
ALTER TABLE AsignaturaCurso
ADD CONSTRAINT fk_asignatura_curso
FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
ADD CONSTRAINT fk_curso_asignatura
FOREIGN KEY (id_curso) REFERENCES Curso(id_curso);

-- AsignaturaTipo
ALTER TABLE AsignaturaTipo
ADD CONSTRAINT fk_asignatura_tipo
FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
ADD CONSTRAINT fk_tipo_asignatura
FOREIGN KEY (id_tipo) REFERENCES TipoAsignatura(id_tipo);

-- alumno
ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_ubicacion
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion);

-- alumno_detalle
ALTER TABLE alumno_detalle
ADD CONSTRAINT fk_alumno_detalle_alumno
FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
ADD CONSTRAINT fk_alumno_detalle_contacto
FOREIGN KEY (id_contacto) REFERENCES contacto(id_contacto);

-- alumno_se_matricula_asignatura
ALTER TABLE alumno_se_matricula_asignatura
ADD CONSTRAINT fk_matricula_alumno
FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
ADD CONSTRAINT fk_matricula_asignatura
FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
ADD CONSTRAINT fk_matricula_curso_escolar
FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id_curso_escolar);




-- Insertar datos en la tabla departamento
INSERT INTO departamento (id_departamento, Nombre_departamento) VALUES
(1, 'Departamento de Matemáticas'),
(2, 'Departamento de Informática'),
(3, 'Departamento de Historia');

-- Insertar datos en la tabla profesor
INSERT INTO profesor (id_profesor, Nombre_profesor, Apellido1_profesor, Apellido2_profesor, id_departamento) VALUES
(1, 'Juan', 'García', 'López', 1),
(2, 'María', 'Martínez', 'Pérez', 2),
(3, 'Carlos', 'Fernández', 'Gómez', NULL);

-- Insertar datos en la tabla Grado
INSERT INTO Grado (id_grado, nombre_grado) VALUES
(1, 'Primer grado'),
(2, 'Ingeniería Informática'),
(3, 'Tercer grado'),
(4, 'Cuarto grado'),
(5, 'Quinto grado'),
(6, 'Sexto grado'),
(7, 'Séptimo grado'),
(8, 'Octavo grado'),
(9, 'AFDSFG'),
(10, 'Décimo grado'),
(11, 'Undécimo grado');

-- Insertar datos en la tabla Asignatura
INSERT INTO Asignatura (id_asignatura, Nombre_asignatura, creditos, id_profesor, id_grado) VALUES
(1, 'Álgebra Lineal', 6, 1, 1),
(2, 'Programación Avanzada', 8, 2, 2),
(3, 'Historia Antigua', 5, NULL, 3);

-- Insertar datos en la tabla Curso
INSERT INTO Curso (id_curso, curso, cuatrimestre) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);


-- Insertar datos en la tabla ubicacion
INSERT INTO ubicacion (id_ubicacion, ciudad) VALUES
(1, 'Madrid'),
(2, 'Barcelona'),
(3, 'Valencia');


-- Insertar datos en la tabla alumno
INSERT INTO alumno (id_alumno, Nombre_alumno, Apellido1_alumno, Apellido2_alumno, id_ubicacion) VALUES
(1, 'Ana', 'López', 'García', 1),
(3, 'Pedro', 'Martínez', 'Sánchez', 3),
(2, 'Elena', 'Gómez', 'Pérez', 2);


-- Insertar datos en la tabla contacto
INSERT INTO contacto (id_contacto, nif, fecha_nacimiento, sex, direccion, telefono) VALUES
(1, '26902806M', '1999-05-15', 'H', 'Calle Mayor 123', '123456789'),
(2, '87654321B', '1998-03-20', 'M', 'Av. Diagonal 456', '987654321'),
(3, '13579246C', '2000-07-10', 'H', 'Pl. del Ayuntamiento 789', NULL);


-- Insertar datos en la tabla TipoAsignatura
INSERT INTO TipoAsignatura (id_tipo, tipo) VALUES
(1, 'Obligatoria'),
(2, 'Optativa');

-- Insertar datos en la tabla AsignaturaTipo
INSERT INTO AsignaturaTipo (id_asignatura, id_tipo) VALUES
(1, 1),
(2, 1),
(3, 2);

-- Insertar datos en la tabla AsignaturaCurso
INSERT INTO AsignaturaCurso (id_asignatura, id_curso) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertar datos en la tabla curso_escolar
INSERT INTO curso_escolar (id_curso_escolar, anyo_inicio, anyo_fin) VALUES
(2, 2015, 2016),
(1, 2018, 2019),
(3, 2021, 2022);

-- Insertar datos en la tabla profesor_detalle
INSERT INTO profesor_detalle (id_profesor_detalle, id_profesor, id_ubicacion, id_contacto) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Insertar datos en la tabla alumno_detalle
INSERT INTO alumno_detalle (id_alumno_detalle, id_alumno, id_contacto) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Insertar datos en la tabla alumno_se_matricula_asignatura
INSERT INTO alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);









SELECT p.id_profesor, p.Nombre_profesor, p.Apellido1_profesor, p.Apellido2_profesor, COUNT(a.id_asignatura) AS total_asignaturas
FROM profesor p
LEFT JOIN Asignatura a ON p.id_profesor = a.id_profesor
GROUP BY p.id_profesor, p.Nombre_profesor, p.Apellido1_profesor, p.Apellido2_profesor
ORDER BY total_asignaturas DESC;





















