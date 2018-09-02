#Criação do Database yara
#create database yara;

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
insert into Cliente (Nome_cliente, Email_cliente, End_cliente, Tel_cliente) values('Cliente1', 'cliente1@teste.com', 'rua teste 1', '11968650099');
insert into Cliente (Nome_cliente, Email_cliente, End_cliente, Tel_cliente) values('Cliente2', 'cliente2@teste.com', 'rua teste 2', '11968859955');
insert into Cliente (Nome_cliente, Email_cliente, End_cliente, Tel_cliente) values('Cliente3', 'cliente3@teste.com', 'rua teste 3', '11959038830');
insert into Cliente (Nome_cliente, Email_cliente, End_cliente, Tel_cliente) values('Cliente4', 'cliente4@teste.com', 'rua teste 4', '12933354550');
insert into Cliente (Nome_cliente, Email_cliente, End_cliente, Tel_cliente) values('Cliente5', 'cliente5@teste.com', 'rua teste 5', '11943554450');

#Criação da Tabela Fazenda
CREATE TABLE Fazenda(
Id_fazenda int NOT NULL AUTO_INCREMENT,
Id_cliente int NOT NULL,
Nome_fazenda varchar(100) NOT NULL,
End_fazenda varchar(100) NOT NULL,
Municipio_fazenda varchar(100) NOT NULL,
UF_fazenda varchar(50) NOT NULL,
CONSTRAINT PK_Fazenda PRIMARY KEY(Id_fazenda),
FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente)
);

#Insert line - Fazenda
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(1, 'fazenda 1', 'rua Teste, 1000', 'São Paulo','SP');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(1, 'fazenda 2', 'rua Teste, 1000', 'São Paulo','SP');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(2, 'fazenda 3', 'rua Teste, 1000', 'Cuiaba','MT');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(3, 'fazenda 4', 'rua Teste, 1000', 'Cuiaba','MT');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(4, 'fazenda 5', 'rua Teste, 1000', 'Cuiaba','MT');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(5, 'fazenda 6', 'rua Teste, 1000', 'Vila Nova','RS');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(5, 'fazenda 7', 'rua Teste, 1000', 'Vila Nova','RS');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(3, 'fazenda 8', 'rua Teste, 1000', 'Vila Nova','RS');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(4, 'fazenda 9', 'rua Teste, 1000', 'Goiania','GO');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(5, 'fazenda 10', 'rua Teste, 1000', 'Goiania','GO');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(5, 'fazenda 11', 'rua Teste, 1000', 'Balsa Nova','PR');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(3, 'fazenda 12', 'rua Teste, 1000', 'Cuiabá','MT');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(4, 'fazenda 13', 'rua Teste, 1000', 'Cuiabá','MT');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(5, 'fazenda 14', 'rua Teste, 1000', 'Balsa Nova','PR');
insert into Fazenda (Id_cliente, Nome_fazenda, End_fazenda, Municipio_fazenda, UF_fazenda) values(5, 'fazenda 15', 'rua Teste, 1000', 'Balsa Nova','PR');


#Criação da Tabela Tipo Cultivo
CREATE TABLE Tipo_Cultivo(
Id_tipo_Cultivo int NOT NULL AUTO_INCREMENT,
Desc_tipo_cultivo varchar(100),
CONSTRAINT PK_Tipo_Cultivo PRIMARY KEY(Id_tipo_Cultivo)
);

#Insert line -  Tipo Cultivo Sistema producão e Cultura de Pousio
insert into Tipo_Cultivo (Desc_tipo_cultivo) values ('Sistema Produção');
insert into Tipo_Cultivo (Desc_tipo_cultivo) values ('Cultura De Pousio');

#Criação da Tabela Cultura
CREATE TABLE Cultura(
Id_cultura int NOT NULL AUTO_INCREMENT,
Desc_cultura varchar(50),
CONSTRAINT PK_Cultura PRIMARY KEY (Id_cultura)
);

