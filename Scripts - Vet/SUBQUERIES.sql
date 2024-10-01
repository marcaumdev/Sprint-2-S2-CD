USE bdcarro;

SELECT * FROM tbcarros
WHERE valor > (SELECT AVG(valor) FROM tbcarros);

SELECT * FROM tbcarros;

SELECT * FROM tbproprietario
WHERE idcarro = 1;

SELECT nome FROM tbproprietario
WHERE idcarro = (SELECT id FROM tbcarros WHERE marca = "Fiat");

