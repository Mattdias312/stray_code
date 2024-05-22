create table Tipo_Empresa(
id_empresa int identity (1,1) not null,
tipo_empresa varchar (30) not null,
descricao varchar (2000) not null,
Constraint PK_empresa Primary Key(id_empresa)
);

create table Nota_Fiscal(
id_Nota_Fiscal int identity (1,1) not null,
tipos_nota varchar (60) not null,
descricao varchar (2000) not null,
tipo_empresa int not null,
Constraint PK_Nota_fiscal Primary Key(id_Nota_Fiscal),
Constraint FK_tipo_empresa_nota foreign Key(tipo_empresa) References tipo_empresa(id_empresa)
);

create table Ramo_Empresa(
id_ramo_empresa int identity (1,1) not null,
secao char not null,
tipo_empresa int not null,
nome_ramo_empresa varchar (100) not null,
Constraint PK_ramo_empresa Primary Key(id_ramo_empresa),
Constraint FK_tipo_empresa foreign Key(tipo_empresa) References Tipo_Empresa(id_empresa)
);

create table Cnae(
id_cnae int identity (1,1) not null,
numero_cnae varchar(10) not null,
descricao varchar (100) not null,
ramo_empresa int not null,
Constraint PK_cnae Primary Key(id_cnae),
Constraint FK_ramo_empresa foreign Key(ramo_empresa) References Ramo_Empresa(id_ramo_empresa)
);

create table Questionario(
id_questionario int identity (1,1) not null,
data_questionario date not null,
cnae int not null,
Constraint PK_questionario Primary Key(id_questionario),
Constraint FK_cnae foreign Key(cnae) References Cnae(id_cnae)
);

create table Usuario(
id_usuario int identity (1,1) not null,
usuario varchar (50) not null,
senha varchar (25) not null,
Nome varchar (50) not null,
Cpf varchar (14) not null,
Email varchar (50) not null,
questionario int not null,
Constraint PK_usuario Primary Key(id_usuario),
Constraint FK_questionario foreign Key(questionario) References Questionario(id_questionario)
);

create table Tributacao(
id_tributacao int identity (1,1) not null,
tipos_tributacao varchar (60) not null,
descricao varchar (2000) not null,
Constraint PK_tributacao Primary Key(id_tributacao)
);

create table Abrir_Empresa(
id_abrir_empresa int identity (1,1) not null,
formas_abrir_empresa varchar (100) not null,
descricao varchar (2000) not null,
tributacao int not null,
Constraint PK_abrir_empresa Primary Key(id_abrir_empresa),
Constraint FK_tributacao_Empresa foreign Key(tributacao) References Tributacao(id_tributacao)
);

create table Escolher_Contabilidade(
id_escolher_contabilidade int identity (1,1) not null,
escolher_contabilidade varchar (100) not null,
descricao varchar (2000) not null,
tributacao int not null,
Constraint PK_escolher_contabilidade Primary Key(id_escolher_contabilidade),
Constraint FK_tributacao_Contabilidade foreign Key(tributacao) References Tributacao(id_tributacao)
);

create table Ass_Tributacao_Cnae(
id_ass_tributacao_cnae int identity (1,1) not null,
cnae int not null,
tributacao int not null,
Constraint PK_ass_tributacao_cnae Primary Key(id_ass_tributacao_cnae),
Constraint FK_cnae_ass foreign Key(cnae) References Cnae(id_cnae),
Constraint FK_tributacao_ass foreign Key(tributacao) References Tributacao(id_tributacao)
);

