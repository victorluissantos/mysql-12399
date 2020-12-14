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