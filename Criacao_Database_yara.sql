#Criação do Database yara
create database yara;

#Usar database yara
use yara;

#Criação da Tabela Cliente
CREATE TABLE Cliente(
Id_cliente int NOT NULL AUTO_INCREMENT,
Nome_cliente varchar(50) NOT NULL,
Email_cliente varchar(50),
End_cliente varchar(100),
Tel_cliente varchar(20),
CONSTRAINT PK_Cliente PRIMARY KEY (Id_Cliente)
);

#Insert line - Cliente
insert into Cliente (Nome_cliente, Email_cliente, End_cliente, Tel_cliente) values('dennis', 'dennis.cardoso@outlook.com', 'rua doutor veiga filho, 815', '11968653690');

#Criação da Tabela Fazenda
CREATE TABLE Fazenda(
Id_fazenda int NOT NULL AUTO_INCREMENT,
Id_cliente int NOT NULL,
Nome_fazenda varchar(100) NOT NULL,
Municipio_fazenda varchar(100) NOT NULL,
UF_fazenda varchar(50) NOT NULL,
CONSTRAINT PK_Fazenda PRIMARY KEY(Id_fazenda),
FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente)
);

#Insert line - Fazenda
insert into Fazenda (Id_cliente, Nome_fazenda, Municipio_fazenda, UF_fazenda) values(1, 'fazenda teste 1', 'São Paulo','SP');


#Criação da Tabela Tipo Cultivo
CREATE TABLE Tipo_Cultivo(
Id_tipo_Cultivo int NOT NULL AUTO_INCREMENT,
Desc_tipo_cultivo varchar(100),
CONSTRAINT PK_Tipo_Cultivo PRIMARY KEY(Id_tipo_Cultivo)
);

#Insert line -  Tipo Cultivo Sistema producão e Cultura de Pousio
insert into Tipo_Cultivo (Desc_tipo_cultivo) values ('Sistema Produção');
insert into Tipo_Cultivo (Desc_tipo_cultivo) values ('Cultura De Pousio');

#Criação da Tabela Lavoura
CREATE TABLE Lavoura(
Id_Lavoura int NOT NULL AUTO_INCREMENT,
Id_fazenda int NOT NULL,
Id_tipo_cultivo int NOT NULL,
Nome_talhao varchar(50) NOT NULL,
Lat_talhao decimal(10,2) NOT NULL,
Long_talhao decimal(10,2) NOT NULL,
Espacamento_lavoura decimal(10,2) NOT NULL,
Populacao_lavoura decimal(10,2) NOT NULL,
Cultura_ante_lavoura varchar(100),
MeioCultivo_lavoura varchar(50) NOT NULL,
TamColhido_lavoura decimal(10,2) NOT NULL,
CONSTRAINT PK_Lavoura PRIMARY KEY(Id_Lavoura),
FOREIGN KEY (Id_fazenda) REFERENCES Fazenda(Id_fazenda),
FOREIGN KEY (Id_tipo_cultivo) REFERENCES Tipo_Cultivo(Id_tipo_cultivo)
);


#Insert Line - Lavoura
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Nome_talhao, lat_talhao, long_talhao, espacamento_lavoura, populacao_lavoura, Cultura_ante_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (1, 1, 'Talhao teste 1', 41.40338, 2.17403, 0, 0, 'Soja', 'meio de cultivo exemplo 1', 15.00);
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Nome_talhao, lat_talhao, long_talhao, espacamento_lavoura, populacao_lavoura, Cultura_ante_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (1, 2, 'Talhao teste 2', 41.40338, 2.17403, 22.02, 30.10, 'Soja', 'meio de cultivo exemplo 2', 15.00);

#Criação da Tabela Relatório
CREATE TABLE relatorio(
Id_relatorio int NOT NULL AUTO_INCREMENT,
Desc_relatorio varchar(500),
CONSTRAINT PK_relatorio PRIMARY KEY(Id_relatorio)
);


#insert Line - Relatorio
Insert into Relatorio (Desc_relatorio) values ('Relatório de demonstração de teste da lavoura - exemplo 1');

#Criação da Tabela Tratamento
CREATE TABLE Tratamento(
Id_tratamento int NOT NULL AUTO_INCREMENT,
Id_lavoura int NOT NULL,
Custo_tratamento decimal(10,2) NOT NULL,
Produtividade_tratamento decimal(10,2) NOT NULL,
foto_tratamento blob,
CONSTRAINT PK_tratamento PRIMARY KEY (Id_tratamento),
FOREIGN KEY (Id_lavoura) REFERENCES Lavoura(Id_lavoura)
);

#Insert Line - Tratamento
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (1,399000, 10000002.34);
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (2, 150000.00, 13323455);

#Criação da Tabela Tratamento_relatorio
CREATE TABLE Tratamento_Relatorio(
Id_relatorio int NOT NULL,
Id_tratamento_yara int NOT NULL,
Id_tratamento_atual int NOT NULL,
CONSTRAINT PK_tratamento_relatorio PRIMARY KEY (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual),
FOREIGN KEY (Id_relatorio) REFERENCES Relatorio(Id_relatorio),
FOREIGN KEY (Id_tratamento_yara) REFERENCES Tratamento(Id_tratamento),
FOREIGN KEY (Id_tratamento_atual) REFERENCES Tratamento(Id_Tratamento)
);

#Insert Line - Tratamento_Relatorio
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (1,1,2);

#Criação da Tabela Produto
CREATE TABLE Produto(
Id_produto int NOT NULL AUTO_INCREMENT,
Nome_produto varchar(50) NOT NULL,
Fabricante_produto varchar(50) NOT NULL,
Dose_produto decimal(10,2) NOT NULL,
Custo_produto decimal(10,2) NOT NULL,
CONSTRAINT PK_Produto PRIMARY KEY (Id_produto)
);

#Insert Line - Produto
Insert into Produto (Id_Produto, Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values (1, 'Produto Yara 1','Yara Fertilizantes', 10.20, 150.00);
Insert into Produto (Id_Produto, Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values (2, 'Produto Concorrente 1','Concorrente 1', 29.29, 399.00);

#Criação da Tabela Aplicacao_Produto
CREATE TABLE Aplicacao_Produto(
Id_tratamento int NOT NULL,
Id_produto int NOT NULL,
CONSTRAINT PK_Aplicacao_Produto PRIMARY KEY (Id_tratamento, Id_produto),
FOREIGN KEY (Id_tratamento) REFERENCES Tratamento(Id_tratamento),
FOREIGN KEY (Id_produto) REFERENCES Produto(Id_produto)
);

#Insert Line - Aplicacao_Produto
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (1,1);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (2,2);