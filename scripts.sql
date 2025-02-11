------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Criar a tabela de Motoristas
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY, 
    Nome VARCHAR(100), 
    CNH VARCHAR(20), 
    Endereço VARCHAR(200), 
    Contato VARCHAR(50)
);
GO

-- Criar a tabela de Clientes
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY, 
    Nome VARCHAR(100), 
    Empresa VARCHAR(100), 
    Endereço VARCHAR(200), 
    Contato VARCHAR(50)
);
GO

-- Criar a tabela de Pedidos
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY, 
    ClientID INT, 
    DriverID INT, 
    DetalhesPedido TEXT, 
    DataEntrega DATE, 
    Status VARCHAR(50), 
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID), 
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Inserir motoristas
INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato) 
VALUES 
    (1, 'Pedro Almeida', '9876543210', 'Av. Paulista, 1500, SP', '11987456321'),
    (2, 'Juliana Costa', '0123456789', 'Rua do Ouvidor, 50, RJ', '21965412387');
GO

-- Inserir clientes 
INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato) 
VALUES 
    (1, 'Maria Santos', 'Comércio Mineiro', 'Av. Afonso Pena, 2000, MG', '31912345678'),
    (2, 'Lucas Pereira', 'Indústria Gaúcha', 'Rua da Praia, 350, RS', '51987654321');
GO

-- Inserir pedidos
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) 
VALUES 
    (1, 1, 1, 'Entrega de 10 caixas', '2025-02-10', 'Pendente'),
    (2, 2, 2, 'Transporte de carga refrigerada', '2025-02-12', 'Em andamento');
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Listar motoristas
SELECT * FROM Drivers;
GO

-- Listar clientes
SELECT * FROM Clients;
GO

-- Listar pedidos
SELECT * FROM Orders;
GO

-- Consultar pedidos de um cliente específico
SELECT 
    Orders.OrderID, 
    Clients.Nome AS Cliente, 
    Drivers.Nome AS Motorista, 
    Orders.Status 
FROM Orders 
JOIN Clients ON Orders.ClientID = Clients.ClientID 
JOIN Drivers ON Orders.DriverID = Drivers.DriverID;
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Atualizar status do pedido 1 para "Entregue"
UPDATE Orders SET Status = 'Entregue' WHERE OrderID = 1;
GO

-- Excluir um cliente (caso não tenha pedidos relacionados)
DELETE FROM Clients WHERE ClientID = 2;
GO

-- Verificar se a tabela de pedidos está vazia
SELECT COUNT(*) FROM Orders;
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Inserir novo cliente
INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato) 
VALUES (99, 'João Silva', 'Translog', 'Rua das Flores, 123', '(11) 99999-9999');
GO
