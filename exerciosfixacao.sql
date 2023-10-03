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

