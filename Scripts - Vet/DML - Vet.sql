USE ClinicaVetBD;

INSERT INTO veterinarios(nome, especialidade, telefone) VALUES
('Juan','Cachorro','11962537467'),
('Renata','Cobra','11963526537'),
('Marcos','Gato','11973648594'),
('Gustavo','Baleia','11904837465'),
('Bill','Cabra','11930472654');

SELECT * FROM veterinarios;

INSERT INTO clientes(nome, endereco, telefone) VALUES
('Jessica','Av. goitacazes','11962537467'),
('Caique','Av. Paulista','11963526537'),
('Carol','Chuva de ouro','11973648594'),
('Priscila','Julio Barbosa de Lima','11904837465'),
('Sibov','Aderito Pereira Da Silva','11930472654');

SELECT * FROM clientes;

INSERT INTO pets(idcliente, nome, tipo, raca, datanascimento) VALUES
('3', 'Logan','Cavalo','Belga', '2015-08-21'),
('1', 'Bob','Cachorro','Pastor Alemão', '2020-05-14'),
('4', 'Peixonauta','Peixe','Beta', '2024-05-04'),
('2', 'Garfield','Gato','Laranja', '2013-09-04'),
('5', 'Leonardo','Camaleão','Verde', '2017-01-31');

SELECT * FROM pets;

INSERT INTO atendimentos(idpet, idveterinario, dataatendimento, descricao) VALUES
('3','4','2024-09-27', 'em bom estado'),
('1','3', '2024-02-14', 'em bom estado'),
('4','5','2024-07-17', 'em bom estado'),
('2','2','2024-06-25', 'em bom estado'),
('5','1','2024-04-30', 'em bom estado');

SELECT * FROM atendimentos;