#Insert line - Cultura
Insert into Cultura (Desc_cultura) values ('Milho');
Insert into Cultura (Desc_cultura) values ('Soja');
Insert into Cultura (Desc_cultura) values ('Algodão');
Insert into Cultura (Desc_cultura) values ('Café');
Insert into Cultura (Desc_cultura) values ('Laranja');

#Criação da Tabela Lavoura
CREATE TABLE Lavoura(
Id_Lavoura int NOT NULL AUTO_INCREMENT,
Id_fazenda int NOT NULL,
Id_tipo_cultivo int NOT NULL,
Id_cultura_lavoura int NOT NULL,
Id_cultura_ante_lavoura int,
Nome_talhao varchar(50) NOT NULL,
Lat_talhao decimal(10,2) NOT NULL,
Long_talhao decimal(10,2) NOT NULL,
Espacamento_lavoura decimal(10,2) NOT NULL,
Populacao_lavoura decimal(10,2) NOT NULL,
MeioCultivo_lavoura varchar(50) NOT NULL,
TamColhido_lavoura int NOT NULL,
CONSTRAINT PK_Lavoura PRIMARY KEY(Id_Lavoura),
FOREIGN KEY (Id_fazenda) REFERENCES Fazenda(Id_fazenda),
FOREIGN KEY (Id_tipo_cultivo) REFERENCES Tipo_Cultivo(Id_tipo_cultivo),
FOREIGN KEY (Id_cultura_lavoura) REFERENCES Cultura (Id_Cultura),
FOREIGN KEY (Id_cultura_ante_lavoura) REFERENCES Cultura (Id_cultura)
);

