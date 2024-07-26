-- IMPLEMENTACION DE TCL:
-- UTILIZANDO TABLAS BKP PARA NO ROMPER LA DB

-- DESACTIVANDO VARIABLES PARA QUE NO SE AUTOMATICEN LOS CAMBIOS NI MOLESTEN LAS CONSTRAINT
set @@autocommit = 0;
set @@foreign_key_checks = 0;
-- CORROBORO QUE LOS VALORES SEAN IGUAL A 0
select @@autocommit;
select @@foreign_key_checks;

-- INICIANDO TCL + DML
start transaction;
delete from bkp_clientes
where id_cliente in(16, 17);
-- rollback;
-- commit;

-- REINSERTANDO LOS DATOS
start transaction;
insert into bkp_clientes 
values (16, 'Willem', 'Hhz', '99999999' , 'hhz@gmail.com', '1233211232', '2020-04-04'); 

insert into bkp_clientes 
values (17, 'lucas', 'nicolas', '99998888' , 'LN@gmail.com', '1234876534', '2020-05-01'); 

-- commit;

drop table if exists bkp_empleados;
create table if not exists bkp_empleados(
select * from empleados
where 1 = 1);

-- INSERT PARA TABLA 2
start transaction;
insert into empleados (nombre, apellido, dni, email, telefono) values
('Marta', 'Vargas', '78901235', 'martavargas@empresa.com', '01166778899'),
('Pablo', 'Jiménez', '89012346', 'pablojimenez@empresa.com', '01177889900'),
('Clara', 'Morales', '90123457', 'claramorales@empresa.com', '01188990011'),
('Hugo', 'Ramírez', '01234568', 'hugoramirez@empresa.com', '01199001122');
savepoint sv1;
insert into empleados (nombre, apellido, dni, email, telefono) values
('Elena', 'Torres', '12345679', 'elenatorres@empresa.com', '01100112233'),
('Nicolás', 'Ortiz', '23456781', 'nicolasortiz@empresa.com', '01111223344'),
('Lucía', 'Castro', '34567891', 'luciacastro@empresa.com', '01122334455'),
('Mateo', 'Silva', '45678902', 'mateosilva@empresa.com', '01133445566');
savepoint sv2;
-- release savepoint sv1;