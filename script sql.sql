create schema vehiculos;

--drop table grupos, marcas,modelos,colores,aseguradoras,vehiculos,revisiones,monedas;

create table grupos(
	id SERIAL primary key,
	nombre varchar(50)
);

create table marcas(
	id SERIAL primary key,
	marca varchar(30) not null,
	id_grupo int not null
);

create table modelos(
	id SERIAL primary key,
	modelo varchar(30) not null,
	id_marca int not null
);

create table colores(
	id SERIAL primary key,
	nombre varchar(25)
);

create table aseguradoras(
	id SERIAL primary key,
	nombre varchar(50)
);

create table vehiculos(
	bastidor varchar(8) primary key,
	id_modelo int not null,
	id_color int not null,
	matricula varchar(7) not null,
	kilometros float not null,
	id_aseguradora int not null,
	fecha_compra date not null,
	numero_poliza varchar(20) not null
);

create table monedas(
	id SERIAL primary key,
	nombre varchar(30),
	simbolo varchar(1)
);

create table revisiones(
	id SERIAL primary key,
	bastidor varchar(8) not null,
	kilometros float not null,
	fecha date not null,
	importe float not null,
	id_moneda int not null
);

ALTER TABLE vehiculos.marcas ADD CONSTRAINT fk_marcas_grupos FOREIGN KEY (id_grupo) REFERENCES grupos (id);
ALTER TABLE vehiculos.modelos ADD CONSTRAINT fk_modelos_marcas FOREIGN KEY (id_marca) REFERENCES marcas (id);
ALTER TABLE vehiculos.vehiculos ADD CONSTRAINT fk_vehiculos_modelos FOREIGN KEY (id_modelo) REFERENCES modelos (id);
ALTER TABLE vehiculos.vehiculos ADD CONSTRAINT fk_vehiculos_colores FOREIGN KEY (id_color) REFERENCES colores (id);
ALTER TABLE vehiculos.vehiculos ADD CONSTRAINT fk_vehiculos_aseguradoras FOREIGN KEY (id_aseguradora) REFERENCES aseguradoras (id);
ALTER TABLE vehiculos.revisiones ADD CONSTRAINT fk_revisiones_vhiculos FOREIGN KEY (bastidor) REFERENCES vehiculos (bastidor);
ALTER TABLE vehiculos.revisiones ADD CONSTRAINT fk_revisiones_moneda FOREIGN KEY (id_moneda) REFERENCES monedas (id);

