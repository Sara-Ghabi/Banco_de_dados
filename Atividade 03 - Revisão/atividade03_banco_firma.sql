CREATE DATABASE Firma;
USE Firma;

CREATE TABLE Clientes(
idCliente INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
nomeCliente VARCHAR(150) NOT NULL,
telefone VARCHAR(11),
statusClientes VARCHAR(5) NOT NULL,
endereco VARCHAR(150),
limiteCredito MONEY
);

CREATE TABLE Categoria(
idCategoria INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
nomeCategoria VARCHAR(20) NOT NULL
);

CREATE TABLE Produtos(
idProduto INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
nomeProduto VARCHAR(100) NOT NULL,
precoProduto MONEY NOT NULL,
fk_idCategoria INT FOREIGN KEY REFERENCES Categoria(idCategoria) NOT NULL
);


CREATE TABLE Pedidos(
idPedido INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
dataPedido DATE NOT NULL,
quantProduto INT NOT NULL,
fk_idCliente INT FOREIGN KEY REFERENCES Clientes(idCliente) NOT NULL
);

CREATE TABLE PedidoProduto(
idProdutoPedido INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
fk_idPedido INT FOREIGN KEY REFERENCES Pedidos(idPedido) NOT NULL,
fk_idProduto INT FOREIGN KEY REFERENCES Produtos(idProduto) NOT NULL
);


-- inserts na tabela Clientes
INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Jo�o Silva', '11987654321', 'Bom', 'Rua das Flores, 123', 5000.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Maria Oliveira', '21976543210', 'Bom', 'Av. Brasil, 456', 3000.50);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Carlos Pereira', '31965498732', 'Ruim', 'Rua Minas Gerais, 789', 1500.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Ana Costa', '42987654320', 'M�dio', 'Rua Paran�, 321', 2500.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Paulo Santos', '51987654319', 'Bom', 'Rua S�o Paulo, 654', 10000.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Cl�udia Martins', '62976543123', 'Ruim', 'Av. Goi�s, 987', 1200.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Fernando Rocha', '71987654318', 'Bom', 'Rua Bahia, 147', 8000.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Gabriela Souza', '81976543217', 'M�dio', 'Av. Pernambuco, 258', 4500.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Ricardo Lima', '92987654316', 'Ruim', 'Rua Amazonas, 369', 3000.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Juliana Almeida', '11987654315', 'Bom', 'Rua Rio de Janeiro, 951', 5500.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Leonardo Fonseca', '21976543214', 'Bom', 'Av. Esp�rito Santo, 753', 7000.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Vanessa Lopes', '31987654313', 'M�dio', 'Rua Acre, 852', 2000.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Bruno Ara�jo', '41976543212', 'Bom', 'Rua Santa Catarina, 741', 6500.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Patr�cia Lima', '51987654311', 'Bom', 'Av. Alagoas, 963', 7200.00);

INSERT INTO Clientes (nomeCliente, telefone, statusClientes, endereco, limiteCredito)
VALUES ('Roberto Teixeira', '62976543210', 'Bom', 'Rua Sergipe, 159', 12000.00);

SELECT * FROM Clientes;

-- iserindo dados na tabela Categoria
INSERT INTO Categoria (nomeCategoria)
VALUES ('Eletr�nicos');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Eletrodom�sticos');

INSERT INTO Categoria (nomeCategoria)
VALUES ('M�veis');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Roupas');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Cal�ados');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Alimentos');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Bebidas');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Livros');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Papelaria');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Ferramentas');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Esportes');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Brinquedos');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Automotivo');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Perfumaria');

INSERT INTO Categoria (nomeCategoria)
VALUES ('Inform�tica');

SELECT * FROM Categoria;

-- insert da tabela Produtos
INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Smartphone Samsung Galaxy', 1500.00, 1);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Geladeira Brastemp Frost Free', 3200.00, 2);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Sof� 3 Lugares Retr�til', 1800.00, 3);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Camisa Polo Masculina', 80.00, 4);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('T�nis Nike Air Max', 450.00, 5);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Arroz Tipo 1 5kg', 25.00, 6);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Vinho Tinto Seco Chileno', 60.00, 7);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Livro: O Senhor dos An�is', 90.00, 8);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Caderno Universit�rio 10 Mat�rias', 20.00, 9);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Furadeira El�trica Bosch', 300.00, 10);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Bola de Futebol Adidas', 120.00, 11);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Boneca Barbie Fashionista', 150.00, 12);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Pneu Michelin 195/60R15', 500.00, 13);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Perfume Chanel N�5', 720.00, 14);

INSERT INTO Produtos (nomeProduto, precoProduto, fk_idCategoria)
VALUES ('Notebook Dell Inspiron 15', 3500.00, 15);

SELECT * FROM Produtos;

-- insert da tabela Pedidos

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-15', 3, 7);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-16', 5, 2);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-17', 1, 12);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-18', 4, 5);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-18', 2, 9);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-19', 6, 3);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-19', 8, 10);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-20', 3, 15);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-20', 7, 1);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-21', 5, 14);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-21', 9, 8);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-22', 4, 11);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-22', 2, 6);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-23', 3, 13);

INSERT INTO Pedidos (dataPedido, quantProduto, fk_idCliente)
VALUES ('2025-01-23', 6, 4);


SELECT * FROM Pedidos;

-- insert de PedidoProduto
INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (31, 3);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (32, 11);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (33, 8);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (34, 1);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (35, 12);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (36, 4);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (37, 15);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (38, 7);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (39, 6);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (40, 10);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (41, 9);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (42, 5);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (43, 2);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (44, 13);

INSERT INTO PedidoProduto (fk_idPedido, fk_idProduto)
VALUES (45, 14);

SELECT * FROM PedidoProduto;

-- DATA QUERY LANGUAGE - DQL

-- AND 
-- Todas as op��es tem de ser verdadeiras

-- OR 
-- Apenas uma das op��es precisa de ser verdadeira

SELECT * FROM Clientes WHERE statusClientes = 'Ruim' AND limiteCredito = 1500;

-- ORDER BY 
-- Ordena os valores em ordem 
-- ASC: ordena em forma crescente
SELECT * FROM Clientes ORDER BY nomeCliente ASC;

-- DESC: ordena em forma decrescente
SELECT * FROM Clientes ORDER BY nomeCliente DESC;

-- COUNT
-- conta todos os valores presentes em uma coluna
-- o DISTINCT contabiliza todos os valores que s�o diferentes em uma coluna
SELECT COUNT(nomeCliente) FROM Clientes;
SELECT COUNT(distinct(nomeCliente)) FROM Clientes;

-- OPERADOR > E <
-- funciona tanto com n�meros quanto com datas

-- > retorna valores maiores 
SELECT * FROM Clientes WHERE limiteCredito > 2000;

-- < retorna menores
SELECT * FROM Clientes WHERE limiteCredito < 2000;

-- LIKE
-- retorna extamente igual
SELECT * FROM Clientes WHERE nomeCliente LIKE 'A';

-- % retorno de valor parecido 
SELECT * FROM Clientes WHERE nomeCliente LIKE 'A%';

-- BETWEEN 
-- busca entre valores especificos
SELECT * FROM Clientes WHERE limiteCredito BETWEEN 2000 AND 5000;

-- DATEDIFF
SELECT DATEDIFF(DD,'2025-01-01',GETDATE());
-- Formato de contagem: DD, MM OU YY / 1� data / 2� data

-- SUM
-- realiza soma de valores
SELECT SUM(precoProduto) FROM Produtos;

-- AVG
-- realiza o calculo da m�dia
SELECT AVG(precoProduto) FROM Produtos;