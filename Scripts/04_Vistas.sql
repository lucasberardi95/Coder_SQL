-- CREACION DE VIEWS:

-- 1) VISTA PARA VER MEDIOS DE CONTACTO DE LOS CLIENTES ORDENADOS POR ALFABETICAMENTE POR NOMBRE
create or replace view 
vw_clientes_contacto as 
(
select nombre, apellido, email, telefono
from clientes
order by nombre asc
);

-- 2) VISTA PARA VER DATOS DEL CLIENTE Y DE SU CUENTA 
create or replace view 
vw_clientes_cuentas as 
(
select clientes.id_cliente, nombre, apellido, nro_cuenta, tipo_cuenta, saldo
from clientes 
join cuentas on clientes.id_cliente = cuentas.id_cliente
);

-- 3) VISTA PARA VER SALDOS DE CUENTA Y TARJETA DE CADA CLIENTE
create or replace view 
vw_clientes_saldos as 
(
select clientes.id_cliente, nombre, apellido, nro_cuenta, tipo_cuenta, cuentas.saldo as saldo_cuenta, tarjetas.saldo as saldo_tarjeta
from clientes 
join cuentas on clientes.id_cliente = cuentas.id_cliente
join tarjetas on clientes.id_cliente = tarjetas.id_cliente
);

-- 4) VISTA QUE MUESTRA NOMBRE Y APELLIDO DEL CLIENTE JUNTO CON LA CANTIDAD DE TRANSACCIONES REALIZADAS POR CADA UNO ORDENADAS DE MAYOR A MENOR 

-- ACTUALIZO ALGUNOS DATOS EN LA TABLA ID_TARJETA PARA CORROBORAR QUE FUNCIONE BIEN LA VISTA NRO 4
update transacciones
set id_tarjeta = 1
where cod_operacion = 'OP002';

update transacciones
set id_tarjeta = 1
where cod_operacion = 'OP003';

create or replace view 
vw_clientes_cantidad_transacciones as
(
select nombre, apellido, count(tarjetas.id_tarjeta) as cantidad_transacciones
from clientes
join tarjetas on clientes.id_cliente = tarjetas.id_cliente
join transacciones on tarjetas.id_tarjeta = transacciones.id_tarjeta
group by clientes.id_cliente, nombre, apellido
order by cantidad_transacciones desc
);

-- 5) VISTA DONDE SE MUESTRAN LA CANTIDAD DE TRANSACCIONES POR TIPO DE OPERACION REALIZADA, ORDENADOS DE MAYOR A MENOR

create or replace view 
vw_cantidad_tipo_operaciones as
(
select tipo_operacion, count(*) as cantidad_transacciones
from operaciones o 
join transacciones t on t.cod_operacion = o.cod_operacion
group by tipo_operacion
order by cantidad_transacciones desc
);