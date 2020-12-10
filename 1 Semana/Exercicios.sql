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