create database reservads;
use reservads;

create table rol (
    idrol int auto_increment primary key,
    nombrerol varchar(255) unique not null
);

insert into rol (nombreRol) 
values ('dueno');

insert into rol (nombreRol) 
values ('empleado');


create table usuario (
    idusuario int auto_increment primary key,
    username varchar(255) unique not null,
    contrasena varchar(255) not null,
    idrol int not null,
    foreign key (idrol) references rol(idrol)
);


insert into usuario (username,contrasena,idrol) 
values ('Ochoa','123',2);

insert into usuario (username,contrasena,idrol) 
values ('Fran','123',2);

insert into usuario (username,contrasena,idrol) 
values ('Will','123',2);

insert into usuario (username,contrasena,idrol) 
values ('Rafael','123',1);


create table cuarto (
    idcuarto int auto_increment primary key,
    precio decimal(10,2) not null,
    	tipo varchar(100) not null
);

insert into cuarto (tipo,precio)
 values ('individual',20.00);
 
insert into cuarto (tipo,precio) 
values ('doble',50.00);

insert into cuarto (tipo,precio) 
values ('suite',100.00);


create table cliente (
    idcliente int auto_increment primary key,
    nombre varchar(255) not null,
    email varchar(255)  not null,
    telefono varchar(50) not null
);

insert into cliente (nombre,email,telefono) 
values ('Juan','juan@gmail.com','2222-4444');

create table detallereservacion (
    iddetallereservacion int auto_increment primary key,
    idcuarto int not null, 
    cantidad int,
    total decimal(10,2) not null, 
    foreign key (idcuarto) references cuarto(idcuarto)
);

insert into detallereservacion (idcuarto, cantidad, total) values (1, 2, 40.00);


create table reservacion (
    idreserva int auto_increment primary key,
    idcliente int not null,
    fecha_nacimiento date,
    
    fecha_registro datetime,
    iddetallereservacion int,
    idusuario int not null, -- el empleado o dueño que registró la reserva
    foreign key (idcliente) references cliente(idcliente),
    foreign key (idusuario) references usuario(idusuario),
    foreign key (iddetallereservacion) references detallereservacion(iddetallereservacion)
);
insert into reservacion (iddetallereservacion, idcliente, fecha_registro, fecha_nacimiento, idusuario)
values (1, 1, localtime(), '2025-10-15', 1);

select *from reservacion;

