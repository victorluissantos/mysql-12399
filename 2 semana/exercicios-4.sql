/*Exercicio*/
-- Criar proc para deixar os nomes do cclienste e razao social dos fornecedores em maiusculo
CREATE DEFINER=`root`@`%` PROCEDURE `upperNameProdutos`()
BEGIN
	-- Declarando todas as variáveis que usaremos
	DECLARE qtdProdutos INT(11) DEFAULT 0;
    DECLARE qtdClientes INT(11) DEFAULT 0;
    DECLARE qtdFornecedores INT(11) DEFAULT 0;
    DECLARE indice INT(11) DEFAULT 0;
    DECLARE idUpdate INT(11) Default 0;
    DECLARE nNome VARCHAR(22) Default 0;
    DECLARE nClienteNome VARCHAR(22) Default 0;
    DECLARE nRazaoSocial VARCHAR(22) Default 0;
    
    -- informa a quantidade de Produtos que tenho na tabela produtos
    SET qtdProdutos = (SELECT COUNT(p.id) FROm produtos p);
    SET qtdClientes = (SELECT COUNT(c.id) FROm clientes c);
    SET qtdFornecedores = (SELECT COUNT(f.id) FROm fornecedores f);

	WHILE indice < qtdProdutos DO
    
		SET idUpdate = (select p.id from produtos p LIMIT indice, 1);
        SET nNome = (select p.nome from produtos p LIMIT indice, 1);
        
        UPDATE `produtos` SET `nome`=UPPER(nNome) WHERE `id`=idUpdate;

		SET indice = indice+1;
    
    END WHILE;
    
    SET indice = 0;
    -- clientes
	WHILE indice < qtdFornecedores DO
    
		SET idUpdate = (select c.id from clientes c LIMIT indice, 1);
        SET nClienteNome = (select c.nome from clientes c LIMIT indice, 1);
        
        UPDATE `clientes` SET `nome`=UPPER(nClienteNome) WHERE `id`=idUpdate;

		SET indice = indice+1;
    
    END WHILE;

    
    SET indice = 0;
    -- fornecedores
	WHILE indice < qtdProdutos DO
    
		SET idUpdate = (select f.id from fornecedores f LIMIT indice, 1);
        SET nRazaoSocial = (select f.razao_social from fornecedores f LIMIT indice, 1);
        
        UPDATE `fornecedores` SET `razao_social`=UPPER(nRazaoSocial) WHERE `id`=idUpdate;

		SET indice = indice+1;
    
    END WHILE;

END

-- 2. Criar uma função que receba um texto cmo o de descrição do produto e retorna o mesmo porém com somente a primeira letra em maiusculo
-- Entrada: este modelo
-- Saida: Este modelo
CREATE FUNCTION `upFirst` (palavra VARCHAR(250))
RETURNS VARCHAR(250)
BEGIN
    DECLARE primeira_letra VARCHAR(250) DEFAULT NULL;
    DECLARE restante_palavra VARCHAR(250) DEFAULT NULL;
    DECLARE palavra_formatada VARCHAR(250) DEFAULT NULL;
    DECLARE qtd_caracter INT(11) DEFAULT 0;
    
    SET primeira_letra = SUBSTR(palavra, 1, 1); -- pegando a primeira letra
    SET qtd_caracter = LENGTH(palavra); -- Contando a quantidade de caracteres
    SET restante_palavra = SUBSTR(palavra, 2, qtd_caracter); -- Setando o restante da palavra
    
    SET primeira_letra = UPPER(primeira_letra); -- Deixando a primeira letra em maiusculo
    SET restante_palavra = LOWER(restante_palavra); -- Deixando o restante em minusculo
    
    SET palavra_formatada = CONCAT(primeira_letra, restante_palavra); -- concatenando para formar a palavra original formatada
    
RETURN palavra_formatada;
END
