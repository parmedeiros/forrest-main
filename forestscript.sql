// COMANDO ABAIXO VAI APAGAR O BANCO
// DROP DATABASE  IF EXISTS  forrest; 

create database forrest character set utf8mb4 collate utf8mb4_bin;

use forrest;

CREATE TABLE Sexo (
                IdSexo TINYINT NOT NULL,
                Descricao VARCHAR(10) NOT NULL,
                PRIMARY KEY (IdSexo)
);


CREATE TABLE Usuario (
                IdUsuario SMALLINT AUTO_INCREMENT NOT NULL,
                IdSexo TINYINT NOT NULL,
                NomeUsuario VARCHAR(30) NOT NULL,
                senha VARCHAR(50) NOT NULL,
                email VARCHAR(100) NOT NULL,
                DataNasc DATE NOT NULL,
                PRIMARY KEY (IdUsuario)
);


CREATE TABLE Professor (
                IdTreinadr SMALLINT AUTO_INCREMENT NOT NULL,
                IdUsuario SMALLINT NOT NULL,
                NomeTreinador VARCHAR(30) NOT NULL,
                PRIMARY KEY (IdTreinadr)
);


CREATE TABLE Aluno (
                IdAluno SMALLINT AUTO_INCREMENT NOT NULL,
                IdUsuario SMALLINT NOT NULL,
                Nome VARCHAR(100) NOT NULL,
                Objetivo VARCHAR(255) null,
                Altura NUMERIC(3,2) NOT NULL,	
                Peso NUMERIC(5,2) NOT NULL,
                PRIMARY KEY (IdAluno)
);


CREATE TABLE Treinos (
                IdTreino INT AUTO_INCREMENT NOT NULL,
                IdAluno SMALLINT NOT NULL,
                IdTreinadr SMALLINT NOT NULL,
                DataTreino DATE NOT NULL,
                PreTreino VARCHAR(255) NOT NULL,
                Distancia NUMERIC(5,3) NOT NULL,
                Metodo VARCHAR(255) NOT NULL,
                Velocidade NUMERIC(4,2) NOT NULL,
                Tempo TIME NOT NULL,
                Ritmo NUMERIC(4,2) NOT NULL,
                Observacao VARCHAR(255) NOT NULL,
                PRIMARY KEY (IdTreino)
);


ALTER TABLE Usuario ADD CONSTRAINT sexo_usuario_fk
FOREIGN KEY (IdSexo)
REFERENCES Sexo (IdSexo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor ADD CONSTRAINT usuario_professor_fk
FOREIGN KEY (IdUsuario)
REFERENCES Usuario (IdUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Aluno ADD CONSTRAINT usuario_aluno_fk
FOREIGN KEY (IdUsuario)
REFERENCES Usuario (IdUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Treinos ADD CONSTRAINT professor_treinos_fk
FOREIGN KEY (IdTreinadr)
REFERENCES Professor (IdTreinadr)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Treinos ADD CONSTRAINT aluno_treinos_fk
FOREIGN KEY (IdAluno)
REFERENCES Aluno (IdAluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
