USE biblioteca;

SELECT id, titulo, ano_publicado FROM livros WHERE ano_publicado =(SELECT MIN(ano_publicado) FROM livros);
SELECT id, titulo, ano_publicado FROM livros WHERE ano_publicado =(SELECT MAX(ano_publicado) FROM livros);

SELECT COUNT(id) FROM livros;

SELECT id, titulo, ano_publicado FROM livros WHERE ano_publicado = "2024/07/18";

SELECT * FROM autores ORDER BY nome ASC;
SELECT * FROM autores ORDER BY nome DESC;