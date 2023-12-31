CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

SELECT UPPER(nome) FROM nomes;

SELECT nome, LENGTH(nome) AS tamanho FROM nomes;

SELECT
    CASE WHEN nome LIKE 'Rob%' OR nome = 'João' THEN CONCAT('Sr. ', nome)
         ELSE CONCAT('Sra. ', nome)
    END AS nome_com_tratamento
FROM nomes;

CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade) VALUES
    ('Produto A', 12.50, 5),
    ('Produto B', 9.99, 0),
    ('Produto C', 25.00, -3);

SELECT produto, ROUND(preco, 2) AS preco_arredondado FROM produtos;

SELECT produto, ABS(quantidade) AS quantidade_absoluta FROM produtos;

SELECT AVG(preco) AS media_de_preco FROM produtos;

CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
    ('2023-10-01'),
    ('2023-10-10'),
    ('2023-11-05');

INSERT INTO eventos (data_evento) VALUES (NOW());

SELECT DATEDIFF('2023-11-05', '2023-10-01') AS dias_entre_datas FROM eventos LIMIT 1;

SELECT data_evento, DAYNAME(data_evento) AS dia_da_semana FROM eventos;

SELECT produto,
       IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

SELECT produto,
       CASE
           WHEN preco < 10 THEN 'Barato'
           WHEN preco >= 10 AND preco <= 20 THEN 'Médio'
           ELSE 'Caro'
       END AS categoria_preco
FROM produtos;

DELIMITER //
CREATE FUNCTION TOTAL_VALOR(preco DECIMAL(10, 2), quantidade INT)
RETURNS DECIMAL(10, 2)
BEGIN
    RETURN preco * quantidade;
END;
//
DELIMITER ;

SELECT produto, preco, quantidade, TOTAL_VALOR(preco, quantidade) AS valor_total FROM produtos;

SELECT COUNT(*) AS total_de_produtos FROM produtos;

SELECT produto, preco FROM produtos WHERE preco = (SELECT MAX(preco) FROM produtos);

SELECT produto, preco FROM produtos WHERE preco = (SELECT MIN(preco) FROM produtos);

SELECT SUM(IF(quantidade > 0, preco * quantidade, 0)) AS valor_total_em_estoque FROM produtos;

DELIMITER //
CREATE FUNCTION FATORIAL(n INT)
RETURNS INT
BEGIN
    DECLARE resultado INT;
    SET resultado = 1;
    WHILE n > 0 DO
        SET resultado = resultado * n;
        SET n = n - 1;
    END WHILE;
    RETURN resultado;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION f_exponencial(base INT, expoente INT)
RETURNS INT
BEGIN
    DECLARE resultado INT;
    SET resultado = 1;
    WHILE expoente > 0 DO
        SET resultado = resultado * base;
        SET expoente = expoente - 1;
    END WHILE;
    RETURN resultado;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION E_PALINDROMO(palavra VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE reverso VARCHAR(255);
    SET reverso = REVERSE(palavra);
    IF palavra = reverso THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
//
DELIMITER ;