#Insert Line - Lavoura
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (1,1,1,'Talhão 1',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 1',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (1,2,2,'Talhão 2',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 2',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (2,2,2,'Talhão 3',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 3',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (2,1,2,'Talhão 4',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 4',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (3,1,2,'Talhão 5',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 5',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (3,2,2,'Talhão 6',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 6',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (4,2,2,'Talhão 7',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 7',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (4,2,2,'Talhão 8',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 8',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (5,1,2,'Talhão 9',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 9',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (5,1,2,'Talhão 10',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 10',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (6,1,1,'Talhão 11',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 11',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (6,1,1,'Talhão 12',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 12',(RAND()*10000));           
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (7,2,1,'Talhão 13',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 13',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (7,1,1,'Talhão 14',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 14',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (8,2,1,'Talhão 15',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 15',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (8,1,1,'Talhão 16',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 16',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (9,2,1,'Talhão 17',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 17',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (9,1,2,'Talhão 18',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 18',(RAND()*10000));          
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (10,1,2,'Talhão 19',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 19',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (10,2,2,'Talhão 20',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 20',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Id_cultura_ante_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (11,1,2,3,'Talhão 21',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 21',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Id_cultura_ante_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (11,2,1,4,'Talhão 22',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 21',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Id_cultura_ante_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (12,2,2,4,'Talhão 23',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 23',(RAND()*10000));
Insert into Lavoura (Id_fazenda, Id_tipo_cultivo, Id_cultura_lavoura, Id_cultura_ante_lavoura, Nome_talhao,  Lat_talhao, Long_talhao, Espacamento_lavoura, Populacao_lavoura, MeioCultivo_lavoura, TamColhido_lavoura)
				  values (12,1,3,5,'Talhão 24',((RAND() * (52.477040512464626 - 52.077090052913654)) * 100),((RAND() * (-0.9172823750000134 - -1.8840792500000134)) * -100),(RAND()*10),(RAND()*1000),'Meio 24',(RAND()*10000));

#Criação da Tabela Relatório
CREATE TABLE Relatorio(
Id_relatorio int NOT NULL AUTO_INCREMENT,
Id_Cliente int NOT NULL,
Id_Lavoura int NOT NULL,
Desc_relatorio varchar(500) NOT NULL,
CONSTRAINT PK_relatorio PRIMARY KEY(Id_relatorio),
FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_Cliente),
FOREIGN KEY (Id_Lavoura) REFERENCES Lavoura(Id_Lavoura)
);

#insert Line - Relatorio
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (1,1, 'Relatório de demonstração de teste da lavoura - exemplo 1');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (1,2, 'Relatório de demonstração de teste da lavoura - exemplo 2');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (1,3, 'Relatório de demonstração de teste da lavoura - exemplo 3');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (2,5, 'Relatório de demonstração de teste da lavoura - exemplo 4');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (2,6, 'Relatório de demonstração de teste da lavoura - exemplo 5');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (2,6, 'Relatório de demonstração de teste da lavoura - exemplo 6');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (3,7, 'Relatório de demonstração de teste da lavoura - exemplo 7');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (3,8, 'Relatório de demonstração de teste da lavoura - exemplo 8');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (3,15, 'Relatório de demonstração de teste da lavoura - exemplo 9');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (4,9, 'Relatório de demonstração de teste da lavoura - exemplo 10');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (4,10, 'Relatório de demonstração de teste da lavoura - exemplo 11');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (4,17, 'Relatório de demonstração de teste da lavoura - exemplo 12');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (5,11, 'Relatório de demonstração de teste da lavoura - exemplo 13');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (5,12, 'Relatório de demonstração de teste da lavoura - exemplo 14');
Insert into Relatorio (Id_cliente, Id_Lavoura, Desc_relatorio) values (5,13, 'Relatório de demonstração de teste da lavoura - exemplo 15');

#Criação da Tabela Tratamento
CREATE TABLE Tratamento(
Id_tratamento int NOT NULL AUTO_INCREMENT,
Id_lavoura int NOT NULL,
Custo_tratamento decimal(10,2) NOT NULL,
Produtividade_tratamento int NOT NULL,
foto_tratamento blob,
CONSTRAINT PK_tratamento PRIMARY KEY (Id_tratamento),
FOREIGN KEY (Id_lavoura) REFERENCES Lavoura(Id_lavoura)
);

#Insert Line - Tratamento - Com valores randômicos 
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (1,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (1,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (2,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (2,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (3,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (3,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (4,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (4,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (5,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (5,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (6,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (6,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (7,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (7,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (8,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (8,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (9,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (9,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (10,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (10,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (11,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (11,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (12,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (12,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (13,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (13,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (14,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (14,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (15,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (15,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (16,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (16,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (17,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (17,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (18,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (18,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (19,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (19,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (20,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (20,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (21,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (21,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (22,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (22,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (23,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (23,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (24,(RAND() * 10000), (ROUND(RAND() * 100000)));
Insert into Tratamento (Id_lavoura, Custo_tratamento, Produtividade_tratamento) Values (24,(RAND() * 10000), (ROUND(RAND() * 100000)));

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
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (2,3,4);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (3,5,6);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (4,7,8);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (5,9,10);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (6,11,12);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (7,13,14);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (8,15,16);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (9,17,18);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (10,19,20);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (11,21,22);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (12,23,24);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (13,25,26);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (14,27,28);
Insert into Tratamento_Relatorio (Id_relatorio, Id_tratamento_yara, Id_tratamento_atual) Values (15,29,30);


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
Insert into Produto (Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values ('Produto Yara 1','Yara Fertilizantes', (RAND()*10), (RAND()*100));
Insert into Produto (Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values ('Produto Yara 2','Yara Fertilizantes', (RAND()*10), (RAND()*100));
Insert into Produto (Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values ('Produto Yara 3','Yara Fertilizantes', (RAND()*10), (RAND()*100));
Insert into Produto (Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values ('Produto Concorrente 1','Concorrente 1', (RAND()*10), (RAND()*100));
Insert into Produto (Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values ('Produto Concorrente 2','Concorrente 1', (RAND()*10), (RAND()*100));
Insert into Produto (Nome_produto, Fabricante_produto, Dose_produto, Custo_produto) Values ('Produto Concorrente 3','Concorrente 1', (RAND()*10), (RAND()*100));

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
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (3,2);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (4,3);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (7,1);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (9,2);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (11,3);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (13,1);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (15,2);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (17,3);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (19,1);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (2,4);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (4,5);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (6,6);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (8,4);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (10,5);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (12,6);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (14,4);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (16,5);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (18,6);
Insert into Aplicacao_Produto (Id_tratamento, Id_produto) Values (20,4);