-- Criação do banco de dados para E-Commerce
CREATE DATABASE ecommerce;

USE ecommerce;

-- Criar tabela cliente com informações adicionais para PJ/PF
CREATE TABLE clients(
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15),
    Minit CHAR(1),
    Lname VARCHAR(20),
    gender ENUM('Masculino', 'Feminino', 'Outro'),
    CPF CHAR(11),
    CNPJ CHAR(14),
    clientType ENUM('Pessoa Física', 'Pessoa Jurídica') NOT NULL,
    date_of_birth DATE,
    Address VARCHAR(80) NOT NULL,
    CONSTRAINT unique_cpf_client UNIQUE (CPF),
    CONSTRAINT unique_cnpj_client UNIQUE (CNPJ)
);

-- Criar tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
	Pname VARCHAR(15) NOT NULL,
	for_kids BOOL DEFAULT FALSE,
	category ENUM('Eletrônicos','Vestimenta','Brinquedos','Eletrodomésticos','Livros'),
	Evaluation FLOAT DEFAULT 0,
	size VARCHAR(10),
    price DECIMAL(10, 2) NOT NULL
);

-- Criar tabela pagamento
CREATE TABLE payments(
    idPayment INT NOT NULL,
    idClient INT NOT NULL,
    paymentType ENUM('Boleto', 'Dinheiro', 'Cartão', 'PIX') NOT NULL,
    limitAvailable FLOAT NOT NULL,
    PRIMARY KEY (idPayment, idClient),
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

-- Criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
	idOrderClient INT,
	orderStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em Processamento',
	orderDescription VARCHAR(255),
	freight FLOAT DEFAULT 10,
	paymentCash BOOLEAN DEFAULT FALSE,
	CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

-- Criar tabela entrega com status e código de rastreio
CREATE TABLE deliveries(
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    idOrder INT NOT NULL,
    deliveryStatus ENUM('Em Trânsito', 'Entregue', 'Pendente') NOT NULL,
    trackingCode VARCHAR(20) NOT NULL
);

-- Criar tabela estoque
CREATE TABLE productStorage(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
	storageLocation VARCHAR(255) NOT NULL,
	quantity INT DEFAULT 0 NOT NULL
);

-- Criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
	SocialName VARCHAR(255) NOT NULL,
	CNPJ CHAR(14) NOT NULL,
	supplierContact VARCHAR(11) NOT NULL,
	CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Criar tabela vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
	SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
	CNPJ CHAR(14),
    CPF CHAR(11),
	sellerLocation VARCHAR(255) NOT NULL,
    sellerContact varchar(11) NOT NULL,
	CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- Inserir dados na tabela junção produto do vendedor
CREATE TABLE productSeller(
	idPseller INT,
	idPproduct INT,
	prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idPproduct),
	CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);

-- Criar tabela de junção produto do pedido
CREATE TABLE productOrder(
	idPOproduct INT,
	idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
	CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Criar tabela de junção entrega do pedido
CREATE TABLE order_deliveries(
    idOrder INT NOT NULL,
    idDelivery INT NOT NULL,
    deliveryDate DATE NOT NULL,
    deliveryAddress VARCHAR(255) NOT NULL,
    PRIMARY KEY (idOrder, idDelivery),
    CONSTRAINT fk_orders_order_deliveries FOREIGN KEY (idOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_deliveries_order_deliveries FOREIGN KEY (idDelivery) REFERENCES deliveries(idDelivery)
);

-- Criar tabela de junção estoque do produto
CREATE TABLE storageLocation(
	idLproduct INT,
	idLstorage INT,
	location VARCHAR(255) NOT NULL,
	PRIMARY KEY (idLproduct, idLstorage),
	CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct), 
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

-- Criar tabela de junção produto do fornecedor 
CREATE TABLE productSupplier(
	idPsSupplier INT,
	idPsProduct INT,
	PsQuantity INT NOT NULL,
	PRIMARY KEY (idPsSupplier, idPsProduct),
	CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier), 
	CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);
