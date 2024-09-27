INSERT INTO tbcarros VALUES(
'1',
'Fiat',
'Uno',
'20000.00',
'Verde',
'50000',
'1990'
);

INSERT INTO tbcarros VALUES(
'2',
'Honda',
'Civic',
'60000.00',
'Prata',
'65000',
'2012'
);

INSERT INTO tbcarros VALUES(
'3',
'Wolksvagem',
'Kombi',
'30000.00',
'Prata',
'99000',
'2018'
);

INSERT INTO tbcarros VALUES(
'4',
'Gol',
'Bolinha',
'45000.00',
'Vermelho',
'105000',
'2015'
);

INSERT INTO tbcarros VALUES(
'5',
'Gol',
'Quadrada',
'45000.00',
'Azul',
'109000',
'2017'
);

INSERT INTO tbcarros VALUES(
'6',
'BMW',
'I30',
'100000.00',
'Branco',
'120000',
'2021'
);

INSERT INTO tbcarros VALUES(
'7',
'Ferrari',
'Puro Sangue',
'200000.00',
'Vermelho',
'109000',
'2020'
);

INSERT INTO tbcarros VALUES(
'8',
'Lamborguini',
'Temerario',
'400000.00',
'Amarelo',
'1000000',
'2024'
);

INSERT INTO tbcarros VALUES(
'9',
'Porsche',
'Temerario',
'150000.00',
'Preto',
'2000000',
'2019'
);

INSERT INTO tbcarros VALUES(
'10',
'Land Rover',
'Range Rover Evoque',
'1500000.00',
'Ciano',
'20000000',
'2015'
);

INSERT INTO tbproprietario VALUES(
'1',
'Marcos',
'10',
'20'
);

INSERT INTO tbproprietario VALUES(
'2',
'Juan',
'1',
'21'
);

INSERT INTO tbproprietario VALUES(
'3',
'Bill',
'6',
'26'
);

INSERT INTO tbproprietario VALUES(
'4',
'Julio',
'7',
'50'
);

INSERT INTO tbproprietario VALUES(
'5',
'Telma',
'3',
'48'
);

INSERT INTO tbproprietario VALUES(
'6',
'Renata',
'4',
'18'
);

SELECT * FROM tbproprietario;

SELECT * FROM tbcarros;

UPDATE tbcarros SET valor = 150000 WHERE id = 1;

DELETE FROM tbcarros WHERE id = 11;