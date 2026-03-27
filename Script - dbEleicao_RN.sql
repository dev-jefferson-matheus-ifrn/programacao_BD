CREATE DATABASE dbEleicao_RN;

USE dbEleicao_RN;

CREATE TABLE `TbCandidato` (
	`NuCandidato` INT NOT NULL AUTO_INCREMENT,
	`NoCandidato` varchar(50) NOT NULL,
	`CoCargo` tinyint NOT NULL,
	`CoPartido` tinyint NOT NULL,
	PRIMARY KEY (`NuCandidato`)
);

CREATE TABLE `TbCargo` (
	`CoCargo` tinyint NOT NULL AUTO_INCREMENT,
	`NoCargo` varchar(50) NOT NULL,
	PRIMARY KEY (`CoCargo`)
);

CREATE TABLE `TbPartido` (
	`CoPartido` tinyint NOT NULL AUTO_INCREMENT,
	`SgPartido` varchar(20) NOT NULL,
	`NoPartido` varchar(100) NOT NULL,
	`CoOrientacao` tinyint,
	PRIMARY KEY (`CoPartido`)
);

CREATE TABLE `TbZona` (
	`IdZona` INT NOT NULL AUTO_INCREMENT,
	`NoZona` varchar(50) NOT NULL,
	PRIMARY KEY (`IdZona`)
);

CREATE TABLE `TbVotos` (
	`IdVoto` INT NOT NULL AUTO_INCREMENT,
	`IdZona` INT NOT NULL,
	`NuCandidato` INT NOT NULL,
	`QtVotos` INT NOT NULL,
	PRIMARY KEY (`IdVoto`)
);

CREATE TABLE `TbOrientacao` (
	`CoOrientacao` tinyint NOT NULL AUTO_INCREMENT,
	`NoOrientacao` varchar(20) NOT NULL,
	PRIMARY KEY (`CoOrientacao`)
);

ALTER TABLE `TbCandidato` ADD CONSTRAINT `TbCandidato_fk0` FOREIGN KEY (`CoCargo`) REFERENCES `TbCargo`(`CoCargo`);

ALTER TABLE `TbCandidato` ADD CONSTRAINT `TbCandidato_fk1` FOREIGN KEY (`CoPartido`) REFERENCES `TbPartido`(`CoPartido`);

ALTER TABLE `TbPartido` ADD CONSTRAINT `TbPartido_fk0` FOREIGN KEY (`CoOrientacao`) REFERENCES `TbOrientacao`(`CoOrientacao`);

ALTER TABLE `TbVotos` ADD CONSTRAINT `TbVotos_fk0` FOREIGN KEY (`IdZona`) REFERENCES `TbZona`(`IdZona`);

ALTER TABLE `TbVotos` ADD CONSTRAINT `TbVotos_fk1` FOREIGN KEY (`NuCandidato`) REFERENCES `TbCandidato`(`NuCandidato`);

INSERT INTO TbCargo (CoCargo, NoCargo) 
VALUES (1, 'Governador'),
       (2, 'Senador'),
       (3, 'Deputado federal'),
       (4, 'Deputado estadual');

INSERT INTO TbOrientacao (CoOrientacao, NoOrientacao)
VALUES (1, 'Esquerda'),
       (2, 'Centro'),
       (3, 'Centro-esquerda'),
       (4, 'Direita'),
       (5, 'Centro-direita');

INSERT INTO TbPartido (SgPartido, NoPartido, CoOrientacao)
VALUES ('MDB', 'MOVIMENTO DEMOCRÁTICO BRASILEIRO', 2),
       ('PDT', 'PARTIDO DEMOCRÁTICO TRABALHISTA', 3),
       ('PT', 'PARTIDO DOS TRABALHADORES', 1),
       ('PCdoB', 'PARTIDO COMUNISTA DO BRASIL', 1),
       ('PSB', 'PARTIDO SOCIALISTA BRASILEIRO', 3),
       ('PSDB', 'PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA', 5),
       ('AGIR', 'AGIR', NULL),
       ('PMN', 'Partido da Mobilização Nacional', 2),
       ('CIDADANIA', 'CIDADANIA', 2),
       ('PV', 'PARTIDO VERDE', 2),
       ('AVANTE', 'AVANTE', 2),
       ('PP', 'PROGRESSISTAS', 5),
       ('PSTU', 'PARTIDO SOCIALISTA DOS TRABALHADORES UNIFICADO', 1),
       ('PCB', 'PARTIDO COMUNISTA BRASILEIRO', 1),
       ('PRTB', 'PARTIDO RENOVADOR TRABALHISTA BRASILEIRO', 2),
       ('DC', 'DEMOCRACIA CRISTÃ', 5),
       ('PCO', 'PARTIDO DA CAUSA OPERÁRIA', 1),
       ('PODE', 'PODEMOS', 2),
       ('REPUBLICANOS', 'REPUBLICANOS', 5),
       ('PSOL', 'PARTIDO SOCIALISMO E LIBERDADE', 1),
       ('PL', 'PARTIDO LIBERAL', 5),
       ('PSD', 'PARTIDO SOCIAL DEMOCRÁTICO', 2),
       ('PSD', 'SOLIDARIEDADE', 2),
       ('NOVO', 'PARTIDO NOVO', 5),
       ('REDE', 'REDE SUSTENTABILIDADE', 2),
       ('PMB', 'PARTIDO DA MULHER BRASILEIRA', 1),
       ('UP', 'UNIDADE POPULAR', 1),
       ('UNIÃO', 'UNIÃO BRASIL', NULL),
       ('PRD', 'PARTIDO RENOVAÇÃO DEMOCRÁTICA', NULL);

