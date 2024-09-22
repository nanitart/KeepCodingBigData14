-- Creación de la tabla BootCamp
CREATE TABLE BootCamp (
	bootcamp_id SERIAL PRIMARY KEY,
	FOREING KEY (classes_id) REFERENCES Classes (classes_id),
	star_date VARCHAR(50) NOT NULL,
	end_date VARCHAR(50) NOT NULL,
	FOREING KEY (student_id) REFERENCES Students (student_id),
	bootcamp VARCHAR(50) NOT NULL,
	FOREING KEY (teacher_id) REFERENCES Teachers (teacher_id)
);
-- Creación de la tabla Students (Estudiantes)
CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    student_surname VARCHAR(50) NOT NULL,
    student_email VARCHAR(50) UNIQUE NOT NULL,
    student_phone VARCHAR(50) NOT NULL
);
-- Creación de la tabla Teachers (Profesores)
CREATE TABLE IF NOT EXISTS Teachers (
    teacher_id SERIAL PRIMARY KEY,
    teacher_name VARCHAR(50) NOT NULL,
    teacher_surname VARCHAR(50) NOT NULL,
    teacher_email VARCHAR(50) UNIQUE NOT NULL,
    teacher_phone VARCHAR(50) NOT NULL,
    subject_area VARCHAR(50)
);

-- Creación de la tabla Classes (Clases o Materias)
CREATE TABLE Classes (
    classes_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    shedules INT,
    bootcamp_id INT REFERENCES BootCamp(bootcamp_id) ON DELETE CASCADE
);

-- Creación de la tabla intermedia Classes_Student para la relación de muchos a muchos
CREATE TABLE Classes_Student (
    classes_id INT REFERENCES Classes(classes_id) ON DELETE CASCADE,
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE,
    PRIMARY KEY (classes_id, student_id)
);

-- Creación de la tabla intermedia Classes_Teachers para la relación de muchos a muchos
CREATE TABLE Classes_Teachers (
    classes_id INT REFERENCES Classes(classes_id) ON DELETE CASCADE,
    teacher_id INT REFERENCES Teachers(teacher_id) ON DELETE CASCADE,
    PRIMARY KEY (classes_id, teacher_id)
);

INSERT INTO Students(student_name,student_surname,student_email,student_phone) VALUES
('Cristina','Ramos','cristinaramos@gmail.com','99678413'),
('Julian','Ramirez','julianramirez@hotmail.com', '99587645'),
('Carlos','Ferreira','carlosferreira@yahoo.com','99267892');

INSERT INTO Teachers(teacher_name,teacher_surname,teacher_email,teacher_phone,subject_area) VALUES
('David','Gonzalez','davidgon@gmail.com','99897654','DATA'),
('Alicgia','Guerrero','guerroalicia@gmail.com','98765432','IA'),
('Javier','Roman','javieroman@gmail.com','99645321','Python'),
('Maria','Castro','castromaria@hotmail.com','90001456','DATA');

INSERT INTO Classes(nombre,descripcion,shedules) VALUES
('DATA','BIG DATA PROCESOS','14 HORAS'),
('IA','HISTORIA', '9 HORAS'),
('Python','APRENDE A PROGRAMAR','25 HORAS');