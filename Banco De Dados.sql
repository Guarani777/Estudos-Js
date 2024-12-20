-- Criação do esquema
CREATE SCHEMA loja;

USE loja;

-- Criação das tabelas
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(50)
);

CREATE TABLE vendas (
    id_vendas INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Inserção dos dados
INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Chocolate', 'Alimento', 4.99, 25),
('Sabonete', 'Higiene', 1.89, 40),
('Biscoito', 'Alimento', 2.55, 20),
('Desodorante', 'Higiene', 15.99, 10),
('Celular', 'Eletrônicos', 1099.00, 5);

INSERT INTO cliente (nome, email, telefone) VALUES
('Antônio da Silva', 'antoniodasilva@mail.com', '99991111'),
('Mariana Almeida', 'marianaalmeida@mail.com', '99992222'),
('Diego Pereira', 'diegopereira@mail.com', '99993333'),
('Juliana Andrade', 'julianaandrade@mail.com', '99994444'),
('Cristiane Ferreira', 'cristianeferreira@mail.com', '99995555');


-- Registro de 10 vendas

INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda)
    VALUES 
    (1, 1, 1, '2024-09-12'),
    (2, 3, 2, '2024-09-12'),
    (1, 3, 6, '2024-09-12'),
    (5, 4, 1, '2024-09-13'),
    (3, 4, 2, '2024-09-13'),
    (2, 4, 2, '2024-09-13'),
    (2, 5, 4, '2024-09-15'),
    (5, 2, 1, '2024-09-17'),
    (1, 1, 1, '2024-09-17'),
    (2, 1, 3, '2024-09-17'),
    (4, 1, 1, '2024-09-17'),
    (3, 3, 5, '2024-09-18');


-- Atualização de dados: preço

UPDATE produtos
SET preco = 2.99
WHERE id_produto = 1;

-- Atualização de dados: telefone

UPDATE cliente
SET telefone = '99998888'
WHERE id_cliente = 3;

-- Remoção de dados: produto

DELETE FROM produtos
WHERE id_produto = 1;


-- Remoção de dados: cliente

DELETE FROM cliente
WHERE id_cliente = 4; 

-- Consulta categoria do produto

SELECT * FROM produtos
WHERE id_produto = 5; 

-- Consulta vendas realizadas em data especifica

SELECT * FROM vendas WHERE data_venda = '2024-09-13';

-- Consulta total de quantidade de vendas por produto

SELECT id_produto, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY id_produto;

-- Calculo da receita total por cliente

SELECT c.id_cliente, c.nome, SUM(v.quantidade * p.preco) AS receita_total
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
JOIN cliente c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- Ordenados por nome ascendente

SELECT * FROM produtos
ORDER BY nome ASC;

-- Ordenados por nome descendente

SELECT * FROM produtos
ORDER BY nome DESC;

-- Estoque atual de cada produto após as vendas

SELECT p.id_produto, p.nome, p.estoque - COALESCE(SUM(v.quantidade), 0) AS estoque_atual
FROM produtos p
LEFT JOIN vendas v ON p.id_produto = v.id_produto
GROUP BY p.id_produto, p.nome, p.estoque;

-- Identificar os produtos mais vendidos

SELECT p.id_produto, p.nome, SUM(v.quantidade) AS total_vendido
FROM produtos p
JOIN vendas v ON p.id_produto = v.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC;

-- Listar clientes que mais compraram

SELECT c.id_cliente, c.nome, SUM(v.quantidade) AS total_comprado
FROM cliente c
JOIN vendas v ON c.id_cliente = v.id_cLiente
GROUP BY c.id_cliente, c.nome
ORDER BY total_comprado DESC;
------------------------------------------------------------------------------------------------------------

08/010/2024

CREATE TABLE vendas(
id INT AUTO_INCREMENT PRIMARY KEY,
produto VARCHAR(100),
categoria VARCHAR(100),
quantidade INT,
preco_unidade DEC(10, 2),
data_venda DATE
);

