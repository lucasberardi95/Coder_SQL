-- CREACION DE STORED PROCEDURES:

-- 1) SP PARA INDICAR ORDENAMIENTO DE UNA TABLA ELIGIENDO UNA COLUMNA Y ORDEN ASC O DESC

drop procedure if exists sp_ordenar;
delimiter //
create procedure sp_ordenar( in p_columna varchar(50), in p_orden char(4) ) 
begin
    -- Variable para almacenar la consulta dinámica
    set @query = concat('select * from clientes order by ', p_columna, ' ', p_orden);
    -- Preparar la consulta dinámica
    prepare stmt from @query;
    -- Ejecutar la consulta dinámica
    execute stmt;
    -- Liberar los recursos asociados con la consulta preparada
    deallocate prepare stmt;
end //
delimiter ;

call sp_ordenar('nombre', 'asc'); 
call sp_ordenar('apellido', 'desc');  

-- 2) SP PARA INSERTAR O ELIMINAR UN REGISTRO EN LA TABLA CLIENTES

drop procedure if exists sp_insertar_o_eliminar;
delimiter //
create procedure sp_insertar_o_eliminar( in p_id_cliente int,
										 in p_nombre varchar(45),
										 in p_apellido varchar(45),
                                         in p_dni varchar(15),
                                         in p_email varchar(45),
                                         in p_telefono varchar(15),
                                         in p_fecha_amb timestamp ) 
begin
	-- Declarar una variable para almacenar la existencia del id_cliente
	declare v_exist int;
	-- Verificar si el id_cliente existe en la tabla
	select count(*) into v_exist
	from clientes
	where id_cliente = p_id_cliente;
	-- Si el id_cliente existe, eliminar el registro
	if v_exist > 0 then
		delete from clientes
		where id_cliente = p_id_cliente;
	else
		-- Si el id_cliente no existe, insertar un nuevo registro sin el ID (autoincrement)
        insert into clientes (nombre, apellido, dni, email, telefono, fecha_amb)
        values (p_nombre, p_apellido, p_dni, p_email, p_telefono, p_fecha_amb);
	end if;
end //
delimiter ; 

-- Caso 1: Agrego un cliente en caso de que no exista
call sp_insertar_o_eliminar(16, 'Lionel', 'Messi', '10101010', 'lionelmessi@gmail.com', '01110101010', '2024-05-21 10:00:00');

-- Caso 2: Se elimina el cliente en caso de que exista
call sp_insertar_o_eliminar(16, 'Lionel', 'Messi', '10101010', 'lionelmessi@gmail.com', '01110101010', '2024-05-21 10:00:00');