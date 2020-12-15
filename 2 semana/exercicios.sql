-- 1 montar uma mensagem de boas vindas customizada ao genero informado pelo usuário
SELECT 
    CONCAT('Ola ',
            IF(u.sexo = 'Masculino',
                'Sro. ',
                IF(u.sexo = 'Feminino', 'Sra.', '')),
            u.nome) AS `apresentacao`,
    u.sexo
FROM
    usuarios u;

-- 2 função capaz de avaliar/retorna a diferença entre o valor_minimo e o valor do lance dado
CREATE FUNCTION `subtracao` (pvalor_minimo DECIMAL(22,2), valor_lance DECIMAL(22,2))
RETURNS DECIMAL(22,2)
BEGIN
	DECLARE diferenca DECIMAL(22,2) DEFAULT 0.00;
    
    SET diferenca = pvalor_minimo-valor_lance;
    
RETURN diferenca;
END

	-- Rodando a função
	SELECT 
	    a.titulo, 
	    a.tipo, 
	    a.descricao,
	    a.valor_minimo,
	    l.id,
	    l.valor,
	    subtracao(a.valor_minimo, l.valor) as `diferenca`
	FROM
	    anuncios a
	    JOIN
	    lances l ON a.id = l.anuncio_id;

-- 3 função simples que retorna a idade do usuário (só analizar o ano e o mês)

-- 4 qual o usuário mais velho do sistema

-- 5 função que retorna qual a soma dos anuncios de um determinado usuário
CREATE FUNCTION `soma_anuncio` (pusuario_id  INT)
RETURNS DECIMAL(22,2)
BEGIN

	DECLARE soma DECIMAL(22,2) DEFAULT 0.00;
    
    SET soma = (SELECT 
					SUM(a.valor_minimo)
				FROM
					anuncios a
				WHERE
					a.usuario_id = pusuario_id
				LIMIT 1);

	RETURN soma;
END
