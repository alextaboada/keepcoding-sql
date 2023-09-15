create schema vehiculos;

--Create tables
create table vehiculos.grupos(
	id SERIAL primary key,
	nombre varchar(50) not null
);

create table vehiculos.marcas(
	id SERIAL primary key,
	marca varchar(30) not null,
	id_grupo int not null
);

create table vehiculos.modelos(
	id SERIAL primary key,
	modelo varchar(30) not null,
	id_marca int not null
);

create table vehiculos.colores(
	id SERIAL primary key,
	nombre varchar(25) not null
);

create table vehiculos.aseguradoras(
	id SERIAL primary key,
	nombre varchar(50) not null
);

create table vehiculos.polizas(
	id SERIAL primary key,
	id_vehiculo varchar(17) not null,
	poliza varchar(20) not null,
	fecha date not null,
	vencimiento date not null,
	id_aseguradora int not null
);

create table vehiculos.vehiculos(
	bastidor varchar(17) primary key,
	id_modelo int not null,
	id_color int not null,
	matricula varchar(7) not null,
	kilometros float not null,
	id_aseguradora int not null,
	fecha_compra date not null
);

create table vehiculos.monedas(
	id SERIAL primary key,
	nombre varchar(30) not null,
	simbolo varchar(2) not null,
	codigo varchar(3) not null
);

create table vehiculos.revisiones(
	id SERIAL primary key,
	bastidor varchar(17) not null,
	kilometros float not null,
	fecha date not null,
	importe float not null,
	id_moneda int not null
);

--Create relations between tables
ALTER TABLE vehiculos.marcas ADD CONSTRAINT fk_marcas_grupos FOREIGN KEY (id_grupo) REFERENCES vehiculos.grupos (id);
ALTER TABLE vehiculos.modelos ADD CONSTRAINT fk_modelos_marcas FOREIGN KEY (id_marca) REFERENCES vehiculos.marcas (id);
ALTER TABLE vehiculos.vehiculos ADD CONSTRAINT fk_vehiculos_modelos FOREIGN KEY (id_modelo) REFERENCES vehiculos.modelos (id);
ALTER TABLE vehiculos.vehiculos ADD CONSTRAINT fk_vehiculos_colores FOREIGN KEY (id_color) REFERENCES vehiculos.colores (id);
ALTER TABLE vehiculos.polizas ADD CONSTRAINT fk_polizas_vehiculos FOREIGN KEY (id_vehiculo) REFERENCES vehiculos.vehiculos (bastidor);
ALTER TABLE vehiculos.polizas ADD CONSTRAINT fk_polizas_aseguradoras FOREIGN KEY (id_aseguradora) REFERENCES vehiculos.aseguradoras (id);
ALTER TABLE vehiculos.revisiones ADD CONSTRAINT fk_revisiones_vehiculos FOREIGN KEY (bastidor) REFERENCES vehiculos.vehiculos (bastidor);
ALTER TABLE vehiculos.revisiones ADD CONSTRAINT fk_revisiones_moneda FOREIGN KEY (id_moneda) REFERENCES vehiculos.monedas (id);

