-- criacao de banco de dados para o cenario de E-commerce
create schema ecommerce;
use ecommerce;

-- criacao das tabelas
CREATE table CLIENTS(
	idClient int auto_increment primary key,
    firstName varchar(10),
    minit varchar(10),
    lastName varchar(20),
    cpf varchar(11) not null,
    address varchar(30),
    constraint unique_cpf_client unique (cpf)
);

-- ALTERACAO DO AUTO_INCREMENT
alter table clients auto_increment=1;

CREATE table PRODUCTS(
	idProduct int auto_increment primary key,
    productName varchar(30),
	classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    evaluation float default 0,
    size varchar(10)
);

CREATE table PAYMENTS(
	idClient int,
    idPayment int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões') not null,
    limitAvailable float,
    primary key(idClient, idPayment)
);

CREATE table ORDERS(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_order_client foreign key(idOrderClient) references clients(idClient)
);

CREATE table PRODUCT_STORAGE(
	idProductStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

CREATE table SUPPLIER(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
	cnpj char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique(cnpj)
);

CREATE table SELLERS(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
	cnpj char(15),
    cpf char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique(cnpj),
    constraint unique_cpf_seller unique(cpf)
);

CREATE table PRODUCT_SELLER(
	idProductSeller int,
    idProduct int,
    prodQuantity int default 1,
    primary key(idProductSeller, idProduct),
	constraint fk_product_seller foreign key(idProductSeller) references sellers(idSeller),
    constraint fk_product_product foreign key(idProduct) references products(idProduct)
);

show tables;

