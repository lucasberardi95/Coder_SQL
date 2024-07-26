-- CREACION DE TRIGGERS:

-- CREACION DE BACKUP Y TABLA AUXILIAR PARA USAR LOS TRIGGERS SOBRE LAS MISMAS
drop table if exists bkp_clientes;
create table if not exists bkp_clientes (
select * from clientes
where 1=1
);


drop table if exists clientes_nuevos;
create table if not exists clientes_nuevos (
id_cliente int primary key,
nombre varchar(45),
apellido varchar(45),
dni varchar(15),
email varchar(45),
telefono varchar(15),
fecha_amb timestamp,
fecha_upd_del_ins date
); 

-- Trigger AFTER INSERT
drop trigger if exists tr_after_agregar_clientes_nuevos;
create trigger tr_after_agregar_clientes_nuevos
after insert on bkp_clientes
for each row
insert into clientes_nuevos  
values (new.id_cliente, new.nombre, new.apellido, new.dni , new.email, new.telefono, new.fecha_amb, now()); 

-- Trigger AFTER UPDATE
drop trigger if exists tr_after_update_clientes_nuevos;
create trigger tr_after_update_clientes_nuevos
after update on bkp_clientes
for each row
insert into clientes_nuevos  
values (new.id_cliente,	new.nombre, new.apellido, new.dni, new.email, new.telefono, new.fecha_amb, now())
on duplicate key update
id_cliente = values(id_cliente),
nombre = values(nombre),
apellido = values(apellido),
dni = values(dni), 
email = values(email), 
telefono = values(telefono), 
fecha_amb = values(fecha_amb); 

-- Trigger AFTER DELETE
drop trigger if exists tr_after_delete_clientes_nuevos;
create trigger tr_after_delete_clientes_nuevos
after delete on bkp_clientes
for each row
delete from clientes_nuevos 
where id_cliente = old.id_cliente;

-- Trigger BEFORE INSERT
drop trigger if exists tr_before_agregar_clientes_nuevos;
create trigger tr_before_agregar_clientes_nuevos
before insert on bkp_clientes
for each row
set new.fecha_amb = now();

-- Trigger BEFORE UPDATE
drop trigger if exists tr_before_update_clientes_nuevos;
create trigger tr_before_update_clientes_nuevos
before update on bkp_clientes
for each row
set new.fecha_amb = now();

-- Trigger BEFORE DELETE
drop trigger if exists tr_before_delete_clientes_nuevos;
create trigger tr_before_delete_clientes_nuevos
before delete on bkp_clientes
for each row
update clientes_nuevos 
set fecha_upd_del_ins = now() 
where id_cliente = old.id_cliente;

-- PRUEBA DE TRIGGER INSERT
insert into bkp_clientes 
values (16, 'Willem', 'Hhz', '99999999' , 'hhz@gmail.com', '1233211232', '2020-04-04'); 

insert into bkp_clientes 
values (17, 'lucas', 'nicolas', '99998888' , 'LN@gmail.com', '1234876534', '2020-05-01'); 

-- PRUEBA DE TRIGGER UPDATE
update bkp_clientes
set telefono = '8888888888'
where id_cliente = 16;

update bkp_clientes
set telefono = '6677667766'
where id_cliente = 17;

-- PRUEBA DE TRIGGER DELETE
delete from bkp_clientes
where id_cliente = 17;

set sql_safe_updates = 0