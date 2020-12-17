-- 1 encontre todos os clientes que nunca tiveram uma venda
SELECT
	c.*
FROM
	clientes c
    	LEFT JOIN
    vendas v ON c.id = v.cliente_id
WHERE
	v.id is null;

-- 2 fornecedores que não tem produto cadastrado
SELECT 
    f.*
FROM
    fornecedores f
        LEFT JOIN
    fornecedor_produtos fp ON f.id = fp.fornecedor_id
WHERE
    fp.id IS NULL;

-- 3 Qual o produto que nunca foi vendido
SELECT 
    p.*
FROM
    vendas v
        RIGHT JOIN
    estoques e ON v.estoque_id = e.id
        RIGHT JOIN
    produtos p ON e.produto_id = p.id
WHERE
    v.id IS NULL;

-- 4 qual o produto que não esta em estoque
SELECT 
    p.*
FROM
    produtos p
    LEFT JOIN
    estoques e ON p.id = e.produto_id
WHERE
	e.id IS NULL;

-- 5 qual o fornecedor com a maior quantidade em produto disponível
SELECT 
    f.cnpj,
    f.razao_social,
    SUM(e.quantidade) AS `quantidade_total`
FROM
    fornecedores f
        LEFT JOIN
    estoques e ON f.id = e.fornecedor_id
GROUP BY e.fornecedor_id
ORDER BY 3 DESC
LIMIT 1;

-- 6 construa uma view que retorne o cpf e a venda do cliente
CREATE VIEW `cpf_venda` AS
    (SELECT 
        c.cpf, v.*
    FROM
        clientes c
            INNER JOIN
        vendas v ON c.id = v.cliente_id);

-- Para testar
SELECT 
    *
FROM
    cpf_venda;

-- 7 Quais os produtos que o valor de venda é menor ao valor de venda
-- comparar o valor da coluna "valor" da tabela fornecedor_produtos com a coluna "valor" da tabela vendas
SELECT 
	p.*,
    fp.valor as `valor_de_compra`,
    v.valor as `valor_de_venda`
FROM
    vendas v
        INNER JOIN
    estoques e ON v.estoque_id = e.id
        INNER JOIN
    produtos p ON e.produto_id = p.id
        INNER JOIN
    fornecedor_produtos fp ON p.id = fp.produto_id
WHERE
	fp.valor > v.valor;

-- 8 construa uma view capaz de retornar todos os produtos disponíveis com uma coluna de preço e taxa de ganho/lucro com %
SELECT 
    fp.fornecedor_id,
    fp.valor AS `preco_de_compra`,
    p.id,
    p.nome,
    CONCAT('%',e.lucro) as `lucro`
FROM
    fornecedor_produtos fp
        INNER JOIN
    produtos p ON fp.produto_id = p.id
        INNER JOIN
    estoques e ON p.id = e.produto_id;


-- Incluindo colunas de calculo
-- 8 construa uma view capaz de retornar todos os produtos disponíveis com uma coluna de preço e taxa de ganho/lucro com %
SELECT 
    fp.fornecedor_id,
    fp.valor AS `preco_de_compra`,
    p.id,
    p.nome,
    CONCAT('%', e.lucro) AS `lucro`,
    ROUND((fp.valor + ((fp.valor / 100) * e.lucro)),
            2) AS `valor_sugerido_de_venda`
FROM
    fornecedor_produtos fp
        INNER JOIN
    produtos p ON fp.produto_id = p.id
        INNER JOIN
    estoques e ON p.id = e.produto_id;