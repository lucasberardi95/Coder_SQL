-- CREACION DE FUNCIONES:

-- 1) FUNCION QUE RETORNA EL SALDO DE LA TARJETA DE CADA CLIENTE

drop function if exists fn_cliente_saldo_tarjeta;
delimiter $$
create function fn_cliente_saldo_tarjeta(p_id_cliente int)
returns int
deterministic
begin
	declare v_resultado decimal(10,2);
	set v_resultado = (select saldo from tarjetas where id_cliente = p_id_cliente);
	return v_resultado;
end$$
delimiter ;


select fn_cliente_saldo_tarjeta(1);
select fn_cliente_saldo_tarjeta(2);
select fn_cliente_saldo_tarjeta(3);

-- 2) FUNCION QUE RETORNA TODAS LAS TRANSACCIONES REALIZADAS POR UN CLIENTE ESPECIFICAMENTE DESDE UNA FECHA A OTRA

drop function if exists fn_total_transacciones;
delimiter $$
create function fn_total_transacciones(p_id_cliente int, p_fecha_inicio date, p_fecha_fin date)
returns int
deterministic
begin
	declare v_resultado int;
	set v_resultado =   (select count(*) 
						from transacciones 
						join tarjetas on tarjetas.id_tarjeta = transacciones.id_tarjeta
						where tarjetas.id_cliente = p_id_cliente
						and transacciones.fecha_operacion between p_fecha_inicio and p_fecha_fin);
	return v_resultado;
end$$
delimiter ;

select fn_total_transacciones(1, '2024-05-11', '2024-05-13');
select fn_total_transacciones(2, '2024-05-11', '2024-05-13');
select fn_total_transacciones(4, '2024-05-11', '2024-05-13');