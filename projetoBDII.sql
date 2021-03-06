CREATE DATABASE PROJETOLOJA
	ON(NAME = PROJETOLOJA,
		FILENAME = 'C:\BANCO_DADOS\PROJETOLOJA.MDF',
		SIZE = 5,
		MAXSIZE = 10,
		FILEGROWTH = 1
	
	)	
USE PROJETOLOJA

CREATE TABLE CLIENTE (
	IDCLIENTE CHAR(5) NOT NULL
		CONSTRAINT PK_CLIENTE PRIMARY KEY,
	NOME VARCHAR(40) NOT NULL, --check do nome
	CPF VARCHAR(12) NOT NULL
		CONSTRAINT UN_CLIENTE_CPF UNIQUE, -- check 12 digitos
	ENDERECO VARCHAR(50) NOT NULL,
	FONE VARCHAR(16) NOT NULL
	
)

CREATE TABLE FUNCIONARIO(
	IDFUNCIONARIO CHAR(5) NOT NULL 
		CONSTRAINT PK_FUNCIONARIO PRIMARY KEY,
	NOME VARCHAR(40)NOT NULL, --check nome
	CARGO VARCHAR(30)NOT NULL,
	SEXO CHAR(1) NOT NULL
		CONSTRAINT CH_FUNCIONARIO_SEXO CHECK (SEXO = 'F' OR SEXO = 'M'),
	RG VARCHAR(9)NOT NULL
		CONSTRAINT UN_FUNCIONARIO_RG UNIQUE,
	CPF VARCHAR(12)NOT NULL	--check 12 digitos		

			
)
Alter Table Funcionario
ADD SALARIO SMALLMONEY 

CREATE TABLE FILIAL(
	IDFILIAL CHAR(5) NOT NULL
		CONSTRAINT PK_FILIAL PRIMARY KEY,
	NOME VARCHAR(40) NOT NULL, 
	ENDERECO VARCHAR(50)NOT NULL,
	CNPJ VARCHAR(14) NOT NULL
		CONSTRAINT UN_FILIAL_CNPJ UNIQUE

)

CREATE TABLE PEDIDO(
	IDPEDIDO CHAR(5) NOT NULL
		CONSTRAINT PK_PEDIDO PRIMARY KEY,
	ENDERECO VARCHAR(50) NOT NULL,
	IDCLIENTE CHAR(5) NOT NULL 
		CONSTRAINT FK_PEDIDO_CLIENTE FOREIGN KEY
		REFERENCES CLIENTE(IDCLIENTE),
	FRETE SMALLMONEY NOT NULL
		
)		
ALTER TABLE PEDIDO ADD IDFUNCIONARIO CHAR(5)
			CONSTRAINT FK_PEDIDO_FUNCIONARIO FOREIGN KEY
			REFERENCES FUNCIONARIO(IDFUNCIONARIO)
ALTER TABLE PEDIDO
ADD DATAPEDIDO SMALLDATETIME
/*CREATE TABLE FRETE (
	IDFRETE CHAR(5) NOT NULL
		CONSTRAINT PK_FRETE PRIMARY KEY,
	IDPEDIDO CHAR(5) NOT NULL
		CONSTRAINT FK_FRETE_PEDIDO FOREIGN KEY
		REFERENCES PEDIDO(IDPEDIDO),
	ENDERECO VARCHAR(50) NOT NULL
)		

ALTER TABLE PEDIDO ADD IDFRETE CHAR(5) NOT NULL
			CONSTRAINT FK_PEDIDO_FRETE FOREIGN KEY
			REFERENCES FRETE(IDFRETE)
*/

CREATE TABLE TIPO(
	IDTIPO CHAR(5) NOT NULL
		CONSTRAINT PK_TIPO PRIMARY KEY,
	NOME VARCHAR(20) NOT NULL
		CONSTRAINT UN_PAIS_NOME UNIQUE,
	DESCRICAO TEXT NULL
	
)


CREATE TABLE PRODUTO (
	IDPRODUTO CHAR(5) NOT NULL
		CONSTRAINT PK_PRODUTO PRIMARY KEY,
	NOME VARCHAR(30) NOT NULL,
	PESO SMALLINT NOT NULL,
	DESCRICAO VARCHAR(50) NOT NULL,
	CUSTO SMALLMONEY NOT NULL,
	VENDA SMALLMONEY NOT NULL,
	TIPO CHAR(5) NOT NULL 
		CONSTRAINT FK_PRODUTO_TIPO FOREIGN KEY
		REFERENCES TIPO(IDTIPO)

)
ALTER TABLE PRODUTO ADD IDFORNECEDOR CHAR(5)
			CONSTRAINT FK_PRODUTO_FORNECEDOR FOREIGN KEY
			REFERENCES FORNECEDOR(IDFORNECEDOR)

ALTER TABLE PEDIDO ADD IDPRODUTO CHAR(5)NOT NULL
			CONSTRAINT FK_PEDIDO_PRODUTO FOREIGN KEY
			REFERENCES PRODUTO(IDPRODUTO)

CREATE TABLE PAC(
	IDPAC CHAR(5) NOT NULL
		CONSTRAINT PK_PAC PRIMARY KEY
)

CREATE TABLE SEDEX(
	IDSEDEX CHAR(5) NOT NULL
		CONSTRAINT PK_SEDEX PRIMARY KEY
)

CREATE TABLE PESSOAFISICA(
	IDPESSOAFISICA CHAR(5) NOT NULL
		CONSTRAINT PK_PESSOAFISICA PRIMARY KEY
)

CREATE TABLE PESSOAJURIDICA(
	IDPESSOAJURIDICA CHAR(5) NOT NULL
		CONSTRAINT PK_PESSOAJURIDICA PRIMARY KEY
)


CREATE TABLE FORMADEPAGAMENTO(
	IDPAGAMENTO CHAR(5) NOT NULL

)

CREATE TABLE CARTAODECREDITO(
	IDCARTAO CHAR(5) NOT NULL

)

CREATE TABLE BOLETO(
	IDBOLETO CHAR(5) NOT NULL
)

CREATE TABLE FORNECEDOR(
	IDFORNECEDOR CHAR(5)NOT NULL
		CONSTRAINT PK_FORNECEDOR PRIMARY KEY,
	NOME VARCHAR(30)NOT NULL,
	PRODUTO VARCHAR(30)NOT NULL
)
