use ecommerce;

-- Insercao dos dados
INSERT INTO CLIENTS (firstName, minit, lastName, cpf, address)
	VALUES('Maria', 'M', 'Silva', 11122233344,'Rua Tres 4, Jardim 3 - Cidade 5'),
		  ('Jose', 'J', 'Santos', 55566677788,'Rua Quatro 5, Jardim 4 - Cidade 6'),
          ('Luis', 'L', 'Silva', 99900011122,'Rua Cinco 6, Jardim 5 - Cidade 7'),
          ('Kim', 'K', 'Santos', 33344455566,'Rua Seis 7, Jardim 6 - Cidade 8'),
          ('Nair', 'N', 'Silva', 77788899900,'Rua Sete 8, Jardim 7 - Cidade 9');

INSERT INTO PRODUCTS (productName, classification_kids, category, evaluation, size)
	VALUES('Fone de ouvido', false, 'Eletrônico', 4, null),
		  ('Carrinho Hotwheels', true, 'Brinquedos', 5, null),
          ('Camiseta Treino Adidas', false, 'Vestimenta', 4, null),
          ('Caixa Kit-Kat', false, 'Alimentos', 4, null),
          ('Escrivaninha', false, 'Móveis', 4, null);

INSERT INTO ORDERS (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	VALUES(1, 'Em processamento', 'Compra via app', 50, 1),
		  (7, 'Confirmado', 'Compra via app', 15, 1),
          (8, 'Confirmado', 'Compra via app', 25, 1),
          (9, 'Em processamento', 'Compra via app', 40, 0),
          (10, 'Em processamento', 'Compra via web', 50, 0);

-- productOrders - faltando

INSERT INTO PRODUCT_STORAGE(storageLocation, quantity)
	VALUES('Rio de Janeiro', 1000),
          ('Rio de Janeiro', 500),
          ('São Paulo', 1000),
          ('São Paulo', 100),
          ('Brasília', 100);

INSERT INTO SUPPLIER(socialName, cnpj, contact)
	VALUES('Teste & Filmes', '11222333000144', 'Maria'),
		  ('Const RRT', '55666777000188', 'Toledo'),
          ('Mercadinho Dois', '99111222000133', 'Rocha');

INSERT INTO SELLERS(socialName, abstName, cnpj, cpf, location, contact)
	VALUES('Tech Electronics', null, '12334556000177', null, 'Rio de Janeiro', 'Bastos'),
          ('Tendas Bar', null, '13234658000197', null, 'Rio de Janeiro', 'Jose'),
          ('Mateus', null, null, 1122233344, 'São Paulo', 'Mateus'),
          ('Silvia', null, null, 5566677788, 'Brasília', 'Silvia');

INSERT INTO PAYMENTS(idClient, idPayment, typePayment, limitAvailable)
	VALUES(1, 0, 'Boleto', null),
		  (7, 0, 'Boleto', null),
          (8, 1, 'Cartão', 10000.00),
          (9, 1, 'Cartão', 5000.00),
          (10, 2, 'Dois cartões', 20000.00);

INSERT INTO PRODUCT_SELLER(`idProductSeller`, `idProduct`, `prodQuantity`)
	VALUES(5, 1, 50),
		  (6, 2, 1000),
          (6, 3, 1000),
          (7, 4, 10000),
          (8, 5, 10);


-- Recuperacao simples das informacoes 
SELECT * FROM CLIENTS;

SELECT * FROM PRODUCTS;

SELECT * FROM ORDERS;

SELECT * FROM PRODUCT_STORAGE;

SELECT * FROM SUPPLIER;

SELECT * FROM SELLERS;

SELECT * FROM PAYMENTS;

SELECT * FROM PRODUCT_SELLER;

-- Recuperacoes com filtros
-- Clientes x Pedidos
select * from clients cli 
inner join orders ord on cli.idClient = ord.idOrderClient; 

select * from Sellers order by socialName;

select ps.idProductSeller, prod.productName, prod.category from Product_Seller ps 
inner join Products prod on ps.idProduct = prod.idProduct
group by ps.idProductSeller, prod.productName, prod.category
having SUM(ps.prodQuantity) > 100




