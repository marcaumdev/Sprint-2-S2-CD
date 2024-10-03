USE bdcarro;

SELECT * FROM tbproprietario AS P
INNER JOIN 	tbcarros AS C
ON P.idcarro = C.id;

SELECT * FROM tbproprietario
RIGHT JOIN tbcarros 
ON tbproprietario.idcarro = tbcarros.id;

SELECT * FROM tbcarros AS C
LEFT JOIN tbproprietario AS P
ON C.id = P.idcarro;

SELECT * FROM tbproprietario AS P
LEFT JOIN tbcarros AS C
ON P.idcarro = c.id
UNION
SELECT * FROM tbproprietario AS P
RIGHT JOIN tbcarros AS C
ON C.id = P.idcarro
WHERE P.idcarro IS NULL;

SELECT * FROM tbproprietario;
SELECT * FROM tbcarros;