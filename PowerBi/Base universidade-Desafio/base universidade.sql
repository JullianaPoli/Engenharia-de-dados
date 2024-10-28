-- Criar o banco de dados
CREATE DATABASE `dio-desafio`;

-- Selecionar o banco de dados
USE `dio-desafio`;

-- Criar as tabelas
CREATE TABLE Departamento (
    idDepartamento INT PRIMARY KEY,
    Nome VARCHAR(45),
    Campus VARCHAR(45),
    idProfessor_coordenador INT,
    idCurso INT
);

CREATE TABLE Professor (
    idProfessor INT PRIMARY KEY,
    Departamento_idDepartamento INT NOT NULL,
    Nome_Professor VARCHAR(45) NOT NULL,
    idDepartamento INT NOT NULL,
    idDepartamento_1 INT NOT NULL,
    idDepartamento_2 INT NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento),
    FOREIGN KEY (idDepartamento_1) REFERENCES Departamento(idDepartamento),
    FOREIGN KEY (idDepartamento_2) REFERENCES Departamento(idDepartamento)
);

CREATE TABLE Aluno (
    idAluno INT PRIMARY KEY,
    Nome_Aluno VARCHAR(45),
    Data_Nascimento DATE
);

CREATE TABLE Disciplina (
    idDisciplina INT PRIMARY KEY,
    Professor_idProfessor INT,
    Dcalendario_Data_oferta_Disciplina DATE,
    idDepartamento INT,
    FOREIGN KEY (Professor_idProfessor) REFERENCES Professor(idProfessor)
);

CREATE TABLE Dcalendario (
    Data_oferta_disciplinas DATE,
    Data_oferta_curso DATE,
    Data_inicio_semestre DATE,
    Data_inicio_ferias DATE,
    idDisciplina INT PRIMARY KEY,
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina)
);

CREATE TABLE Matriculado (
    Aluno_idAluno INT,
    disciplina_idDisciplina INT,
    PRIMARY KEY (Aluno_idAluno, disciplina_idDisciplina),
    FOREIGN KEY (Aluno_idAluno) REFERENCES Aluno(idAluno),
    FOREIGN KEY (disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina)
);

CREATE TABLE Pre_requisitos (
    idPre_requisitos INT PRIMARY KEY
);

CREATE TABLE Pre_requisitos_das_disciplinas (
    Disciplina_idDisciplina INT,
    Pre_requisitos_idPre_requisitos INT,
    PRIMARY KEY (Disciplina_idDisciplina, Pre_requisitos_idPre_requisitos),
    FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina),
    FOREIGN KEY (Pre_requisitos_idPre_requisitos) REFERENCES Pre_requisitos(idPre_requisitos)
);

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    Departamento_idDepartamento INT,
    Curso VARCHAR(45),
    FOREIGN KEY (Departamento_idDepartamento) REFERENCES Departamento(idDepartamento)
);
