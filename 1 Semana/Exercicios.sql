-- 1. Lista de usuários do sistema, lista de nomes não repetindo
SELECT DISTINCT
    nome
FROM
    usuarios;

-- 2. O nome que mais se repete entre os usuários cadastrados no sistema
SELECT 
    nome
FROM
    usuarios
GROUP BY 1
ORDER BY COUNT(id) DESC
LIMIT 1;

-- 3. O primeiro usuário cadastrado no sistema
-- Errada/complicada
SELECT 
    GROUP_CONCAT(nome) as `primeiros_usuarios`,
    data_cadastro
FROM
    usuarios
GROUP BY data_cadastro
ORDER BY data_cadastro ASC
LIMIT 1;

-- Correta
SELECT 
    nome
FROM
    usuarios
ORDER BY id ASC
LIMIT 1;

-- 4. O último usuário cadastrado no sistema
SELECT 
    nome
FROM
    usuarios
ORDER BY id DESC
LIMIT 1;


-- Exercicios elance, dia 4
-- 1. uma lista dos usuários com uma coluna referenciando a quantidade de anuncios que o usuário tem
SELECT 
    id,
    nome,
    uf,
    situacao,
    (SELECT 
            COUNT(id) AS `total`
        FROM
            anuncios
        WHERE
            usuario_id = u.id) AS `qtd_anuncios`
FROM
    usuarios u;

-- 1.2 uma lista dos usuários com uma coluna referenciando a quantidade de anuncios que o usuário tem, só exibindo quem tem mais de 0
SELECT 
    id,
    nome,
    uf,
    situacao,
    (SELECT 
            COUNT(id) AS `total`
        FROM
            anuncios
        WHERE
            usuario_id = u.id) AS `qtd_anuncios`
FROM
    usuarios u
WHERE
    (SELECT 
            COUNT(id) AS `total`
        FROM
            anuncios
        WHERE
            usuario_id = u.id) > 0;

-- 2 Lista de anuncios que o usuário esta inativo
SELECT 
    *
FROM
    anuncios
WHERE
    (SELECT 
            situacao
        FROM
            usuarios
        WHERE
            id = usuario_id) = 'Inativo';

-- 3 Uma lista dos usuarios com o total/soma de valor mínimo dos anuncios
SELECT 
    id,
    nome,
    uf,
    situacao,
    (SELECT 
            SUM(valor_minimo)
        FROM
            anuncios
        WHERE
            usuario_id = u.id) AS `total`
FROM
    usuarios u;


-- 3.1 Uma lista dos usuarios com o total/soma de valor mínimo dos anuncios, exibindo somente quem tem anuncio
SELECT 
    id,
    nome,
    uf,
    situacao,
    (SELECT 
            SUM(valor_minimo)
        FROM
            anuncios
        WHERE
            usuario_id = u.id) AS `total`
FROM
    usuarios u
WHERE
    (SELECT 
            SUM(valor_minimo)
        FROM
            anuncios
        WHERE
            usuario_id = u.id) IS NOT NULL;


/* SEGUNDA LEVA DE EXERCICIOS USANDO O JOIN */

-- 1 exibir uma lista de usuários na forma de hanking de quem tem mais valor_minimo
SELECT 
    u.nome,
    COUNT(a.id) as `anuncios`
FROM
    usuarios u
    JOIN
    anuncios a ON u.id = a.usuario_id
GROUP BY u.id
ORDER BY 2 DESC;

-- 1.1 exibir uma lista de usuários na forma de hanking de quem tem mais anuncios ativos
SELECT 
    u.nome, COUNT(a.id) AS `total`
FROM
    usuarios u
        JOIN
    anuncios a ON u.id = a.usuario_id
WHERE
    a.situacao = 'Ativo'
GROUP BY u.id
ORDER BY 2 DESC;

-- 2 qual o Estado que mais tem usuários cadastrados e ativos
SELECT
    u.uf,
    COUNT(u.id) as `total`
FROM
    usuarios u
WHERE
    u.situacao = 'Ativo'
GROUP BY u.uf
ORDER BY 2 DESC;


-- 2.2 qual o Estado que mais tem usuários cadastrados e inativos
SELECT
    u.uf,
    COUNT(u.id) as `total`
FROM
    usuarios u
WHERE
    u.situacao = 'Inativo'
GROUP BY u.uf
ORDER BY 2 DESC;

-- 2.3 qual o Estado que mais tem usuários com anuncio
SELECT
    u.uf,
    COUNT(a.id) as `total`
FROM
    usuarios u
    JOIN
    anuncios a ON u.id = a.usuario_id
GROUP BY 1
ORDER BY 2 DESC;

-- 2.4 qual o Estado que mais tem valor_minimo
SELECT 
    u.uf,
    SUM(a.valor_minimo) as `soma_anuncio`
FROM
    usuarios u
    JOIN
    anuncios a ON u.id = a.usuario_id
GROUP BY 1
ORDER BY 2 DESC;


/* quinto dia, lidando com datas e concatenar */

-- 1. Exibir a data de criacao do anuncio no padrao brasileiro, somente a data sem hora
SELECT 
    tipo,
    CONCAT(DAY(data_criacao),
            '/',
            MONTH(data_criacao),
            '/',
            YEAR(data_criacao)) AS `data`
FROM
    anuncios;

-- 2. qual o dia que mais tivemos anuncios
SELECT 
    COUNT(id) `qtd_anuncios`,
    CONCAT(DAY(data_criacao)) AS `dia_com_mais_anuncios`
FROM
    anuncios
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1;

-- 3. qual o mes que mais tivemos anuncios
SELECT 
    COUNT(id) `qtd_anuncios`,
    CONCAT(MONTH(data_criacao)) AS `mes_com_mais_anuncios`
FROM
    anuncios
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1;

-- 4 qual a hora que mais tivemos anuncios
SELECT 
    COUNT(id) `qtd_anuncios`,
    CONCAT(HOUR(data_criacao)) AS `hora_com_mais_anuncios`
FROM
    anuncios
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1;


-- 5 todos os anuncios que foram realizados no segundos semestre do ano corrente/2020
SELECT
    tipo, 
    DATE_FORMAT(data_criacao, '%d/%m/%Y') AS `data`
FROM
    anuncios
WHERE
    MONTH(data_criacao) > 6
    AND YEAR(data_criacao) = YEAR(CURDATE());


-- 6 Qual o usuario que mais deu lance no sistema
-- 7 qual o usuario que mais deu lances no sistema no primeiro semestre do ano corrente
-- 8 qual o anuncio que mais teve lance
-- 9 qual o anuncio que teve o lance mais caro
-- 10 qual o anuncio que teve o lance mais barato
-- 11 qual o anuncio que o anunciante deu pelo menos um lance no proprio anuncio
-- 12 uma view por meio da qual consiga ver uma lista dos anuncios dos usuarios
-- 13 uma view por meio da qual consiga ver os lances dos anuncios