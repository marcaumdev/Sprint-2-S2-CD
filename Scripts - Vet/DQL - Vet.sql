USE ClinicaVetBD;

SELECT id, idcliente, tipo, raca, datanascimento FROM pets WHERE datanascimento =(SELECT MIN(datanascimento) FROM pets);

SELECT id, idcliente, tipo, raca, datanascimento FROM pets WHERE datanascimento =(SELECT MAX(datanascimento) FROM pets);

SELECT COUNT(id) FROM pets;

SELECT * FROM pets ORDER BY nome ASC;
SELECT * FROM pets ORDER BY nome DESC;


SELECT * FROM veterinarios ORDER BY nome ASC;
SELECT * FROM veterinarios ORDER BY nome DESC;

SELECT id, idpet, idveterinario, dataatendimento, descricao FROM atendimentos WHERE dataatendimento =(SELECT MIN(dataatendimento) FROM atendimentos);
SELECT id, idpet, idveterinario, dataatendimento, descricao FROM atendimentos WHERE dataatendimento =(SELECT MAX(dataatendimento) FROM atendimentos);