INSERT INTO vendas (produto, categoria, quantidade, preco_unidade, data_venda)
VALUES
('Arroz','Alimentos',5,10.00,'2024-09-01'),
('Feijão','Alimentos',3,7.50,'2024-09-02'),
('Sabão','Limpeza',2,12.00,'2024-09-02'),
('Café','Alimentos',6,8.00,'2024-09-03'),
('Detergente','Limpeza',4,5.00,'2024-09-03'),
('Leite','Alimentos',10,4.50,'2024-09-04'),
('Sabonete','Higiene',6,3.00,'2024-09-04'),
('Pão','Alimentos',15,1.50,'2024-09-05'),
('Shampoo','Higiene',1,15.00,'2024-09-05'),
('Creme dental','Higiene',3,8.00,'2024-09-06');

-- Vendas alimentos

SELECT COUNT(*) AS total_vendas_alimentos
FROM vendas
WHERE categoria = 'Alimentos';

-- Vendas total

SELECT COUNT(*) AS vendas_total
FROM vendas;

-- Preço médio por unidade

SELECT AVG(preco_unidade) AS preco_medio
FROM vendas;

-- Quantidade média vendida

SELECT AVG(quantidade) AS produtos_media
FROM vendas;

-- Menor preço 

SELECT MIN(preco_unidade) AS menor_preco_unidade
FROM vendas;

-- Maior preço 

SELECT MAX(preco_unidade) AS maior_preco_unidade
FROM vendas;

-- Menor quantidade vendida

SELECT MIN(quantidade) AS menor_quantidade_vendida
FROM vendas;

-- Maior quantidade vendida

SELECT MAX(quantidade) AS maior_quantidade_vendida
FROM vendas;

-- Maior valor venda

SELECT MAX(quantidade * preco_unidade) AS maior_valor_venda
FROM vendas;

-- Média de valor venda

SELECT AVG(quantidade * preco_unidade) AS media_valor_higiene
FROM vendas
WHERE categoria = 'Higiene';


----------------------------------------------------------------------------------------------------------------------------

                                   12/11/2024


CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Livro(
    id  int auto_increment primary key,
    titulo varchar(100),
    ano_pubi year,
    categoria varchar(100),
    isbn int,
    id_editora int,
    foreign key (id_editora) references editora (id)
);
-- INSERT
INSERT Livro (id, titulo, ano_pubi, categoria, isbn, id_editora) VALUES 
(1, 'Java Avançado', 2024, 'Programação', 1548954, 2),
(2, 'Java Avançado', 2024, 'Programação', 1548954, 1),
(3, 'Java Avançado', 2024, 'Programação', 1548954, 4),
(4, 'Java Avançado', 2024, 'Programação', 1548954, 3);


CREATE TABLE Autor(
    id int auto_increment primary key,
    nome_autor varchar(100)
);
-- INSERT
INSERT Autor (id, nome_autor) VALUES 
(1, 'João Sá'), (2, 'Caio Machado'),
(3, 'Carlos Silva'), (4, 'Maria Fernanda');

CREATE TABLE LivroAutor(
    id_livro  int,
    id_autor int,
    foreign key(id_livro) references livro (id),
    foreign key(id_autor) references autor (id)
);

INSERT LivroAutor (id_livro, id_autor) VALUES 
(1,2),
(2,1),
(3,2);

CREATE TABLE Editora(
    id int auto_increment primary key, 
    nome varchar(100),
    cidade varchar(100)
);

INSERT Editora (id, nome, cidade) VALUES 
(1, 'Novatec', 'Recife'),
(2, 'Tecnova', 'São Paulo'),
(3, 'Albatec', 'Rio de Janeiro'),
(4, 'Intrinseca', 'Petrolina');

CREATE TABLE Aluno(
    id int auto_increment primary key,
    nome varchar(100)
);

INSERT Aluno (id, nome) VALUES
(1, 'Carlos Eduardo'),
(2, 'Fernanda Souza'),
(3, 'Lucas Lima'),
(4, 'Julia Rocha');

CREATE TABLE Emprestimo(
    id int auto_increment primary key,
    data_emprestismo date,
    data_evolucao date,
    id_livro int,
    id_aluno int,
    foreign key (id_livro) references livro (id),
    foreign key (id_aluno) references aluno (id)
);

