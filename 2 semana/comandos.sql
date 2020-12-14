/*Incluindo coluna na tabela usuarios*/
ALTER TABLE `elances`.`usuarios` 
ADD COLUMN `sexo` ENUM('Masculino', 'Feminino', 'Indefinido') NOT NULL DEFAULT 'Indefinido' AFTER `situacao`,
ADD COLUMN `data_nascimento` DATE NULL AFTER `sexo`;


/*Ajustando as datas e gender*/
UPDATE `elances`.`usuarios` SET `nome`='Victor Luis', `sexo`='Masculino', `data_nascimento`='1992-01-10' WHERE `id`='2';
UPDATE `elances`.`usuarios` SET `data_nascimento`='1982-10-10' WHERE `id`='1';
UPDATE `elances`.`usuarios` SET `data_nascimento`='2002-11-14' WHERE `id`='4';
UPDATE `elances`.`usuarios` SET `sexo`='Feminino' WHERE `id`='3';
UPDATE `elances`.`usuarios` SET `sexo`='Masculino', `data_nascimento`='1978-05-02' WHERE `id`='7';
UPDATE `elances`.`usuarios` SET `nome`='Victor Santos', `data_nascimento`='1984-05-25' WHERE `id`='6';
UPDATE `elances`.`usuarios` SET `sexo`='Feminino', `data_nascimento`='1997-08-22' WHERE `id`='11';
UPDATE `elances`.`usuarios` SET `nome`='Dayane', `data_nascimento`='2003-05-18' WHERE `id`='12';
UPDATE `elances`.`usuarios` SET `situacao`='Inativo' WHERE `id`='8';


SELECT 
    IF(1 < 2,
        'primeira virgula',
        'Segunda virgula') AS `nosso_if`;