--Add data to tables
insert into vehiculos.grupos (nombre) values ('Alianza Renault-Nissan-Mitsubishi'),('BMW Group'),('Ford'),('Geely'),('General Motors'),('Grupo Stellantis'),('Honda'),('Hyundai Motor Company'),('Mazda'),('Subaru'),('Suzuki'),('Tata'),('Tesla Inc'),('Toyota'),('Volkswagen');
insert into vehiculos.marcas(id_grupo,marca) values (1,'Alpine'),(1,'Dacia'),(1,'Renault'),(1,'Lada'),(1,'Nissan'),(1,'Mitsubishi'),(1,'Infiniti'),(2,'Mini'),(2,'Rolls Royce'),(2,'BMW'),(3,'Ford'),(3,'The Lincoln Company'),(4,'Geely'),(4,'London Taxi C.'),(4,'Lotus'),(4,'Lynk&Co'),(4,'Polestar'),(4,'Proton'),(4,'Volvo'),(5,'Baojun'),(5,'Buick'),(5,'Cadillac'),(5,'Chevrolet'),(5,'GMC'),(5,'Wuling Motors'),(6,'Alfa Romeo'),(6,'Fiat'),(6,'Lancia'),(6,'Maserati'),(6,'Jeep'),(6,'Chrysler'),(6,'Dodge'),(6,'Peugeot'),(6,'Citröen'),(6,'DS Automobiles'),(6,'Opel'),(6,'Vauxhall'),(7,'Acura'),(7,'Honda'),(8,'Kia'),(8,'Hyundai'),(8,'Genesis'),(9,'Mazda'),(10,'Subaru'),(11,'Suzuki'),(12,'Jaguar'),(12,'Land Rover'),(12,'Tata Motors'),(13,'Model S'),(13,'Model 3'),(13,'Model X'),(13,'Model Y'),(14,'Daihatsu'),(14,'Lexus'),(14,'Toyota'),(14,'Hino'),(15,'Audi'),(15,'Bentley'),(15,'Cupra'),(15,'Lamborghini'),(15,'Porsche'),(15,'SEAT'),(15,'Skoda'),(15,'Volkswagen');
insert into vehiculos.modelos(id_marca,modelo) values (2,'Lodgy'),(2,'Duster'),(2,'Sandero'),(2,'Dokker'),(2,'Logan'),(3,'Clio'),(3,'Twingo'),(3,'Arkana'),(3,'Grand Scénic'),(3,'Talisman Sporter'),(3,'Koleos'),(3,'Espace Monovolumen'),(3,'Scénic'),(3,'ZOE'),(3,'Mégane'),(3,'Captur'),(3,'Kadjar'),(5,'Ariya'),(5,'JUKE'),(5,'PULSAR'),(5,'QASHQAI'),(5,'NOTE'),(5,'X-TRAIL'),(5,'GT-R'),(5,'370Z'),(5,'Micra'),(5,'LEAF'),(6,'Eclipse Cross'),(6,'ASX'),(6,'Space Star'),(6,'Montero'),(6,'i-MiEV'),(6,'Outlander'),(10,'iX'),(10,'X1'),(10,'Serie 4'),(10,'Serie 3 Gran Turismo'),(10,'Z4'),(10,'Serie 6'),(10,'X3'),(10,'X4'),(10,'X2'),(10,'Serie 3'),(10,'X6'),(10,'Serie 5'),(10,'i8'),(10,'X5'),(10,'i3'),(10,'Serie 7'),(10,'Serie 2 Coupé'),(10,'Serie 8 Coupé'),(10,'Serie 3 Familiar'),(10,'X7'),(10,'Serie 1'),(11,'Mustang Mach-E'),(11,'Kuga'),(11,'Focus'),(11,'Tourneo Custom'),(11,'Mustang'),(11,'Galaxy'),(11,'EcoSport'),(11,'C-Max'),(11,'Ka+'),(11,'Tourneo Courier'),(11,'Transit Connect'),(11,'Edge'),(11,'B-MAX'),(11,'Fiesta'),(11,'Mondeo'),(11,'Explorer'),(11,'Grand C-Max'),(11,'Puma'),(11,'S-MAX'),(19,'XC90'),(19,'V40'),(19,'XC60'),(19,'V90 Cross Country'),(19,'V40 Cross Country'),(19,'V60'),(19,'S90'),(19,'V90'),(19,'XC40'),(26,'Romeo Giulietta'),(26,'Romeo Stelvio'),(26,'Romeo 4C'),(26,'Romeo Giulia'),(26,'Romeo MiTo'),(27,'500L'),(27,'500'),(27,'Panda'),(27,'500X'),(27,'Tipo'),(27,'124 Spider'),(27,'Punto'),(30,'Cherokee'),(30,'Compass'),(30,'Wrangler Unlimited'),(30,'Renegade'),(30,'Grand Cherokee'),(33,'5008'),(33,'ion'),(33,'Traveller'),(33,'308'),(33,'208'),(33,'108'),(33,'e-208'),(33,'508'),(33,'3008'),(33,'2008'),(33,'e-2008'),(33,'Rifter'),(34,'C5'),(34,'C1'),(34,'C-Elysée'),(34,'C5 Aircross'),(34,'E-Mehari'),(34,'C4 Picasso'),(34,'Berlingo'),(34,'C3'),(34,'C3 Aircross'),(34,'C-Zero'),(34,'Grand C4 Picasso'),(34,'C4'),(34,'C4 Cactus'),(34,'Spacetourer'),(35,'DS 3 Crossback'),(35,'DS 7 Crossback'),(35,'DS 4 Crossback'),(35,'DS 4'),(35,'DS 5'),(35,'DS 3'),(36,'Insignia'),(36,'Corsa'),(36,'Astra'),(36,'Mokka X'),(36,'Crossland X'),(36,'Cabrio'),(36,'Zafira'),(36,'Grandland X'),(36,'Karl'),(36,'GTC'),(36,'Corsa-e'),(36,'Adam'),(39,'Civic'),(39,'Jazz'),(39,'HR-V'),(39,'CR-V'),(39,'Honda e'),(40,'XCeed'),(40,'Niro'),(40,'Sportage'),(40,'Optima GT'),(40,'Rio'),(40,'Ceed'),(40,'Carens'),(40,'Sorento'),(40,'Stonic'),(40,'e-Soul'),(40,'e-Niro'),(40,'Venga'),(40,'Picanto'),(40,'Stinger'),(41,'Bayon'),(41,'Tucson'),(41,'i30'),(41,'i20 Active'),(41,'Grand Santa Fe'),(41,'IONIQ'),(41,'Santa Fe'),(41,'Genesis'),(41,'i10'),(41,'Elantra'),(41,'ix20'),(41,'i40'),(41,'Nexo'),(41,'Kona'),(43,'CX-60'),(43,'MX-5'),(43,'Mazda2'),(43,'Mazda6'),(43,'CX-30'),(43,'CX-5'),(43,'Mazda3'),(43,'CX-3');
insert into vehiculos.aseguradoras (nombre) values ('Mapfre'),('AXA'),('Mutua Madrileña'),('Allianz'),('Zurich Seguros'),('Liberty Seguros'),('Generali'),('Pelayo'),('Línea Directa'),('Caser Seguros'),('Verti Seguros'),('Fiatc Seguros'),('Direct Seguros'),('Sanitas'),('Nuez Seguros');
insert into vehiculos.colores (nombre) values ('Blanco'),('Negro'),('Gris Plateado'),('Gris Grafito'),('Azul marino'),('Azul claro'),('Azul metalico'),('Rojo'),('Amarillo'),('Verde oscuro'),('Verde esmeralda'),('Verde metalico'),('Marrón'),('Naranja'),('Morado'),('Rosa'),('Dorado'),('Plateado');
insert into vehiculos.monedas (nombre,simbolo,codigo) values ('Dólar estadounidense','$','USD'),('Euro','€','EUR'),('Libra esterlina','£','GBP'),('Yen japonés','¥','JPY'),('Dólar canadiense','$','CAD'),('Dólar australiano','$','AUD'),('Franco suizo','Fr','CHF'),('Corona sueca','kr','SEK'),('Corona noruega','kr','NOK'),('Peso mexicano','$','MXN'),('Real brasileño','R$','BRL'),('Yuan chino','¥','CNY'),('Dólar neozelandés','$','NZD'),('Rupia india','₹','INR'),('Rupia indonesia','Rp','IDR');