INSERT Emprestimo (id, data_emprestismo, data_evolucao, id_livro, id_aluno) VALUES
(1, '2024-08-08', '2024-08-10', 1, 2),
(2, '2024-08-08', '2024-08-10', 3, 1),
(3, '2024-08-08', '2024-08-10', 2, 3);
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                             26/11/2024

CREATE DATABASE exercicio;
USE exercicio;

CREATE TABLE Categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATETIME,
    status ENUM('Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado'),
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Itens_Pedido (
    pedido_id INT, produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

-- Procedimento para gerar dados

DELIMITER //

CREATE PROCEDURE GerarDados()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;

    -- Inserir Categorias
    WHILE i <= 20 DO
        INSERT INTO Categorias (nome) VALUES (CONCAT('Categoria ', i));
        SET i = i + 1;
    END WHILE;
SET i = 1;
    -- Inserir Produtos
    WHILE i <= 1000 DO
        INSERT INTO Produtos (nome, descricao, preco, estoque, categoria_id)
        VALUES (
            CONCAT('Produto ', i),
            CONCAT('Descrição do produto ', i),
            ROUND(RAND() * 500 + 1, 2),
            FLOOR(RAND() * 100 + 1),
            FLOOR(RAND() * 20 + 1)
        );
        SET i = i + 1;
    END WHILE;
     SET i = 1;
    -- Inserir Clientes
    WHILE i <= 500 DO
        INSERT INTO Clientes (nome, email, senha, endereco)
        VALUES (
            CONCAT('Cliente ', i),
            CONCAT('cliente', i, '@exemplo.com'),
            'senha123',
            CONCAT('Endereço do Cliente ', i)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- Inserir Pedidos e Itens_Pedido
    WHILE i <= 800 DO
        SET @cliente_id = FLOOR(RAND() * 500 + 1);
        SET @data_pedido = NOW() - INTERVAL FLOOR(RAND() * 365) DAY;
        SET @status = ELT(FLOOR(RAND() * 5 + 1), 'Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado');
        INSERT INTO Pedidos (cliente_id, data_pedido, status, total)
        VALUES (@cliente_id, @data_pedido, @status, 0);
        SET @pedido_id = LAST_INSERT_ID();

        -- Inserir Itens do Pedido
        SET j = 1;
        SET @num_itens = FLOOR(RAND() * 5 + 1);

        -- Criar tabela temporária para rastrear produtos adicionados
        CREATE TEMPORARY TABLE temp_produtos (
            produto_id INT PRIMARY KEY
        );

        WHILE j <= @num_itens DO
            SET @produto_id = FLOOR(RAND() * 1000 + 1);

            -- Verificar se o produto já foi adicionado ao pedido
            WHILE EXISTS (SELECT 1 FROM temp_produtos WHERE produto_id = @produto_id) DO
                SET @produto_id = FLOOR(RAND() * 1000 + 1);
            END WHILE;
			
		-- Registrar o produto na tabela temporária
            INSERT INTO temp_produtos (produto_id) VALUES (@produto_id);

            SET @quantidade = FLOOR(RAND() * 5 + 1);
            SELECT preco INTO @preco_unitario FROM Produtos WHERE id = @produto_id;
            INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade, preco_unitario)
            VALUES (@pedido_id, @produto_id, @quantidade, @preco_unitario);
            SET j = j + 1;
        END WHILE;

        -- Atualizar total do pedido
        SELECT SUM(quantidade * preco_unitario) INTO @total FROM Itens_Pedido WHERE pedido_id = @pedido_id;
        UPDATE Pedidos SET total = @total WHERE id = @pedido_id;

        -- Remover tabela temporária
        DROP TEMPORARY TABLE temp_produtos;

        SET i = i + 1;
    END WHILE;
END //
call GerarDados();
select * from Produtos where preco between 100 and 200;
DELIMITER ;  

CREATE INDEX idx_preco ON Protutos  (preco);

SELECT * FROM Cliente WHERE email = 'cliente@exemplo.com'






