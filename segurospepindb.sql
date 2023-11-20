/*
 * Autor: Miguel Antonio Rondón Rodríguez 
 * contacto: rondon.miguel@gmail.com cel: 849-454-3860
 * 
 *
 */
create database segurospepindb;
use segurospepindb;

# para almacenar los estados de los registros
create table status(
id tinyint not null primary key,
name varchar(20) not null,
createdAt datetime default current_timestamp
);

insert into status(id, name) values(0, 'Inactivo'),(1, 'Activo'), (2, 'Eliminado');

# para almacenar la información de los clientes
create table customers(
id bigint not null primary key auto_increment,
name varchar(50) not null,
status tinyint default 1,
createdAt datetime default current_timestamp,
constraint fk_status foreign key (status)
references status(id) on update cascade on delete restrict
);

# para agrupar las polizas por tipos o ramos
create table branches_groups(
id integer not null primary key,
name varchar(50) not null,
status tinyint default 1,
createdAt datetime default current_timestamp,
constraint fk_status1 foreign key (status)
references status(id) on update cascade on delete restrict
);


insert into branches_groups(id, name) values(100, 'Vehículos Terrestres'),(101, 'Automóvil'),(102, 'Motor'),(103, 'Jeepeta'),(104, 'Minibus'),(105,'Camión');


create table policy(
customerId bigint not null,
policyNumber varchar(20) primary key,
branchGroupId integer not null,
vigencyStartDate datetime not null,
vigencyEndDate datetime not null,
status tinyint default 1,
createdAt datetime default current_timestamp,

constraint fk_status2 foreign key (status)
references status (id) on update cascade on delete restrict,

constraint fk_customerId foreign key (customerId)
references customers (id) on update cascade on delete restrict,

constraint fk_branchGroupId foreign key (branchGroupId)
references branches_groups (id) on update cascade on delete restrict
);


create table brands(
id integer not null primary key auto_increment,
name varchar(50) not null,
status tinyint default 1,
createdAt datetime default current_timestamp,

constraint fk_status3 foreign key (status)
references status (id) on update cascade on delete restrict
);

insert into brands(name) values('Toyota'),('Honda'),('Mitsubishi'),('Hyundai'),('BMW'),('Mercedes-Benz'),('Renault');

create table models(
id integer not null primary key auto_increment,
brandId integer not null,
name varchar(50) not null,
status tinyint default 1,
createdAt datetime default current_timestamp,

constraint fk_status4 foreign key (status)
references status (id) on update cascade on delete restrict,

constraint fk_brandId foreign key (brandId)
references brands (id) on update cascade on delete restrict
);

insert into models(brandId, name) values(1, 'Corolla'),(1,'Tercel'),(1, 'Passo'),(1,'Vitz'),(1, 'Yaris'),(1,'Starlet');
insert into models(brandId, name) values(2, 'Civic'),(2,'Logo'),(2, 'CRV');
insert into models(brandId, name) values(3, 'Mirage'),(3, 'Galant'),(3, 'Evolution');
insert into models(brandId, name) values(4, 'N-20'),(4, 'Avante'),(4, 'Elantra'),(4, 'Sonata');
insert into models(brandId, name) values(5, 'X-3'),(5, 'X-5');
insert into models(brandId, name) values(6, 'AMG');
insert into models(brandId, name) values(7, 'Clio');

create table policy_items_vehicles(
id integer not null primary key,
policyNumber varchar(20) not null,
brandId integer not null,
modelId integer not null,
modelyear integer not null,
vinNumber varchar(50) not null,
placa varchar(15) not null,
status tinyint default 1,
createdAt datetime default current_timestamp, 

constraint fk_policyNumber foreign key (policyNumber)
references policy(policyNumber) on update cascade on delete restrict,

constraint fk_brandId1 foreign key (brandId)
references brands (id) on update cascade on delete restrict,

constraint fk_modelId foreign key (modelId)
references models (id) on update cascade on delete restrict,

constraint fk_status5 foreign key (status)
references status (id) on update cascade on delete restrict

);

