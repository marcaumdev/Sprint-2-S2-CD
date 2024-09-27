-- CRIAR BASE DE DADOS (DATABASE)

CREATE DATABASE bdCarro;

-- ACESSAR A BASE DE DADOS
USE bdCarro;

-- CRIAR TABELA
CREATE TABLE tbCarros(
id INT(10) NOT NULL,
marca VARCHAR(100) NOT NULL,
modelo VARCHAR(100) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
cor VARCHAR(50) NOT NULL,
numeroVendas INT(10),
ano INT(4),
PRIMARY KEY(id)
);

-- NOT NULL -> Campo Obrigatório

SELECT * FROM tbCarros;

CREATE TABLE tbProprietario(
id INT(10) NOT NULL,
nome VARCHAR(100) NOT NULL,
idCarro INT(10) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (idCarro) REFERENCES tbCarros(id)
);

CREATE TABLE tbHistoricoPreco(
id INT(10) NOT NULL AUTO_INCREMENT,
dataModificacao DATETIME,
valorAnterior DECIMAL(10,2),
valorNovo DECIMAL(10,2),
idCarro INT(10) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (idCarro) REFERENCES tbCarros(id)
);

ALTER TABLE tbProprietario ADD idade INT(3) NOT NULL;

ALTER TABLE tbProprietario DROP COLUMN idade;

SELECT * FROM tbProprietario

-- DELETAR A BASE
-- DROP DATABASE bd_carro;
