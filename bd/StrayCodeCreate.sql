create table Nota_Fiscal(
id_Nota_Fiscal int identity (1,1) not null,
tipos_nota varchar (60) not null,
descricao varchar (2000) not null,
tipo_empresa int not null,
Constraint PK_Nota_fiscal Primary Key(id_Nota_Fiscal),
Constraint FK_tipo_empresa_nota foreign Key(tipo_empresa) References tipo_empresa(id_empresa)
);

create table Tipo_Empresa(
id_empresa int identity (1,1) not null,
tipo_empresa varchar (30) not null,
descricao varchar (2000) not null,
Constraint PK_empresa Primary Key(id_empresa)
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
numero_cnae int not null,
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

select * from Tipo_Empresa
select * from Ramo_Empresa
select * from Cnae
