SELECT AVG(ano_publicado) FROM livros;

SELECT nome FROM autores
WHERE id IN (SELECT id_autor FROM livros
				WHERE ano_publicado > (SELECT AVG(ano_publicado) FROM livros));
                
SELECT id, nome FROM membros 
WHERE id IN (SELECT id_membro FROM emprestimos GROUP BY id_membro HAVING COUNT(id_membro) > 1);

SELECT id, titulo FROM livros 
WHERE id IN (SELECT id_livro FROM emprestimos);

SELECT id, titulo FROM livros 
WHERE id NOT IN (SELECT id_livro FROM emprestimos);

set @@autocommit = ON;