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
('A',3,'AGRICULTURA, PECUÁRIA E SERVIÇOS RELACIONADOS'),
('A',3,'PRODUÇÃO FLORESTAL'),
('B',3,'EXTRAÇÃO DE CARVÃO MINERAL'),
('B',3,'EXTRAÇÃO DE MINERAIS METÁLICOS'),
('E',2,'CAPTAÇÃO, TRATAMENTO E DISTRIBUIÇÃO DE ÁGUA'),
('E',2,'COLETA, TRATAMENTO E DISPOSIÇÃO DE RESÍDUOS; RECUPERAÇÃO DE MATERIAIS'),
('G',1,'COMÉRCIO E REPARAÇÃO DE VEÍCULOS AUTOMOTORES E MOTOCICLETAS'),
('G',1,'COMÉRCIO POR ATACADO, EXCETO VEÍCULOS AUTOMOTORES E MOTOCICLETAS'),
('H',2,'TRANSPORTE TERRESTRE'),
('H',2,'TRANSPORTE AQUAVIÁRIO');

insert into Cnae values
('0113-0/00','Cultivo de cana-de-açúcar',2),
('0131-8/00','Cultivo de laranja',2),
('0210-1/01','Cultivo de eucalipto',3),
('0220-9/04','Coleta de látex em florestas nativas',3),
('0500-3/01','Extração de carvão mineral',4),
('0710-3/01','Extração de minério de ferro',5),
('0721-9/01','Extração de minério de alumínio',5),
('3600-6/01','Captação, tratamento e distribuição de água',6),
('3600-6/02','Distribuição de água por caminhões',6),
('3811-4/00','Coleta de resíduos não perigosos',7),
('3900-5/00','Descontaminação e outros serviços de gestão de resíduos',7),
('4511-1/01','Comércio a varejo de automóveis, camionetas e utilitários novos',8),
('4512-9/01','Representantes comerciais e agentes do comércio de veículos automotores',8),
('4611-7/00','Representantes comerciais e agentes do comércio de matérias-primas agrícolas e animais vivos',9),
('4621-4/00','Comércio atacadista de café em grão',9),
('4912-4/01','Transporte ferroviário de passageiros intermunicipal e interestadual',10),
('4923-0/01','Serviço de táxi',10),
('5011-4/02','Transporte marítimo de cabotagem - Passageiros',11),
('5011-4/01','Transporte marítimo de cabotagem - Carga',11);

insert into Tipo_Empresa values
('Comércio','Empresas que compram e vendem produtos. Isso pode incluir varejistas, atacadistas e empresas de comércio eletrônico.'),
('Serviços','Empresas que oferecem serviços em vez de produtos tangíveis. Isso pode incluir empresas de consultoria, de tecnologia da informação, de saúde, de educação, de transporte, entre outras.'),
('Indústria','Empresas que fabricam produtos físicos. Isso pode incluir indústrias de manufatura, de construção, de energia, entre outras.');