insert into Ramo_Empresa values
('A',3,'AGRICULTURA, PECU�RIA E SERVI�OS RELACIONADOS'),
('A',3,'PRODU��O FLORESTAL'),
('B',3,'EXTRA��O DE CARV�O MINERAL'),
('B',3,'EXTRA��O DE MINERAIS MET�LICOS'),
('E',2,'CAPTA��O, TRATAMENTO E DISTRIBUI��O DE �GUA'),
('E',2,'COLETA, TRATAMENTO E DISPOSI��O DE RES�DUOS; RECUPERA��O DE MATERIAIS'),
('G',1,'COM�RCIO E REPARA��O DE VE�CULOS AUTOMOTORES E MOTOCICLETAS'),
('G',1,'COM�RCIO POR ATACADO, EXCETO VE�CULOS AUTOMOTORES E MOTOCICLETAS'),
('H',2,'TRANSPORTE TERRESTRE'),
('H',2,'TRANSPORTE AQUAVI�RIO');

insert into Cnae values
('0113-0/00','Cultivo de cana-de-a��car',2),
('0131-8/00','Cultivo de laranja',2),
('0210-1/01','Cultivo de eucalipto',3),
('0220-9/04','Coleta de l�tex em florestas nativas',3),
('0500-3/01','Extra��o de carv�o mineral',4),
('0710-3/01','Extra��o de min�rio de ferro',5),
('0721-9/01','Extra��o de min�rio de alum�nio',5),
('3600-6/01','Capta��o, tratamento e distribui��o de �gua',6),
('3600-6/02','Distribui��o de �gua por caminh�es',6),
('3811-4/00','Coleta de res�duos n�o perigosos',7),
('3900-5/00','Descontamina��o e outros servi�os de gest�o de res�duos',7),
('4511-1/01','Com�rcio a varejo de autom�veis, camionetas e utilit�rios novos',8),
('4512-9/01','Representantes comerciais e agentes do com�rcio de ve�culos automotores',8),
('4611-7/00','Representantes comerciais e agentes do com�rcio de mat�rias-primas agr�colas e animais vivos',9),
('4621-4/00','Com�rcio atacadista de caf� em gr�o',9),
('4912-4/01','Transporte ferrovi�rio de passageiros intermunicipal e interestadual',10),
('4923-0/01','Servi�o de t�xi',10),
('5011-4/02','Transporte mar�timo de cabotagem - Passageiros',11),
('5011-4/01','Transporte mar�timo de cabotagem - Carga',11);

insert into Tipo_Empresa values
('Com�rcio','Empresas que compram e vendem produtos. Isso pode incluir varejistas, atacadistas e empresas de com�rcio eletr�nico.'),
('Servi�os','Empresas que oferecem servi�os em vez de produtos tang�veis. Isso pode incluir empresas de consultoria, de tecnologia da informa��o, de sa�de, de educa��o, de transporte, entre outras.'),
('Ind�stria','Empresas que fabricam produtos f�sicos. Isso pode incluir ind�strias de manufatura, de constru��o, de energia, entre outras.');

