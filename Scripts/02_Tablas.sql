-- TABLA MADRE DONDE SE REGISTRAN LOS DATOS DE LOS AFILIADOS
drop table if  exists clientes;
create table if not exists clientes(
	id_cliente int auto_increment,
	nombre varchar(45) not null,
	apellido varchar(45) not null,
	dni varchar(15) not null,
	email varchar(45) not null,
	telefono varchar(15) not null,
    fecha_amb timestamp, -- fecha de alta, modificacion y baja
	primary key(id_cliente)
);

-- TABLA DONDE SE REGISTRAN DATOS SOBRE LAS CUENTAS DE LOS AFILIADOS
drop table if  exists cuentas;
create table if not exists cuentas(
	id_cuenta int auto_increment,
	nro_cuenta varchar(45) not null unique,
	tipo_cuenta varchar(45) not null,
	saldo decimal(10, 2),
	id_cliente int,
	primary key(id_cuenta),
	foreign key(id_cliente) references clientes(id_cliente)
);

-- TABLA DONDE SE REGISTRAN DATOS DE LA O LAS TRAJETAS QUE POSEEN LOS AFILIADOS
drop table if  exists tarjetas;
create table if not exists tarjetas(
	id_tarjeta int auto_increment,
	nro_tarjeta varchar(45) not null unique,
	saldo decimal(10, 2),
	fecha_caducidad date,
	id_cliente int,
	primary key(id_tarjeta),
	foreign key(id_cliente) references clientes(id_cliente)
);

-- TABLA DONDE SE REGISTRAN LAS TRANSACCIONES DE LOS AFILIADOS
drop table if  exists transacciones;
create table if not exists transacciones(
	cod_operacion varchar(45) not null, -- cod (codigo)
	nro_tarjeta varchar(45) not null,
	monto decimal(10,2),
	fecha_operacion timestamp,
	id_tarjeta int,
	primary key(cod_operacion),
	foreign key(id_tarjeta) references tarjetas(id_tarjeta)
);

-- TABLA DONDE SE DETALLAN LAS TRANSACCIONES
drop table if  exists operaciones;
create table if not exists operaciones(
	id_operacion int auto_increment,
	tipo_operacion varchar(45) not null,
	descripcion text not null,
	cod_operacion varchar(45) not null,
	primary key(id_operacion),
	foreign key(cod_operacion) references transacciones(cod_operacion)
);

-- TABLA DONDE SE REGISTRAN LOS DATOS DE LOS EMPLEADOS
drop table if  exists empleados;
create table if not exists empleados(
	id_empleado int auto_increment,
	nombre varchar(45) not null,
	apellido varchar(45) not null,
	dni varchar(15) not null,
	email varchar(45) not null,
	telefono varchar(15) not null,
	primary key(id_empleado)
);

-- TABLA DONDE SE REGISTRAN LOS DATOS RELACIONADOS AL PUESTO DE TRABAJO DE LOS EMPLEADOS
drop table if  exists puestos_empleados;
create table if not exists puestos_empleados(
	id_puesto varchar(45) not null,
	tareas text,
	id_empleado int auto_increment,
	primary key(id_puesto),
	foreign key(id_empleado) references empleados(id_empleado)
);

-- TABLA DONDE SE REGISTRAN LOS HORARIOS DE TRABAJO DE LOS EMPLEADOS
drop table if exists horarios_trabajo;
create table if not exists horarios_trabajo(
    id_horario int auto_increment,
    dia_semana varchar(15) not null,
    hora_entrada time not null,
    hora_salida time not null,
    id_empleado int,
    primary key(id_horario),
    foreign key(id_empleado) references empleados(id_empleado)
);