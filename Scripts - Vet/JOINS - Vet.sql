USE clinicavetbd;

SELECT * FROM veterinarios;

SELECT * FROM clientes AS C
INNER JOIN pets AS P
ON C.id = P.id_cliente;

SELECT * FROM veterinarios AS V
INNER JOIN atendimentos AS A
ON V.id = A.id_veterinario;

SELECT * FROM pets AS P
INNER JOIN atendimentos AS A
ON P.id = A.id_pet
INNER JOIN veterinarios AS V
ON V.id = A.id_veterinario;

SELECT * FROM atendimentos AS A
INNER JOIN pets AS P
ON A.id_pet = P.id
INNER JOIN clientes AS C
ON P.id_cliente = C.id
INNER JOIN veterinarios AS V
ON A.id_veterinario = V.id
WHERE A.data_nascimento = (SELECT MAX(data_nascimento) FROM atendimentos); -- Escrevi errado (SOU BURRO!) no lugar de nascimento vc escreve atendimento

SELECT * FROM atendimentos AS A
RIGHT JOIN veterinarios AS V
ON A.id_veterinario = V.id;

SELECT * FROM clientes AS C
LEFT JOIN pets AS P
ON C.id = P.id_cliente;

SELECT * FROM clientes AS C
LEFT JOIN pets AS P
ON P.id_cliente = C.id_cliente
UNION
SELECT * FROM tb_pets AS P
RIGHT JOIN tb_pets AS P
ON P.id_cliente = C.id;

SELECT * FROM atendimentos AS A
LEFT JOIN pets AS P
ON P.id= C.id_pet
UNION
SELECT * FROM atendimentos AS A
RIGHT JOIN pets AS P
ON P.id = C.id_pet;

SELECT * FROM veterinarios AS V
LEFT JOIN atendimentos AS A
ON V.id = A.id_veterinario
UNION
SELECT * FROM veterinarios AS V
RIGHT JOIN atendimentos AS A
ON V.id = A.id_veterinario;

SELECT * FROM atendimentos AS A 
LEFT JOIN pets AS P
ON A.id_pet = P.id
UNION
SELECT * FROM atendimentos AS A 
RIGHT JOIN pets AS P
ON A.id_pet = P.id;