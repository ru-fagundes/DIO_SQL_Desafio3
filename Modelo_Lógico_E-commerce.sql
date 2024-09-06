-- criação do banco de dados para o cenário de E-commerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
	Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_client unique (CPF)
    
);

-- criar tabela produto

create table product(
	idProduct int auto_increment primary key,
	Pname varchar(10) not null,
    classication_kids bool default false,
    category enum('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis') not null,
    avaliação float default 0,
    size varchar(10),
    constraint unique_cpf_client unique (CPF)
    
);

-- para ser continuado no desafio: terminar de implementar a tabela e criar a conexão com as tabelas necessárias
-- refletir essa modificação no diagrama relacional
-- criar constraints relacionadas ao pagamento
create table payments(
	idClient int,
    idPayment int,
    typePayment enum('Boleto','Dinheiro','Cartão','Dois cartões'),
    limitAvailable float,
    primary key (idClient, id_payment)
);
-- criar tabela pedido

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymantCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

-- criar tabela estoque
create table productsStorage(
	idProdStorage int auto_increment primary key,
    category enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    category enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
	constraint unique_cpf_seller unique (CPF)
);