insert into Nota_Fiscal(tipos_nota, descricao, tipo_empresa)
values ('NF-e (Nota Fiscal Eletrônica de Produtos ou Mercadorias)', 'Esse documento substitui o modelo tradicional. 
É a versão digital, emitida e armazenada eletronicamente. Limita-se a registrar a venda de produtos físicos, 
com cobrança de ICMS (Imposto sobre Circulação de Mercadoria Serviços) e IPI (Imposto sobre Produtos Industrializados) 
e deve ser expedida junto às Secretarias Estaduais da Fazenda.
Utilizada sempre em casos de circulação de mercadorias, geralmente, este tipo de nota fiscal é utilizado entre pessoas jurídicas. 
Ao emitir a NF-e para o comprador, para atestar a operação, a empresa deve enviar um Documento Auxiliar da Nota Fiscal (DANFE) 
com o produto.', 1),
('NFS-e (Nota Fiscal Eletrônica de Serviços)', 'Esse é um documento fiscal digital necessário para confirmação de prestação de serviço 
de uma instituição para outra ou para pessoa física. Sua emissão, na maioria das vezes, engloba pequenas e médias empresas. 
Esse modelo de nota deve ser expedido junto à prefeitura em que está registrado o CNPJ da organização prestadora de serviço.
A NFS-e se diferencia por necessitar apenas da Inscrição Municipal, que gera o DANFSE (Documento Auxiliar da Nota Fiscal de Serviços 
Eletrônica), e tem como característica ser um modelo mais flexível. Esse modelo é usado para serviços de assinatura, Saas (oferta de 
softwares e soluções na internet como um serviço), ou, ainda, para produtos digitais, como livros eletrônicos, cursos online, 
entre outros. É emitida por qualquer operadora de serviço, como creches, hotéis, academias e afins.', 2);

insert into Tributacao (tipos_tributacao, descricao)
values ('MEI', 'O regime do MEI foi criado em 2008 para reduzir os níveis de informalidade, proporcionando aos empreendedores meios 
mais acessíveis de regularização fiscal. Para tanto, o MEI se apresenta de forma menos burocrática, tendo regras diferenciadas para o 
pagamento de impostos — IRPJ e CLSS, por exemplo, não entram no cálculo tributário dos microempreendedores individuais. Ainda sobre o pagamento de impostos, os valores de contribuição também são diferenciados no MEI: os cadastrados pagam mensalmente um valor de até R$ 60,60 — de acordo com a atividade exercida.
Para que possam se enquadrar neste regime tributário, os empresários devem ter um faturamento bruto anual de até R$ 81 mil e não 
possuir sócios. Atendendo a esses requisitos, eles podem contar com uma série de benefícios, inclusive previdenciários, como: 
aposentadoria por idade, licença-maternidade, auxílio-doença, entre outros. '),
('Simples Nacional', '- Reúne em um único documento, chamado de DAS (Documento de Arrecadação do Simples Nacional), 
as 8 taxas que devem ser pagas;
- Possui alíquotas menores que os demais regimes;
- É menos burocrático.
Para se enquadrar no Simples, é preciso ser microempreendedor individual (MEI), microempresa (ME) ou empresa de pequeno porte (EPP) e 
cumprir os seguintes requisitos financeiros:
1 - O MEI não pode ter faturamento anual acima de R$ 81 mil;
2 - Para ME, o teto é de R$ 360 mil por ano;
3 - O limite anual para a EPP é R$ 4,8 milhões.'),
('Lucro Real', 'O enquadramento ao Lucro Real é obrigatório nos casos de bancos e corretoras de título e, ainda, caso a empresa tenha 
tido uma receita bruta superior a R$ 78 milhões no ano anterior.
Diferentemente do Simples Nacional, os tributos são cobrados individualmente, o que requer um maior cuidado das empresas para que 
algum não fique em aberto. Como o cálculo de cada taxa é baseado no lucro, esse regime é indicado para empresas que não tenham uma 
margem de lucro muito elevada, atuem no prejuízo ou, então, tenham custos elevados em serviços ou produtos.'),
('Lucro Presumido', 'Neste tipo de tributação, a incidência de impostos é baseada na estimativa de lucro da empresa e calculada 
conforme a atividade que é desempenhada. No caso, os impostos podem variar de 8% (indústria e comércio) a 32% (serviço).
Qualquer negócio que não é obrigado a aderir ao Lucro Real pode optar por esse regime, porém ele é mais vantajoso para as empresas que:
- Apresentarem margem de lucro superior ao da presunção;
- Tenham baixos custos operacionais;
- Possuam folha de pagamento enxuta;
- Não ultrapassem o faturamento de R$ 78 milhões.
- Existe, porém, uma desvantagem que deve ser levada em consideração. Caso a empresa lucre menos do que a média das demais empresas 
que exercem a mesma atividade, ela deverá pagar um imposto em cima da alíquota pré-fixada (8%).');

insert into Questionario
values (GETDATE(), 19),
(GETDATE(), 28),
(GETDATE(), 35)

insert into Usuario
values ('JG_da_selva', 'J_G12345', 'João Gomes', '111-111-111-11', 'joaog@email.com', 3),
('Laral', 'L_12345', 'Larissa Manoela', '222-222-222-22', 'laralm@email.com', 4),
('Ojoaq', '302112M', 'Joaquim Silva', '333-333-333-33', 'joaquims@email.com', 7);

insert into Ass_Tributacao_Cnae
values (19, 1),
(20, 1),
(21, 1),
(25, 2),
(28, 2),
(35, 3);

select te.tipo_empresa
from Usuario u inner join Questionario q on u.questionario = q.id_questionario
inner join Cnae c on q.cnae = c.id_cnae inner join Ramo_Empresa re on c.ramo_empresa = re.id_ramo_empresa
inner join Tipo_Empresa te on re.tipo_empresa = te.id_empresa
where id_usuario = 1;

select re.nome_ramo_empresa
from Usuario u inner join Questionario q on u.questionario = q.id_questionario
inner join Cnae c on q.cnae = c.id_cnae inner join Ramo_Empresa re on c.ramo_empresa = re.id_ramo_empresa
where id_usuario = 2

select nf.tipos_nota
from Usuario u inner join Questionario q on u.questionario = q.id_questionario
inner join Cnae c on q.cnae = c.id_cnae inner join Ramo_Empresa re on c.ramo_empresa = re.id_ramo_empresa
inner join Tipo_Empresa te on re.tipo_empresa = te.id_empresa inner join Nota_Fiscal nf on nf.tipo_empresa = te.id_empresa
where id_usuario = 6;

select tipos_tributacao
from Usuario u inner join Questionario q on u.questionario = q.id_questionario
inner join Cnae c on q.cnae = c.id_cnae inner join Ass_Tributacao_Cnae asso on c.id_cnae = asso.cnae
inner join Tributacao t on asso.tributacao = t.id_tributacao
where id_usuario = 6;

select tipos_tributacao
from Usuario u inner join Questionario q on u.questionario = q.id_questionario
inner join Cnae c on q.cnae = c.id_cnae inner join Ass_Tributacao_Cnae asso on c.id_cnae = asso.cnae
inner join Tributacao t on asso.tributacao = t.id_tributacao
where id_usuario = 1;

select te.tipo_empresa
from Usuario u inner join Questionario q on u.questionario = q.id_questionario
inner join Cnae c on q.cnae = c.id_cnae inner join Ramo_Empresa re on c.ramo_empresa = re.id_ramo_empresa
inner join Tipo_Empresa te on re.tipo_empresa = te.id_empresa
where id_usuario = 6;

select * from Tipo_Empresa
select * from Ramo_Empresa
select * from Cnae
select * from Tributacao
select * from Nota_Fiscal
select * from Questionario
select * from Usuario
select * from Ass_Tributacao_Cnae
