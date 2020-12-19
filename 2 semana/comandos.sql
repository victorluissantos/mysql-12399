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

/* create function */
CREATE FUNCTION `soma` (valor_um INT, valor_dois INT)
RETURNS INTEGER
BEGIN
	DECLARE resultados INT DEFAULT 0;
    
    SET resultados = valor_um+valor_dois;
    
	RETURN resultados;
END


/* Retorna a data do primeiro anuncio */

CREATE FUNCTION `primeiro_anuncio` (pusuario_id INT)
RETURNS DATE
BEGIN

	DECLARE data_anuncio DATE;
    
    SET data_anuncio = (SELECT 
							a.data_criacao
						FROM 
							anuncios a 
						WHERE 
							usuario_id = pusuario_id
						ORDER BY 1 ASC
                        LIMIT 1);

	RETURN data_anuncio;
END

/* Chamando a função */
SELECT 
    u.*, 
    PRIMEIRO_ANUNCIO(u.id) as `primeiro_anuncio`
FROM
    usuarios u;

SELECT  ROUND(2020.2143, 2) AS `VALOR COM DUAS CASA`;
    
    
-- ROUND(o valor que voce formatar, a quantidade de casas decimais)


/* UNION */
SELECT 
    u.nome
FROM
    elances.usuarios u 
UNION SELECT 
    u.nome
FROM
    labrecho.usuarios u 
UNION SELECT 
    c.nome
FROM
    nlojas.clientes c;

-- base para criação de coluna virtualizada
SELECT 
    a.titulo,
    'elances' as `origem`
FROM
    elances.anuncios a 
UNION SELECT 
    p.nome,
    'nlojas'
FROM
    nlojas.produtos p;


/* Usando Replace */
SELECT 
    c.nome,
    c.celular,
    replace(c.celular,'-','') as `etiqueta`
FROM
    clientes c;

/* Usando TRIM com LEADING */
SELECT TRIM(LEADING 'leading' FROM 'leadingtext' ); 


SELECT 
    @b:='fui na minha sogra 20 vezes e as 20 vezes ela 20 vezes alface' AS `msg`,
    substring_index(@b, '20', -2) as `posição um`


/* Criando PROC */
CREATE PROCEDURE `upperNameProdutos`()
BEGIN
    -- Declarando todas as variáveis que usaremos
    DECLARE qtdProdutos INT(11) DEFAULT 0;
    DECLARE indice INT(11) DEFAULT 0;
    DECLARE idUpdate INT(11) Default 0;
    DECLARE nNome VARCHAR(22) Default 0;
    
    -- informa a quantidade de Produtos que tenho na tabela produtos
    SET qtdProdutos = (SELECT COUNT(p.id) FROm produtos p);

    WHILE indice < qtdProdutos DO
    
        SET idUpdate = (select p.id from produtos p LIMIT indice, 1);
        SET nNome = (select p.nome from produtos p LIMIT indice, 1);
        
        UPDATE `produtos` SET `nome`=UPPER(nNome) WHERE `id`=idUpdate;

        SET indice = indice+1;
    
    END WHILE;

END

-- testando 
CALL upperNameProdutos();

-- LOWER
SELECT
    @nome:='vICTOR' as `nome`,
    @primeira_letra:=UPPER('v') as `pletra`,
    @segunda_letra:=LOWER('ICTOR') as `rLetras`,
    CONCAT(@primeira_letra, @segunda_letra) as `menu_nome`;


SELECT
    SUBSTR('VICTOR', 2, 2) as `somente o I`,
    SUBSTR('vIctor', 1,1) as `primeira letra`,
    LENGTH('vIctor') as `qtd_caracteres`,
    @nome:= 'PeDrovistikinin' as `nome`,
    SUBSTR(@nome, 2, LENGTH(@nome)) as `tudo_menos_a_primeira`;
    