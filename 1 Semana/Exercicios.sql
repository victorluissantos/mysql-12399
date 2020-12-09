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