insert into vehiculos.vehiculos (bastidor,id_modelo,id_color,matricula,kilometros,id_aseguradora,fecha_compra) values
('1FTPW125X5FA69245',31,7,'JBJ6513',21306,10,'2006/09/24'),
('WAUD2AFD7DN006931',34,15,'GVT9902',34812,5,'2005/02/21'),
('1HGCG5659WA086602',10,5,'RPH5871',76566,3,'2021/11/11'),
('2FMDK4KC4CBA27842',15,14,'GHG6784',9907,10,'2002/12/5'),
('JH4KA4670LC010014',28,17,'BGW360',24007,10,'2020/09/21'),
('YV1AH852071023377',40,18,'BBN8300',38975,10,'2009/05/16'),
('SALME1D48CA365300',30,8,'ZND8107',44170,2,'2002/09/23'),
('1FTCR15XXRTB03260',19,18,'ADY3377',75752,1,'2001/06/27'),
('SALAE25425A328687',15,18,'VZP816',32263,4,'2019/12/04'),
('2FMDK4KC4CBA27843',41,7,'FMI8211',31719,10,'2016/10/14'),
('JNRAS08W64X222014',36,6,'TYO9670',91630,3,'2001/06/08');

insert into vehiculos.polizas(id_vehiculo,poliza,fecha,vencimiento,id_aseguradora) values 
('1FTPW125X5FA69245','892384jdsjas','2019-01-01','2020-01-01',1),
('1FTPW125X5FA69245','892384jdsjas','2020-01-01','2021-01-01',1),
('1FTPW125X5FA69245','892384jdsjas','2021-01-01','2022-01-01',1),
('1FTPW125X5FA69245','892384jdsjas','2022-01-01','2023-01-01',1),
('1FTPW125X5FA69245','892384jdsjas','2023-01-01','2024-01-01',1),
('WAUD2AFD7DN006931','jsjsd77234ls','2019-01-01','2020-01-01',2),
('WAUD2AFD7DN006931','jsjsd77234ls','2020-01-01','2021-01-01',2),
('WAUD2AFD7DN006931','ud9askdsksdf','2021-01-01','2022-01-01',3),
('WAUD2AFD7DN006931','ud9askdsksdf','2022-01-01','2023-01-01',3),
('WAUD2AFD7DN006931','ud9askdsksdf','2023-01-01','2024-01-01',3),
('1HGCG5659WA086602','xvsdfv44sdrf','2019-01-01','2020-01-01',2),
('1HGCG5659WA086602','xvsdfv44sdrf','2020-01-01','2021-01-01',2),
('1HGCG5659WA086602','dsfgfgh63443','2021-01-01','2022-01-01',4),
('1HGCG5659WA086602','dsfgfgh63443','2022-01-01','2023-01-01',4),
('1HGCG5659WA086602','dsfgfgh63443','2023-01-01','2024-01-01',5),
('2FMDK4KC4CBA27842','sdf345dfsdfd','2019-01-01','2024-01-01',6),
('JH4KA4670LC010014','sdffsdfdsdfd','2019-01-01','2021-01-01',7),
('JH4KA4670LC010014','dsfgfgh63443','2021-01-01','2024-01-01',4),
('YV1AH852071023377','ssdffw34r4ff','2019-01-01','2020-01-01',2),
('YV1AH852071023377','3fdsf4345ffd','2020-01-01','2021-01-01',9),
('YV1AH852071023377','fdbcvbzsd34f','2021-01-01','2022-01-01',4),
('YV1AH852071023377','fdbcvbzsd34f','2022-01-01','2023-01-01',4),
('YV1AH852071023377','svsdxcxcvsdf','2023-01-01','2024-01-01',5),
('SALME1D48CA365300','svsdxcxcvsdf','2018-01-01','2024-01-01',5),
('1FTCR15XXRTB03260','sdf43sdfghjh','2019-01-01','2020-01-01',2),
('1FTCR15XXRTB03260','xzcvzasece3a','2020-01-01','2021-01-01',3),
('1FTCR15XXRTB03260','sdrcb345scxz','2021-01-01','2022-01-01',4),
('1FTCR15XXRTB03260','sdf-asdasdee','2022-01-01','2023-01-01',5),
('1FTCR15XXRTB03260','sdawsdqw-dfg','2023-01-01','2024-01-01',8),
('SALAE25425A328687','sdfvzxcsaasd','2018-01-01','2024-01-01',5),
('2FMDK4KC4CBA27843','sdfzxzxabtgr','2018-01-01','2024-01-01',7),
('JNRAS08W64X222014','3453sdfdsssa','2018-01-01','2024-01-01',4);


