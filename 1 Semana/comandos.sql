SELECT 
    id, nome, email, senha
FROM
    usuarios;

/* #Exemplo
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); 
*/

/* #Exemplo
INSERT INTO table_name
VALUES (value1, value2, value3, ...); 
*/

INSERT 
INTO usuarios 
(nome, email, senha) 
VALUE 
('Victor Luis', 'victorluissantos@live.com', '123456');