SELECT 
    id, nome, email, senha
FROM
    usuarios;

/* #Exemplo
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); 
*/

/* #Exemplo
INSERT INTO table_name
VALUES (value1, value2, value3, ...); 
*/

INSERT 
INTO usuarios 
(nome, email, senha) 
VALUE 
('Victor Luis', 'victorluissantos@live.com', '123456');


SELECT 
    id, nome, email
FROM
    usuarios
WHERE
	id = 3;


/* TIPOLOGIA DE CAMPOS enum E INDEXAÇÃO */ -- AULA 3

CREATE SCHEMA `elances` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

USE elances;

CREATE TABLE `elances`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `situacao` VARCHAR(45) NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`));


CREATE TABLE `elances`.`anuncios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL DEFAULT 'Produto',
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(450) NULL,
  `valor_minimo` DECIMAL(22,2) NOT NULL,
  `situacao` VARCHAR(45) NOT NULL DEFAULT 'Ativo',
  `data_criacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


INSERT INTO usuarios (nome, uf) VALUE ('Debora','RS');


DELETE FROM usuarios 
WHERE
    id IN (13 , 14); -- se for excluir os id 13 e 14
    
    
DELETE FROM usuarios 
WHERE
    id = 1; -- exclui somente o id 1


ALTER TABLE `elances`.`anuncios` 
CHANGE COLUMN `tipo` `tipo` ENUM('Produto', 'Serviço') CHARACTER SET 'utf8' NOT NULL DEFAULT 'Produto' ,
ADD INDEX `idx_tipo` (`tipo` ASC);


ALTER TABLE `elances`.`anuncios` 
CHANGE COLUMN `situacao` `situacao` ENUM('Ativo', 'Vendido', 'Excluído') CHARACTER SET 'utf8' NOT NULL DEFAULT 'Ativo' ,
ADD INDEX `idx_situacao` (`situacao` ASC);


ALTER TABLE `elances`.`anuncios` 
ADD INDEX `fk_anuncios_usuario_idx` (`usuario_id` ASC);
ALTER TABLE `elances`.`anuncios` 
ADD CONSTRAINT `fk_anuncios_usuario`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `elances`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*Buscando valor por indice/ponteiro*/
SELECT 
    tipo,
    titulo,
    valor_minimo,
    situacao,
    (SELECT 
            nome
        FROM
            usuarios
        WHERE
            id = usuario_id  ) AS `nome`
FROM
    anuncios;


/* SUBQUERYS CONCEITO, APLICAÇÃO E LIMITAÇÃO */ -- AULA 4
SELECT 
    usuario_id,
    (SELECT 
            nome
        FROM
            usuarios
        WHERE
            id = usuario_id) AS `nome`,
    tipo,
    titulo
FROM
    anuncios
WHERE
    (SELECT 
            situacao
        FROM
            usuarios
        WHERE
            id = usuario_id) = 'Ativo';