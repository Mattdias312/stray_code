insert into Tipo_Empresa values
('Comércio','Empresas que compram e vendem produtos. Isso pode incluir varejistas, atacadistas e empresas de comércio eletrônico.'),
('Serviços','Empresas que oferecem serviços em vez de produtos tangíveis. Isso pode incluir empresas de consultoria, de tecnologia da informação, de saúde, de educação, de transporte, entre outras.'),
('Indústria','Empresas que fabricam produtos físicos. Isso pode incluir indústrias de manufatura, de construção, de energia, entre outras.');


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


insert into Tributacao values
('Simples Nacional','Ele foi instituído pela Lei Complementar 123 de 14 de dezembro de 2006, criada para simplificar o pagamento de tributos por Microempresas (ME) e Empresas de Pequeno Porte (EPP).

Como ele foi criado justamente como um regime visando atender micro e pequenas empresas, o Simples Nacional compreende os tributos voltados exclusivamente a esses tipos de empreendimentos, possuindo menores cargas tributárias.

Além de oferecer um tratamento diferenciado para as pequenas e microempresas, esse tipo de regime conta com alíquotas nominais que variam de 4% a 22,90%, distribuídas em seis anexos, contemplando variados setores e atividades econômicas.',)