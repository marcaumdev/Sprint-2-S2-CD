-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.
USE db_clinica;

SELECT * FROM tb_pets;
SELECT * FROM tb_atendimentos;
SELECT * FROM tb_clientes;
SELECT * FROM tb_veterinarios;

DELIMITER $$
CREATE FUNCTION QuantidadePets(idCliente INT)
RETURNS INT
READS SQL DATA

BEGIN
DECLARE total INT;
SELECT COUNT(id_cliente) INTO total FROM tb_pets
WHERE id_cliente = idCliente;
RETURN total;
END $$
DELIMITER ;

SELECT nome, QuantidadePets(id_cliente) FROM tb_clientes;

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
-- O QUE VC PRECISA
-- OQ VC PRECISA FAZER
-- OQ VC PRECISA RETORNAR
DELIMITER $$
CREATE FUNCTION UltimaConsulta(idPet INT)
RETURNS DATE
READS SQL DATA 

BEGIN 
DECLARE ConsultaUltima DATE;
SELECT MAX(data_atendimento) INTO ConsultaUltima FROM tb_atendimentos WHERE id_pet = idPet;
RETURN ConsultaUltima;
END $$
DELIMITER ;

SELECT nome, UltimaConsulta(id_pet) FROM tb_pets;

-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
DELIMITER $$
CREATE FUNCTION numeroTotal(idVet INT)
RETURNS INT
READS SQL DATA 

BEGIN
DECLARE NumAtend INT;
SELECT COUNT(id_veterinario) INTO NumAtend FROM tb_atendimentos
WHERE id_veterinario = idVet;
RETURN NumAtend;
END$$
DELIMITER ;

SELECT nome, numeroTotal(id_veterinario) FROM tb_atendimentos;
-- Exercicio 4. Crie uma função que receba o id_pet e retorne o nome do dono (cliente) desse pet.
DELIMITER $$
CREATE FUNCTION nomeDono(id_petp INT)
RETURNS VARCHAR(255)
READS SQL DATA

BEGIN
DECLARE nome_cliente VARCHAR(255);
SELECT C.nome INTO nome_cliente FROM tb_clientes AS C 
INNER JOIN tb_pets AS P ON C.id_cliente = P.is_cliente
WHERE P.id_pet = id_petp

END