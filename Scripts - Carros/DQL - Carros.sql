USE bdcarro;

SELECT * FROM tbproprietario;
SELECT * FROM tbcarros;

SELECT marca, modelo FROM tbcarros;

SELECT MAX(valor) FROM tbcarros;

SELECT MIN(numeroVendas) FROM tbcarros;

SELECT * FROM tbcarros WHERE marca = 'Gol';

SELECT * FROM tbcarros WHERE cor = 'Vermelho';

SELECT marca, modelo, ano, valor FROM tbcarros WHERE valor = (SELECT MIN(valor) FROM tbcarros);

SELECT COUNT(id) FROM tbcarros;

SELECT COUNT(DISTINCT(marca)) FROM tbcarros;

SELECT SUM(valor) FROM tbcarros;

SELECT * FROM tbcarros ORDER BY modelo ASC;
SELECT * FROM tbcarros ORDER BY marca DESC;

SELECT COUNT(id) AS 'Total de Registros', marca, ano FROM tbcarros WHERE ano BETWEEN '2015' AND '2024' GROUP BY marca, ano;