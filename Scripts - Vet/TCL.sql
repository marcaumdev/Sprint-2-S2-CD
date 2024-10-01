SET @@autocommit = OFF;

SELECT * FROM tbproprietario;

INSERT INTO tbpropretario VALUES(
'5',
'Juscelino',
'4',
'35'
);

ROLLBACK;

DELETE FROM tbproprietario
WHERE id = 2;

ROLLBACK;

SELECT * FROM tbproprietario;