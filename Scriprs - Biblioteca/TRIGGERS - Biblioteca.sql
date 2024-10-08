-- Exercicio 1. Criar uma trigger que impeça a inserção de autores com menos de 18 anos.
CREATE DEFINER=`root`@`localhost` TRIGGER `autores_BEFORE_INSERT` BEFORE INSERT ON `autores` FOR EACH ROW BEGIN
IF TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE()) < 18 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = "O autor deve ser maior de 18 anos!";
END IF;
END
-- Exercicio 2. Criar uma trigger que atualize automaticamente a data de devolução para 15 dias após a data de empréstimo.
CREATE DEFINER = CURRENT_USER TRIGGER `biblioteca`.`emprestimos_BEFORE_INSERT` BEFORE INSERT ON `emprestimos` FOR EACH ROW
BEGIN
SET NEW.data_devolucao = TIMESTAMPDIFF(DAY, NEW.data_emprestmo, CURDATE()) + 15;
END
-- Exercicio 3. Criar uma trigger que impeça que um membro faça mais de 3 empréstimos ao mesmo tempo.
-- Exercicio 4. Trigger de Atualização Automática da Data de Adesão
-- Exercicio 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.