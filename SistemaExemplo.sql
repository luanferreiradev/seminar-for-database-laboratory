CREATE DATABASE SistemaExemplo;
use SistemaExemplo;

CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE Produtos (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(100),
    categoria VARCHAR(50),
    precoProduto DECIMAL(10, 2)
);

CREATE TABLE Compras (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idProduto INT,
    valorCompra DECIMAL(10, 2),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

CREATE TABLE Pedidos (
    numeroPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    dataPedido DATE,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Empregados (
    idEmpregado INT AUTO_INCREMENT PRIMARY KEY,
    nomeEmpregado VARCHAR(100),
    idGerente INT,
    FOREIGN KEY (idGerente) REFERENCES Empregados(idEmpregado)
);

INSERT INTO Clientes (nomeCliente, cidade) VALUES
('Ana', 'São Paulo'),
('Bruno', 'Rio de Janeiro'),
('Carlos', 'São Paulo'),
('Daniel', 'Belo Horizonte');

INSERT INTO Produtos (nomeProduto, categoria, precoProduto) VALUES
('Celular', 'Eletrônicos', 1500.00),
('Notebook', 'Eletrônicos', 3500.00),
('Mesa', 'Móveis', 800.00),
('Cadeira', 'Móveis', 300.00);

INSERT INTO Compras (idCliente, idProduto, valorCompra) VALUES
(1, 1, 1500.00),
(1, 3, 800.00),
(2, 1, 1500.00),
(3, 2, 3500.00),
(4, 4, 300.00);

INSERT INTO Pedidos (idCliente, dataPedido) VALUES
(1, '2024-01-10'),
(2, '2024-01-12'),
(3, '2024-02-15');

INSERT INTO Empregados (nomeEmpregado, idGerente) VALUES
('Alice', NULL),        -- Alice é a gerente principal
('Bob', 1),             -- Bob é subordinado de Alice
('Carol', 1),           -- Carol é subordinada de Alice
('David', 2),           -- David é subordinado de Bob
('Eve', 2);             -- Eve é subordinada de Bob
