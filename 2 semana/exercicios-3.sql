-- 1. Uma query que busque todos os produtos para gato do sistema, seja em nome ou descrição
SELECT 
    p.id, p.nome, p.descricao
FROM
    produtos p
WHERE
    UPPER(p.nome) LIKE UPPER('%gato%')
        OR UPPER(p.descricao) LIKE UPPER('%gato%');