INSERT INTO TbCandidato (NoCandidato, CoCargo, CoPartido)
VALUES ('Antônio Bento', 1, 15),
       ('Capitão Styvenson', 1, 18),
       ('Clorisa Linhares', 1, 26),
       ('Danniel Morais', 1, 20),
       ('Fábio Dantas', 1, 23),
       ('Fátima Bezerra', 1, 3),
       ('Nazareno Neris', 1, 8),
       ('Rodrigo Vieira', 1, 16),
       ('Rosália Fernandes', 1, 13),
       ('Carlos Eduardo', 2, 2),
       ('Dário Barbosa', 2, 13),
       ('Freitas Jr.', 2, 20),
       ('Geraldo Pinho', 2, 18),
       ('Marcelo Guerreiro', 2, 15),
       ('Pastor Silvestre', 2, 8),
       ('Rafael Motta', 2, 5),
       ('Rogério Marinho', 2, 21),
       ('Shirlei Medeiros', 2, 16),
       ('Natália Bonavides', 3, 3),
       ('João Maia', 3, 21),
       ('Benes Leocádio', 3, 28),
       ('Robinson Faria', 3, 21),
       ('Mineiro', 3, 3),
       ('Paulinho Freire', 3, 28),
       ('General Girão', 3, 21),
       ('Sargento Gonçalves', 3, 21),
       ('Ezequiel Ferreira', 4, 6),
       ('Coronel Azevedo', 4, 21),
       ('Kleber Rodrigues', 4, 6),
       ('Adjuto Dias', 4, 1),
       ('Isolda Dantas', 4, 3),
       ('Bernardo Amorim', 4, 6),
       ('Divaneide', 4, 3),
       ('Francisco do PT', 4, 3),
       ('George Soares', 4, 10),
       ('José Dias', 4, 6),
       ('Dr. Keginaldo Jacome', 4, 6),
       ('Tomba Farias', 4, 6),
       ('Cristiane Dantas', 4, 23),
       ('Nelter Queiroz', 4, 6),
       ('Galeno Torquato', 4, 6),
       ('Eudiane Macedo', 4, 10),
       ('Ubaldo Fernandes', 4, 6),
       ('Luiz Eduardo', 4, 23),
       ('Terezinha Maia', 4, 21),
       ('Hermano Morais', 4, 10), 
       ('Ivanilson Oliveira', 4, 28), 
       ('Taveira Jr', 4, 28), 
       ('Neilton', 4, 21);

INSERT INTO TbZona(IdZona, NoZona)
VALUES (1, 'Região Oeste Potiguar'),
       (2, 'Central Potiguar'),
	   (3, 'Agreste Potiguar'),
	   (4, 'Leste Potiguar');

INSERT INTO TbVotos (IdZona, NuCandidato, QtVotos)
SELECT 1, NuCandidato, ROUND(RAND()*(100000-100)+100, 0)
  FROM TbCandidato
 UNION SELECT 2, NuCandidato, ROUND(RAND()*(100000-100)+100, 0)
  FROM TbCandidato
 UNION SELECT 3, NuCandidato, ROUND(RAND()*(100000-100)+100, 0)
  FROM TbCandidato
 UNION SELECT 4, NuCandidato, ROUND(RAND()*(100000-100)+100, 0)
  FROM TbCandidato;

INSERT INTO TbCandidato (NoCandidato, CoCargo, CoPartido)
VALUES ('Fábio Procópio', 1, 15),
       ('Marcelo Damasceno', 2, 21);
