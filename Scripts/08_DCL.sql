-- CREACION DE USUARIOS CON DIFERENTES PERMISOS:

use mysql;
select * from mysql.user;

-- USER 1: SOLO TENDRA PERMISOS DE LECTURA SOBRE TODAS LAS TABLAS
create user if not exists 'user1'@'localhost' identified by 'password1'; 
-- USER 2: TENDRA PERMISOS DE LECTURA, INSERSION Y MODIFICACION SOBRE TODAS LAS TABLAS
create user if not exists 'user2'@'localhost' identified by 'password2';

-- OTORGANDO PERMISOS:
-- USER 1:
grant select on bancolb.* to 'user1'@'localhost';
-- USER 2:
grant select, insert, update on bancolb.* to 'user2'@'localhost';