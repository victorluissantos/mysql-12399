-- 1. Uma query que busque todos os produtos para gato do sistema, seja em nome ou descrição
SELECT 
    p.id, p.nome, p.descricao
FROM
    produtos p
WHERE
    UPPER(p.nome) LIKE UPPER('%gato%')
        OR UPPER(p.descricao) LIKE UPPER('%gato%');

-- 2. junção da tabela elances.anuncio com a tabela nlojas.produtos
-- titulo = nome
SELECT 
    a.titulo
FROM
    elances.anuncios a 
UNION SELECT 
    p.nome
FROM
    nlojas.produtos p;


-- 3. listagem de todos os usuários/clientes com a origem de cada um
SELECT 
    u.nome,
    'elances' as `origem`
FROM
    elances.usuarios u 
UNION SELECT 
    u.nome,
    'labrecho'
FROM
    labrecho.usuarios u 
UNION SELECT 
    c.nome,
    'nlojas'
FROM
    nlojas.clientes c;

-- 4 quero saber qual das três bases tem o maior número/volume de usuários/clientes
/*
Origem | Quantidade 
elances | 20 
nlojas | 11
*/
SELECT 
    COUNT(c.id) AS `total`,
    'nlojas' as `origem`
FROM
    nlojas.clientes c 
UNION SELECT 
    COUNT(u.id),
    'elances'
FROM
    elances.usuarios u 
UNION SELECT 
    COUNT(u.id),
    'labrechos'
FROM
    labrecho.usuarios u ORDER BY 1 DESC LIMIT 1;

-- 5. remover tudo deixando somente os números
-- entrada/ como esta (41) 3335-2271
-- Saida/ como deve ficar 4133352271
SELECT 
    c.nome,
    c.celular,
    REPLACE(REPLACE(REPLACE(REPLACE(c.celular, '-', ''),
                '(',
                ''),
            ')',
            ''),
        ' ',
        '') AS `etiqueta`
FROM
    clientes c;
-- remover (, ), - ' '

-- Criando função para limpar
CREATE FUNCTION `limpanumero` (pnumero VARCHAR(22))
RETURNS VARCHAR(22)
BEGIN

	DECLARE numero_limpo VARCHAR(22) DEFAULT '';
	SET numero_limpo = (REPLACE(REPLACE(REPLACE(REPLACE(pnumero, '-', ''),
                '(',
                ''),
            ')',
            ''),
        ' ',
        ''));

RETURN numero_limpo;
END

-- testando função
SELECT 
    c.nome,
    c.celular,
    limpanumero(c.celular) AS `etiqueta`
FROM
    clientes c;