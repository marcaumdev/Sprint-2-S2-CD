use biblioteca;

SELECT nome, data_emprestimo, data_devolucao, titulo FROM membros AS M
INNER JOIN 	emprestimos AS E ON M.id = E.id_membro
INNER JOIN 	livros AS L ON E.id_livro = L.id;

SELECT nome, data_emprestimo, data_devolucao, titulo FROM livros AS L
INNER JOIN 	emprestimos AS E ON L.id = E.id_livro
INNER JOIN 	autores AS A ON A.id = L.id_autor;

SELECT nome, data_emprestimo, data_devolucao, Titulo FROM emprestimos AS E
INNER JOIN 	livros AS L ON E.id_livro = L.id
RIGHT JOIN membros 
ON E.id_membro = membros.id;

SELECT titulo, nome, data_emprestimo FROM livros AS L
LEFT JOIN emprestimos AS E ON L.id = E.id_livro
INNER JOIN autores AS A ON L.id_autor = A.id
WHERE E.id IS NULL;

SELECT L.titulo, A.nome FROM livros AS L
LEFT JOIN tb_autores AS A
ON L.id_autor = A.id
UNION
SELECT L.titulo, A.nome FROM autores AS A
LEFT JOIN livros AS L
ON L.id_autor = A.id;

SELECT * FROM membros AS M
LEFT JOIN emprestimos AS E
ON M.id = E.id_membro
LEFT JOIN livros AS L
ON L.id = E.id_livro
WHERE id_membro IS NULL;