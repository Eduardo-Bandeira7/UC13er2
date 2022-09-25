--DDL
CREATE DATABASE RpgBDFT3
GO

USE RpgBDFT3
GO

CREATE TABLE Usuarios
(
	IdUsuraio INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Apelido VARCHAR(20) UNIQUE NOT NULL,
	Senha VARCHAR(30) NOT NULL 
)
GO

CREATE TABLE Classes
(
	IdClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens
(
	IdPersonagem INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) UNIQUE NOT NULL,
	iUdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuraio),
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse)
)
GO

CREATE TABLE Habilidades
(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255) 
)
GO

CREATE TABLE ClasseHabilidade
(
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES  Habilidades(IdHabilidade)
)
GO

--DML
INSERT INTO Usuarios (Email, Senha, Apelido) VALUES ('email@email.com', 1234, 'Caixao')
INSERT INTO Classes VALUES ('Barbaro', 'Descrição do barbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal', 'Descrição do ataque'), ('Escudo supremo', 'Descrição da habilidade')
INSERT INTO Personagens VALUES ('Deubug', 1, 1)
INSERT INTO ClasseHabilidade VALUES (1,1), (1,2)


INSERT INTO Usuarios VALUES ('email1@email.com', 'Soul King', 1234)
INSERT INTO Classes VALUES ('Monge', 'Descrição da classe')
INSERT INTO Habilidades VALUES ('Recuperar Vida', 'Descrição da habilidade')
INSERT INTO Personagens VALUES ('Bitbug', 2, 2)
INSERT INTO ClasseHabilidade VALUES (2,2), (2,3)

UPDATE Usuarios SET Senha = 1234565 WHERE IdUsuraio = 1

--DQL
SELECT * FROM Usuarios
SELECT Senha, Email FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades

--Seleciona tudo de tudo
SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

--seleciona apenas as colunas solicitadas
SELECT Personagens.Nome, Classes.Nome, Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

SELECT p.Nome, C.Nome 'Classe', C.Descricao FROM Personagens P
JOIN Classes C
ON P.IdClasse = C.IdClasse






CREATE DATABASE ExemploJoin
GO

USE ExmploJoin
GO

CREATE TABLE NomeA
(
	Nome VARCHAR (50) NOT NULL
)
GO

CREATE TABLE NomeB
(
	Nome VARCHAR(50) NOT NULL
)
GO

INSERT INTO NomeA VALUES ('Fernanda'), ('Maria'), ('Luiz'), ('Caique')
INSERT INTO NomeB VALUES ('luiz'), ('Caique'), ('Odirlei'), ('Jessica')


--JOIN(INNER JOIN) - TRAS SOMMENTE ONDE HA EQUIVALENCIA
SELECT * FROM NomeA
JOIN NomeB
ON NomeA.Nome = NomeB.Nome

-- LEFT JOIN - TRAS TODOS OS ELEMNTOS DA PERMIERA TABELA SITADA E SUAS EQUIVALENCIAS NA SEGUNDA TABELA
SELECT * FROM NomeA
LEFT JOIN NomeB
ON NomeA.Nome = NomeB.Nome

-- RIGHT - TRAS TODOS OS ELEMENTOS DA SEGUNDA TABELA SITADA E SUAS EQUIVALENCIAS NA PRIMEIRA TABELA
SELECT * FROM NomeA
RIGHT JOIN NomeB
ON NomeA.Nome = NomeB.Nome

-- FULL OUTER JOIN - TRAS TODOS OS ELEMENTOS
SELECT * FROM NomeA
FULL OUTER JOIN NomeB
ON NomeA.Nome = NomeB.Nome