-- ACLARACION: REALIZAR PRIMERO LA INSERCION DE REGISTROS PARA LA TABLA CLIENTES A PARTIR DEL ARCHIVO CLIENTES.CSV Y LUEGO LAS DEMAS

-- INSERCION DE DATOS PARA LA TABLA CUENTAS
insert into cuentas (nro_cuenta, tipo_cuenta, saldo, id_cliente) values
('1234567890','Caja de Ahorros',15000.00,1),
('2345678901','Cuenta Corriente',25000.00,2),
('3456789012','Caja de Ahorros',18000.00,3),
('4567890123','Cuenta Corriente',30000.00,4),
('5678901234','Caja de Ahorros',20000.00,5),
('6789012345','Cuenta Corriente',27000.00,6),
('7890123456','Caja de Ahorros',22000.00,7),
('8901234567','Cuenta Corriente',32000.00,8),
('9012345678','Caja de Ahorros',24000.00,9),
('1012345678','Cuenta Corriente',35000.00,10),
('1123456789','Caja de Ahorros',26000.00,11),
('1234567891','Cuenta Corriente',38000.00,12),
('2345678902','Caja de Ahorros',28000.00,13),
('3456789013','Cuenta Corriente',40000.00,14),
('4567890124','Caja de Ahorros',30000.00,15);

-- INSERCION DE DATOS PARA LA TABLA TARJETAS
insert into tarjetas (nro_tarjeta, saldo, fecha_caducidad, id_cliente) values
('1234 5678 9012 3456', 5000.00, '2025-05-31', 1),
('2345 6789 0123 4567', 8000.00, '2025-08-31', 2),
('3456 7890 1234 5678', 3000.00, '2025-10-31', 3),
('4567 8901 2345 6789', 10000.00, '2025-09-30', 4),
('5678 9012 3456 7890', 2000.00, '2025-07-31', 5),
('6789 0123 4567 8901', 6000.00, '2025-11-30', 6),
('7890 1234 5678 9012', 7500.00, '2025-12-31', 7),
('8901 2345 6789 0123', 4000.00, '2025-06-30', 8),
('9012 3456 7890 1234', 9000.00, '2025-08-31', 9),
('1012 3456 7890 1234', 5500.00, '2025-07-31', 10),
('1123 4567 8901 2345', 7000.00, '2025-09-30', 11),
('1234 5678 9012 3457', 8500.00, '2025-10-31', 12),
('2345 6789 0123 4568', 9500.00, '2025-12-31', 13),
('3456 7890 1234 5679', 4000.00, '2025-11-30', 14),
('4567 8901 2345 6780', 6200.00, '2025-06-30', 15);

-- INSERCION DE DATOS PARA LA TABLA TRANSACCIONES
insert into transacciones (cod_operacion, nro_tarjeta, monto, fecha_operacion, id_tarjeta) values
('OP001', '1234 5678 9012 3456', 150.00, '2024-05-12 09:30:00', 1),
('OP002', '2345 6789 0123 4567', 200.00, '2024-05-12 10:15:00', 2),
('OP003', '3456 7890 1234 5678', 75.50, '2024-05-12 11:00:00', 3),
('OP004', '4567 8901 2345 6789', 1000.00, '2024-05-12 12:45:00', 4),
('OP005', '5678 9012 3456 7890', 350.25, '2024-05-12 14:30:00', 5),
('OP006', '6789 0123 4567 8901', 450.75, '2024-05-12 15:45:00', 6),
('OP007', '7890 1234 5678 9012', 80.00, '2024-05-12 16:20:00', 7),
('OP008', '8901 2345 6789 0123', 275.50, '2024-05-12 17:00:00', 8),
('OP009', '9012 3456 7890 1234', 600.00, '2024-05-12 18:30:00', 9),
('OP010', '1012 3456 7890 1234', 125.50, '2024-05-12 19:15:00', 10),
('OP011', '1123 4567 8901 2345', 850.00, '2024-05-12 20:00:00', 11),
('OP012', '1234 5678 9012 3456', 275.25, '2024-05-12 21:30:00', 12),
('OP013', '2345 6789 0123 4567', 400.00, '2024-05-12 22:15:00', 13),
('OP014', '3456 7890 1234 5678', 50.00, '2024-05-12 23:00:00', 14),
('OP015', '4567 8901 2345 6789', 720.75, '2024-05-12 23:45:00', 15);

