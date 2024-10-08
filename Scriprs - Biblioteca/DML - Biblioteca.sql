USE biblioteca;

INSERT INTO autores(nome, data_nascimento) VALUES
('Juan','2003/05/16'),
('Renata','2005/10/26'),
('Marcos','2004/09/04'),
('Gustavo','2005/08/15'),
('Bill','1998/05/07');

INSERT INTO autores(nome, data_nascimento) VALUES
('Michael','2010/05/07');
SELECT * FROM autores;

INSERT INTO livros(titulo, ano_publicado, id_autor) VALUES
('O auto da compadecida','2013/06/10', '1'),
('Diário de um banana','2021/02/21', '3'),
('Pequeno príncipe','2019/12/06', '5'),
('Livro do lucas neto','2024/07/18', '2'),
('Rezendeevil','2016/01/24', '4');

INSERT INTO membros(nome, data_adesao, data_nascimento) VALUES
('Jéssica','2024/04/13','1993/06/10'),
('Caique','2024/04/13','1991/02/21'),
('Zé pequeno','2024/04/13','1999/12/06'),
('Clodoaldo','2024/04/13','1994/04/13'),
('Carol','2024/04/13','1996/01/24');

INSERT INTO emprestimos(id_membro, id_livro, data_emprestimo, data_devolucao) VALUES
('1','5','2021/04/13','2023/04/01'),
('2','2','2022/04/13','2021/02/24'),
('3','1','2013/04/13','2016/04/13'),
('4','4','2008/04/13','2024/07/18'),
('5','2','2010/04/13','2021/04/13'),
('5','5','2021/04/13','2023/04/01'),
('1','4','2022/04/13','2021/02/24'),
('1','1','2013/04/13','2016/04/13'),
('1','4','2008/04/13','2024/07/18'),
('1','2','2010/04/13','2021/04/13');

INSERT INTO emprestimos(id_membro, id_livro, data_emprestimo) VALUES
('4','5','2024-10-07');

SELECT * FROM emprestimos;