insert into Nota_Fiscal(tipos_nota, descricao, tipo_empresa)
values ('NF-e (Nota Fiscal Eletr�nica de Produtos ou Mercadorias)', 'Esse documento substitui o modelo tradicional. 
� a vers�o digital, emitida e armazenada eletronicamente. Limita-se a registrar a venda de produtos f�sicos, 
com cobran�a de ICMS (Imposto sobre Circula��o de Mercadoria Servi�os) e IPI (Imposto sobre Produtos Industrializados) 
e deve ser expedida junto �s Secretarias Estaduais da Fazenda.
Utilizada sempre em casos de circula��o de mercadorias, geralmente, este tipo de nota fiscal � utilizado entre pessoas jur�dicas. 
Ao emitir a NF-e para o comprador, para atestar a opera��o, a empresa deve enviar um Documento Auxiliar da Nota Fiscal (DANFE) 
com o produto.', 1),
('NFS-e (Nota Fiscal Eletr�nica de Servi�os)', 'Esse � um documento fiscal digital necess�rio para confirma��o de presta��o de servi�o 
de uma institui��o para outra ou para pessoa f�sica. Sua emiss�o, na maioria das vezes, engloba pequenas e m�dias empresas. 
Esse modelo de nota deve ser expedido junto � prefeitura em que est� registrado o CNPJ da organiza��o prestadora de servi�o.
A NFS-e se diferencia por necessitar apenas da Inscri��o Municipal, que gera o DANFSE (Documento Auxiliar da Nota Fiscal de Servi�os 
Eletr�nica), e tem como caracter�stica ser um modelo mais flex�vel. Esse modelo � usado para servi�os de assinatura, Saas (oferta de 
softwares e solu��es na internet como um servi�o), ou, ainda, para produtos digitais, como livros eletr�nicos, cursos online, 
entre outros. � emitida por qualquer operadora de servi�o, como creches, hot�is, academias e afins.', 2);

insert into Tributacao (tipos_tributacao, descricao)
values ('MEI', 'O regime do MEI foi criado em 2008 para reduzir os n�veis de informalidade, proporcionando aos empreendedores meios 
mais acess�veis de regulariza��o fiscal. Para tanto, o MEI se apresenta de forma menos burocr�tica, tendo regras diferenciadas para o 
pagamento de impostos � IRPJ e CLSS, por exemplo, n�o entram no c�lculo tribut�rio dos microempreendedores individuais. Ainda sobre o pagamento de impostos, os valores de contribui��o tamb�m s�o diferenciados no MEI: os cadastrados pagam mensalmente um valor de at� R$ 60,60 � de acordo com a atividade exercida.
Para que possam se enquadrar neste regime tribut�rio, os empres�rios devem ter um faturamento bruto anual de at� R$ 81 mil e n�o 
possuir s�cios. Atendendo a esses requisitos, eles podem contar com uma s�rie de benef�cios, inclusive previdenci�rios, como: 
aposentadoria por idade, licen�a-maternidade, aux�lio-doen�a, entre outros. '),
('Simples Nacional', '- Re�ne em um �nico documento, chamado de DAS (Documento de Arrecada��o do Simples Nacional), 
as 8 taxas que devem ser pagas;
- Possui al�quotas menores que os demais regimes;
- � menos burocr�tico.
Para se enquadrar no Simples, � preciso ser microempreendedor individual (MEI), microempresa (ME) ou empresa de pequeno porte (EPP) e 
cumprir os seguintes requisitos financeiros:
1 - O MEI n�o pode ter faturamento anual acima de R$ 81 mil;
2 - Para ME, o teto � de R$ 360 mil por ano;
3 - O limite anual para a EPP � R$ 4,8 milh�es.'),
('Lucro Real', 'O enquadramento ao Lucro Real � obrigat�rio nos casos de bancos e corretoras de t�tulo e, ainda, caso a empresa tenha 
tido uma receita bruta superior a R$ 78 milh�es no ano anterior.
Diferentemente do Simples Nacional, os tributos s�o cobrados individualmente, o que requer um maior cuidado das empresas para que 
algum n�o fique em aberto. Como o c�lculo de cada taxa � baseado no lucro, esse regime � indicado para empresas que n�o tenham uma 
margem de lucro muito elevada, atuem no preju�zo ou, ent�o, tenham custos elevados em servi�os ou produtos.'),
('Lucro Presumido', 'Neste tipo de tributa��o, a incid�ncia de impostos � baseada na estimativa de lucro da empresa e calculada 
conforme a atividade que � desempenhada. No caso, os impostos podem variar de 8% (ind�stria e com�rcio) a 32% (servi�o).
Qualquer neg�cio que n�o � obrigado a aderir ao Lucro Real pode optar por esse regime, por�m ele � mais vantajoso para as empresas que:
- Apresentarem margem de lucro superior ao da presun��o;
- Tenham baixos custos operacionais;
- Possuam folha de pagamento enxuta;
- N�o ultrapassem o faturamento de R$ 78 milh�es.
- Existe, por�m, uma desvantagem que deve ser levada em considera��o. Caso a empresa lucre menos do que a m�dia das demais empresas 
que exercem a mesma atividade, ela dever� pagar um imposto em cima da al�quota pr�-fixada (8%).');

select * from Tipo_Empresa
select * from Ramo_Empresa
select * from Cnae
select * from Nota_Fiscal

