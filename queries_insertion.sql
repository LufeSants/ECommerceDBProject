-- Inserção de dados queries
USE ecommerce;

-- As tabelas do E-Commerce 
SHOW TABLES;

-- Inserir dados na tabela cliente (clients)
INSERT INTO clients (Fname, Minit, Lname, gender, CPF, CNPJ, clientType, date_of_birth, Address)
	VALUES
		('Ana', 'M', 'Costa', 'Feminino', '87425585491', NULL, 'Pessoa Física', '1989-02-10', 'Rua José Dias dos Santos 133, Taboão da Serra - São Paulo'),
		('Carlos', 'O', 'Braga', 'Masculino', '43129864103', NULL, 'Pessoa Física', '1965-04-22', 'Rua Nobres 152, Cuiabá - Mato Grosso'),
		('Eduarda', 'F', 'Silva', 'Feminino', '63921825304', NULL, 'Pessoa Física', '1994-06-09', 'Rua Expedito de Freitas 56, Acaraú - Ceará'), 
		('Guilherme', 'P', 'Santos', 'Masculino', '97237915015', NULL, 'Pessoa Física', '1983-08-05', 'Rua Theodor Kleine 71, Blumenau - Santa Catarina'),
		('Ivanna', 'G', 'Cardoso', 'Feminino', '83261527307', NULL, 'Pessoa Física', '1996-10-18', 'Av. Assis de Vasconcelos 65, Belém - Pará'),
		('Kaique', 'M', 'Oliveira', 'Masculino', '32937829301', NULL, 'Pessoa Física', '1977-12-25', 'Rua Rovigo 921, Belo Horizonte - Minas Gerais');

            
SELECT * FROM clients;

-- Inserir dados na tabela produto (product)
INSERT INTO product (Pname, for_kids, category, Evaluation, size, price) 
	VALUES
		('Notebook', FALSE, 'Eletrônicos', 5, NULL, 1786.00), 
        ('LEGO', TRUE, 'Brinquedos', 4, NULL, 2323.00),
		('Moletom', FALSE, 'Vestimenta', 3, 'M', 109.90),
		('Geladeira', FALSE, 'Eletrodomésticos', 6, NULL, 5987.00),
		('Jane Eyre', FALSE, 'Livros', 7, NULL, 64.95),
		('Camisa', FALSE, 'Vestimenta', 5, 'G', 79.99),
		('Boneca', TRUE, 'Brinquedos', 5, NULL, 159.71);
            
SELECT * FROM product;
                        
-- Inserir dados na tabela pedido (orders)
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, freight, paymentCash)
	VALUES
		(1, DEFAULT, 'compra via aplicativo', NULL, 1), 
		(2, DEFAULT, 'compra via aplicativo', 50, 0), 
		(3, 'Confirmado', NULL, NULL, 1),
		(4, DEFAULT, 'compra via web site', 150, 0);
            
SELECT * FROM orders;
            
 -- Inserir dados na tabela jução produto do pedido (productOrder)           
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	VALUES
		(1, 3, 2, 'Disponível'),
		(2, 3, 1, 'Disponível'),
		(3, 4, 1, 'Disponível');
            
SELECT * FROM productOrder;

-- Inserir dados na tabela entrega (deliveries)     
INSERT INTO deliveries (idOrder, deliveryStatus, trackingCode)
	VALUES
	   (1, 'Em Trânsito', 'ABC123'),
	   (2, 'Entregue', 'DEF456'),
       (3, 'Em Trânsito', 'HIJ789'),
       (4, 'Entregue', 'KLM101'),
       (5, 'Pendente', 'NOP112');

SELECT * FROM deliveries;


 -- Inserir dados na tabela jução Pedido_entrega (order_deliveries) 
INSERT INTO order_deliveries (idOrder, idDelivery, deliveryDate, deliveryAddress)
	VALUES
		(1, 1, '2021-01-27', 'Rua Abílio Soares, 123, São Paulo - SP'),
		(2, 2, '2022-02-28', 'Hélio Viana, 456, Serra - ES'),
		(3, 3, '2023-08-29', ' Praça Universitária, 789, Goiânia - GO');
    
    SELECT * FROM order_deliveries;

 -- Inserir dados na tabela estoque do produto (productStorage)  
