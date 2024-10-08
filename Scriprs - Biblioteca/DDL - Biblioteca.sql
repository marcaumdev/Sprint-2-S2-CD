CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE autores(
id INT(10) NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
data_nascimento DATETIME NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE livros(
id INT(100) NOT NULL AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
ano_publicado DATETIME NOT NULL,
id_autor INT(10),
PRIMARY KEY(id),
FOREIGN KEY (id_autor) REFERENCES autores(id)
);

CREATE TABLE membros(
id INT(10) NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
data_adesao DATETIME NOT NULL,
data_nascimento DATETIME NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE emprestimos(
id INT(10) NOT NULL AUTO_INCREMENT,
id_membro INT(10) NOT NULL,
id_livro INT(10) NOT NULL,
data_emprestimo DATETIME NOT NULL,
data_devolucao DATETIME NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (id_membro) REFERENCES membros(id),
FOREIGN KEY (id_livro) REFERENCES livros(id)
);

ALTER TABLE emprestimos MODIFY COLUMN data_devolucao DATETIME NULL;