-- INSERCION DE DATOS PARA LA TABLA OPERACIONES
insert into operaciones (tipo_operacion, descripcion, cod_operacion) values
('Depósito', 'Depósito de dinero en efectivo', 'OP001'),
('Retiro', 'Retiro de dinero en cajero automático', 'OP002'),
('Transferencia', 'Transferencia a otra cuenta bancaria', 'OP003'),
('Compra', 'Compra en comercio utilizando tarjeta de débito', 'OP004'),
('Pago', 'Pago de factura de servicios', 'OP005'),
('Transferencia', 'Transferencia recibida de otra cuenta', 'OP006'),
('Depósito', 'Depósito de cheque', 'OP007'),
('Retiro', 'Retiro de dinero en ventanilla', 'OP008'),
('Compra', 'Compra en línea utilizando tarjeta de crédito', 'OP009'),
('Pago', 'Pago de cuota de préstamo', 'OP010'),
('Transferencia', 'Transferencia a cuenta de ahorros', 'OP011'),
('Compra', 'Compra en comercio utilizando tarjeta de crédito', 'OP012'),
('Pago', 'Pago de impuestos', 'OP013'),
('Transferencia', 'Transferencia internacional', 'OP014'),
('Compra', 'Compra en comercio utilizando monedero electrónico', 'OP015');

-- INSERCION DE DATOS PARA LA TABLA EMPLEADOS
insert into empleados (nombre, apellido, dni, email, telefono) values
('Luis', 'Pérez', '23456789', 'luisperez@empresa.com', '01111111111'),
('Ana', 'García', '34567890', 'anagarcia@empresa.com', '01122222222'),
('Juan', 'Martínez', '45678901', 'juanmartinez@empresa.com', '01133333333'),
('María', 'Rodríguez', '56789012', 'mariarodriguez@empresa.com', '01144444444'),
('Pedro', 'López', '67890123', 'pedrolopez@empresa.com', '01155555555'),
('Laura', 'Gómez', '78901234', 'lauragomez@empresa.com', '01166666666'),
('Carlos', 'Hernández', '89012345', 'carloshernandez@empresa.com', '01177777777'),
('Sofía', 'Díaz', '90123456', 'sofiadiaz@empresa.com', '01188888888'),
('Javier', 'Sánchez', '01234567', 'javiersanchez@empresa.com', '01199999999'),
('Gabriela', 'Martín', '12345678', 'gabrielamartin@empresa.com', '01100000000'),
('Fernando', 'Pérez', '23456780', 'fernandoperez@empresa.com', '01111223344'),
('Carolina', 'López', '34567811', 'carolinalopez@empresa.com', '01122334455'),
('Diego', 'González', '45678922', 'diegogonzalez@empresa.com', '01133445566'),
('Valentina', 'Gómez', '56789012', 'valentinagomez@empresa.com', '01144556677'),
('Lucas', 'Fernández', '67890123', 'lucasfernandez@empresa.com', '01155667788');

-- INSERCION DE DATOS PARA LA TABLA PUESTOS_TRABAJO
insert into puestos_empleados (id_puesto, tareas, id_empleado) values
('PT001', 'Administrativo', 1),
('PT002', 'Contador', 2),
('PT003', 'Recursos Humanos', 3),
('PT004', 'Ventas', 4),
('PT005', 'Marketing', 5),
('PT006', 'Desarrollador de Software', 6),
('PT007', 'Diseñador Gráfico', 7),
('PT008', 'Ingeniero de Sistemas', 8),
('PT009', 'Analista de Datos', 9),
('PT010', 'Gerente de Proyectos', 10),
('PT011', 'Abogado', 11),
('PT012', 'Asistente Administrativo', 12),
('PT013', 'Asesor de Ventas', 13),
('PT014', 'Asistente de Marketing', 14),
('PT015', 'Asistente de Recursos Humanos', 15);

-- INSERCION DE DATOS PARA LA TABLA HORARIOS_TRABAJO
insert into horarios_trabajo (dia_semana, hora_entrada, hora_salida, id_empleado) values
('Lunes', '08:00:00', '17:00:00', 1),
('Martes', '08:30:00', '17:30:00', 2),
('Miércoles', '09:00:00', '18:00:00', 3),
('Jueves', '08:00:00', '17:00:00', 4),
('Viernes', '08:30:00', '17:30:00', 5),
('Lunes', '09:00:00', '18:00:00', 6),
('Martes', '08:00:00', '17:00:00', 7),
('Miércoles', '08:30:00', '17:30:00', 8),
('Jueves', '09:00:00', '18:00:00', 9),
('Viernes', '08:00:00', '17:00:00', 10),
('Lunes', '08:30:00', '17:30:00', 11),
('Martes', '09:00:00', '18:00:00', 12),
('Miércoles', '08:00:00', '17:00:00', 13),
('Jueves', '08:30:00', '17:30:00', 14),
('Viernes', '09:00:00', '18:00:00', 15);