INSERT INTO productStorage (storageLocation, quantity) 
	VALUES
		('São Paulo',1000),
		('Rio de Janeiro',500), 
		('Minas Gerais',300),
		('Santa Catarina',60),
		('Bahia',40),
		('Brasília',30);

SELECT * FROM productStorage;

-- Inserir dados na tabela localização do produto (storageLocation)  
INSERT INTO storageLocation (idLproduct, idLstorage, location)
	VALUES
		(1, 2, 'RJ'),
		(2, 3,'GO'),
		(3, 5, 'SP');
            
            
SELECT * FROM storageLocation;

 -- Inserir dados na tabela fornecedor (supplier) 
INSERT INTO supplier (SocialName, CNPJ, supplierContact) 
	VALUES  
		('TecnoShop', 12345678912345,'4192881040'), 
        ('MegaGadget',85451964914347,'8299358937'),
        ('FuturoByte', 93456789393469,'11977697581');

SELECT * FROM supplier;

-- Inserir dados na tabela junção produto do fornecedor (productSupplier) 
INSERT INTO productSupplier (idPsSupplier, idPsProduct, PsQuantity)
	VALUES 
		(1, 1, 500),
		(1, 2, 400),
		(2, 4, 633),
		(3, 3, 5),
		(2, 5, 10);
    
    SELECT * FROM productSupplier;

-- Inserir dados na tabela vendedor (seller) 
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, sellerLocation, sellerContact) 
	VALUES 
		('InnovateWave', null, 12345674912343, null, 'Rio de Janeiro - RJ', 219946287),
		('NexusTech', null, null, 12345678910, 'Curitiba - PR', 419567895),
		('Stellar',null, 12345321962049, null ,'São Paulo - SP', 1198657484),
		('Handeltec',null, 32142532972043, null ,'Florianópolis - SC', 4785618491),
		('Techpool',null, 72329551922366, null ,'Recife - PE', 8182643272);
       
SELECT * FROM seller;

-- Inserir dados na tabela junção produto do vendedor (productSeller) 
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) 
	VALUES 
		(1,6,80),
	    (2,7,10);
      
SELECT * FROM productSeller;

-- Retorna o número total de registros na tabela "clients" (clientes)
SELECT COUNT(*) FROM clients;

-- Realiza uma junção entre duas tabelas, "clients" (clientes) e "orders" (pedidos)
SELECT * FROM clients c, orders o WHERE c.idClient = idOrderClient;

-- Cálculo de idade, a partir da data de nascimento dos clientes
SELECT Fname, Lname, YEAR(CURRENT_DATE) - YEAR(date_of_birth) AS Age
FROM clients
ORDER BY Age;

-- Classificação de produtos por avaliação
SELECT Pname, Evaluation,
       CASE
           WHEN Evaluation >= 7 THEN 'Excelente'
           WHEN Evaluation >= 5 THEN 'Bom'
           ELSE 'Ruim'
       END AS ProductRating
FROM product
ORDER BY Evaluation DESC;

-- Quantos pedidos foram feitos por cada cliente?     
SELECT c.Fname, c.Lname, COUNT(o.idOrder) AS TotalPedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient;

-- Algum vendedor também é fornecedor?
SELECT DISTINCT s.SocialName AS NomeVendedor, 
                IFNULL(sp.SocialName, 'Não') AS Fornecedor
FROM seller s
LEFT JOIN productSeller ps ON s.idSeller = ps.idPseller
LEFT JOIN productSupplier psp ON s.idSeller = psp.idPsSupplier
LEFT JOIN supplier sp ON psp.idPsSupplier = sp.idSupplier;

-- Relação de produtos fornecedores e estoques
SELECT p.Pname AS Produto, s.SocialName AS Fornecedor, ps.PsQuantity AS QuantidadeFornecida, psq.quantity AS QuantidadeEstoque
FROM product p
INNER JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier
INNER JOIN productStorage psq ON p.idProduct = psq.idProdStorage
ORDER BY QuantidadeEstoque;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT s.SocialName AS Fornecedor, GROUP_CONCAT(p.Pname SEPARATOR ', ') AS ProdutosFornecidos
FROM supplier s
INNER JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
INNER JOIN product p ON ps.idPsProduct = p.idProduct
GROUP BY s.idSupplier
HAVING COUNT(p.idProduct) >= 2; -- Filtra fornecedores com pelo menos 2 produtos