insert into vehiculos.revisiones(bastidor,kilometros,fecha,importe,id_moneda) values
('1FTPW125X5FA69245',132103,'2007-01-01',40,1),
('1FTPW125X5FA69245',145670,'2008-01-01',40,1),
('1FTPW125X5FA69245',159237,'2009-01-01',40,1),
('1FTPW125X5FA69245',172804,'2010-01-01',40,1),
('1FTPW125X5FA69245',186371,'2011-01-01',40,1),
('1FTPW125X5FA69245',199938,'2012-01-01',40,1),
('1FTPW125X5FA69245',213505,'2013-01-01',40,1),
('1FTPW125X5FA69245',227072,'2014-01-01',40,1),
('1FTPW125X5FA69245',240639,'2015-01-01',40,1),
('1FTPW125X5FA69245',254206,'2016-01-01',40,1),
('1FTPW125X5FA69245',267773,'2017-01-01',40,1),
('1FTPW125X5FA69245',281340,'2018-01-01',40,1),
('1FTPW125X5FA69245',294907,'2019-01-01',40,1),
('1FTPW125X5FA69245',308474,'2020-01-01',40,1),
('1FTPW125X5FA69245',322041,'2021-01-01',40,1),
('1FTPW125X5FA69245',335608,'2022-01-01',40,1),
('1FTPW125X5FA69245',349175,'2023-01-01',40,1),
('WAUD2AFD7DN006931',23456,'2006-01-01',40,2),
('WAUD2AFD7DN006931',45876,'2007-01-01',40,2),
('WAUD2AFD7DN006931',68296,'2008-01-01',40,2),
('WAUD2AFD7DN006931',90716,'2009-01-01',40,2),
('WAUD2AFD7DN006931',113136,'2010-01-01',40,2),
('WAUD2AFD7DN006931',135556,'2011-01-01',40,2),
('WAUD2AFD7DN006931',157976,'2012-01-01',40,2),
('WAUD2AFD7DN006931',180396,'2013-01-01',40,2),
('WAUD2AFD7DN006931',202816,'2014-01-01',40,2),
('WAUD2AFD7DN006931',225236,'2015-01-01',40,2),
('WAUD2AFD7DN006931',247656,'2016-01-01',40,2),
('WAUD2AFD7DN006931',270076,'2017-01-01',40,2),
('WAUD2AFD7DN006931',292496,'2018-01-01',40,2),
('WAUD2AFD7DN006931',314916,'2019-01-01',40,2),
('WAUD2AFD7DN006931',337336,'2020-01-01',40,2),
('WAUD2AFD7DN006931',359756,'2021-01-01',40,2),
('WAUD2AFD7DN006931',382176,'2022-01-01',40,2),
('WAUD2AFD7DN006931',404596,'2023-01-01',40,2),
('1HGCG5659WA086602',30,'2021-01-01',40,3),
('1HGCG5659WA086602',15876,'2022-01-01',40,3),
('1HGCG5659WA086602',31722,'2023-01-01',40,3),
('2FMDK4KC4CBA27842',4562,'2002-01-01',40,4),
('2FMDK4KC4CBA27842',14743,'2003-01-01',40,4),
('2FMDK4KC4CBA27842',24924,'2004-01-01',40,4),
('2FMDK4KC4CBA27842',35105,'2005-01-01',40,4),
('2FMDK4KC4CBA27842',45286,'2006-01-01',40,4),
('2FMDK4KC4CBA27842',55467,'2007-01-01',40,4),
('2FMDK4KC4CBA27842',65648,'2008-01-01',40,4),
('2FMDK4KC4CBA27842',75829,'2009-01-01',40,4),
('2FMDK4KC4CBA27842',86010,'2010-01-01',40,4),
('2FMDK4KC4CBA27842',96191,'2011-01-01',40,4),
('2FMDK4KC4CBA27842',106372,'2012-01-01',40,4),
('2FMDK4KC4CBA27842',116553,'2013-01-01',40,4),
('2FMDK4KC4CBA27842',126734,'2014-01-01',40,4),
('2FMDK4KC4CBA27842',136915,'2015-01-01',40,4),
('2FMDK4KC4CBA27842',147096,'2016-01-01',40,4),
('2FMDK4KC4CBA27842',157277,'2017-01-01',40,4),
('2FMDK4KC4CBA27842',167458,'2018-01-01',40,4),
('2FMDK4KC4CBA27842',177639,'2019-01-01',40,4),
('2FMDK4KC4CBA27842',187820,'2020-01-01',40,4),
('2FMDK4KC4CBA27842',198001,'2021-01-01',40,4),
('2FMDK4KC4CBA27842',208182,'2022-01-01',40,4),
('2FMDK4KC4CBA27842',218363,'2023-01-01',40,4),
('JH4KA4670LC010014',3874,'2020-01-01',40,5),
('JH4KA4670LC010014',28625,'2021-01-01',40,5),
('JH4KA4670LC010014',53376,'2022-01-01',40,5),
('JH4KA4670LC010014',78127,'2023-01-01',40,5),
('YV1AH852071023377',15623,'2009-01-01',40,6),
('YV1AH852071023377',39871,'2010-01-01',40,6),
('YV1AH852071023377',64119,'2011-01-01',40,6),
('YV1AH852071023377',88367,'2012-01-01',40,6),
('YV1AH852071023377',112615,'2013-01-01',40,6),
('YV1AH852071023377',136863,'2014-01-01',40,6),
('YV1AH852071023377',161111,'2015-01-01',40,6),
('YV1AH852071023377',185359,'2016-01-01',40,6),
('YV1AH852071023377',209607,'2017-01-01',40,6),
('YV1AH852071023377',233855,'2018-01-01',40,6),
('YV1AH852071023377',258103,'2019-01-01',40,6),
('YV1AH852071023377',282351,'2020-01-01',40,6),
('YV1AH852071023377',306599,'2021-01-01',40,6),
('YV1AH852071023377',330847,'2022-01-01',40,6),
('YV1AH852071023377',355095,'2023-01-01',40,6),
('SALME1D48CA365300',4772,'2002-01-01',40,7),
('SALME1D48CA365300',25852,'2003-01-01',40,7),
('SALME1D48CA365300',46932,'2004-01-01',40,7),
('SALME1D48CA365300',68012,'2005-01-01',40,7),
('SALME1D48CA365300',89092,'2006-01-01',40,7),
('SALME1D48CA365300',110172,'2007-01-01',40,7),
('SALME1D48CA365300',131252,'2008-01-01',40,7),
('SALME1D48CA365300',152332,'2009-01-01',40,7),
('SALME1D48CA365300',173412,'2010-01-01',40,7),
('SALME1D48CA365300',194492,'2011-01-01',40,7),
('SALME1D48CA365300',215572,'2012-01-01',40,7),
('SALME1D48CA365300',236652,'2013-01-01',40,7),
('SALME1D48CA365300',257732,'2014-01-01',40,7),
('SALME1D48CA365300',278812,'2015-01-01',40,7),
('SALME1D48CA365300',299892,'2016-01-01',40,7),
('SALME1D48CA365300',320972,'2017-01-01',40,7),
('SALME1D48CA365300',342052,'2018-01-01',40,7),
('SALME1D48CA365300',363132,'2019-01-01',40,7),
('SALME1D48CA365300',384212,'2020-01-01',40,7),
('SALME1D48CA365300',405292,'2021-01-01',40,7),
('SALME1D48CA365300',426372,'2022-01-01',40,7),
('SALME1D48CA365300',447452,'2023-01-01',40,7),
('1FTCR15XXRTB03260',27411,'2001-01-01',40,8),
('1FTCR15XXRTB03260',45112,'2002-01-01',40,8),
('1FTCR15XXRTB03260',62813,'2003-01-01',40,8),
('1FTCR15XXRTB03260',80514,'2004-01-01',40,8),
('1FTCR15XXRTB03260',98215,'2005-01-01',40,8),
('1FTCR15XXRTB03260',115916,'2006-01-01',40,8),
('1FTCR15XXRTB03260',133617,'2007-01-01',40,8),
('1FTCR15XXRTB03260',151318,'2008-01-01',40,8),
('1FTCR15XXRTB03260',169019,'2009-01-01',40,8),
('1FTCR15XXRTB03260',186720,'2010-01-01',40,8),
('1FTCR15XXRTB03260',204421,'2011-01-01',40,8),
('1FTCR15XXRTB03260',222122,'2012-01-01',40,8),
('1FTCR15XXRTB03260',239823,'2013-01-01',40,8),
('1FTCR15XXRTB03260',257524,'2014-01-01',40,8),
('1FTCR15XXRTB03260',275225,'2015-01-01',40,8),
('1FTCR15XXRTB03260',292926,'2016-01-01',40,8),
('1FTCR15XXRTB03260',310627,'2017-01-01',40,8),
('1FTCR15XXRTB03260',328328,'2018-01-01',40,8),
('1FTCR15XXRTB03260',346029,'2019-01-01',40,8),
('1FTCR15XXRTB03260',363730,'2020-01-01',40,8),
('1FTCR15XXRTB03260',381431,'2021-01-01',40,8),
('1FTCR15XXRTB03260',399132,'2022-01-01',40,8),
('1FTCR15XXRTB03260',416833,'2023-01-01',40,8),
('SALAE25425A328687',1863,'2019-01-01',40,9),
('SALAE25425A328687',15411,'2020-01-01',40,9),
('SALAE25425A328687',28959,'2021-01-01',40,9),
('SALAE25425A328687',42507,'2022-01-01',40,9),
('SALAE25425A328687',56055,'2023-01-01',40,9),
('2FMDK4KC4CBA27843',3887,'2016-01-01',40,10),
('2FMDK4KC4CBA27843',25871,'2017-01-01',40,10),
('2FMDK4KC4CBA27843',47855,'2018-01-01',40,10),
('2FMDK4KC4CBA27843',69839,'2019-01-01',40,10),
('2FMDK4KC4CBA27843',91823,'2020-01-01',40,10),
('2FMDK4KC4CBA27843',113807,'2021-01-01',40,10),
('2FMDK4KC4CBA27843',135791,'2022-01-01',40,10),
('2FMDK4KC4CBA27843',157775,'2023-01-01',40,10),
('JNRAS08W64X222014',5911,'2001-01-01',40,11),
('JNRAS08W64X222014',32633,'2002-01-01',40,11),
('JNRAS08W64X222014',59355,'2003-01-01',40,11),
('JNRAS08W64X222014',86077,'2004-01-01',40,11),
('JNRAS08W64X222014',112799,'2005-01-01',40,11),
('JNRAS08W64X222014',139521,'2006-01-01',40,11),
('JNRAS08W64X222014',166243,'2007-01-01',40,11),
('JNRAS08W64X222014',192965,'2008-01-01',40,11),
('JNRAS08W64X222014',219687,'2009-01-01',40,11),
('JNRAS08W64X222014',246409,'2010-01-01',40,11),
('JNRAS08W64X222014',273131,'2011-01-01',40,11),
('JNRAS08W64X222014',299853,'2012-01-01',40,11),
('JNRAS08W64X222014',326575,'2013-01-01',40,11),
('JNRAS08W64X222014',353297,'2014-01-01',40,11),
('JNRAS08W64X222014',380019,'2015-01-01',40,11),
('JNRAS08W64X222014',406741,'2016-01-01',40,11),
('JNRAS08W64X222014',433463,'2017-01-01',40,11),
('JNRAS08W64X222014',460185,'2018-01-01',40,11),
('JNRAS08W64X222014',486907,'2019-01-01',40,11),
('JNRAS08W64X222014',513629,'2020-01-01',40,11),
('JNRAS08W64X222014',540351,'2021-01-01',40,11),
('JNRAS08W64X222014',567073,'2022-01-01',40,11),
('JNRAS08W64X222014',593795,'2023-01-01',40,11);

select v.fecha_compra,mo.modelo,ma.marca,g.nombre,v.fecha_compra,v.matricula,c.nombre, kilometros,p.poliza,a.nombre
from vehiculos.vehiculos v
inner join vehiculos.modelos mo on v.id_modelo = mo.id 
inner join vehiculos.marcas ma on mo.id_marca = ma.id
inner join vehiculos.grupos g on ma.id_grupo = g.id
inner join vehiculos.colores c on v.id_color = c.id
inner join vehiculos.polizas p on v.bastidor = p.id_vehiculo
inner join vehiculos.aseguradoras a on a.id= p.id_aseguradora
where p.vencimiento > now()
