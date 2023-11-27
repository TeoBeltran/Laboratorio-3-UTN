/*
Parte 2 - Vistas y procedimientos almacenados

Procedimientos almacenados

Realizar los siguientes procedimientos almacenados:

A) Realizar un procedimiento almacenado llamado sp_Agregar_Usuario que permita registrar un usuario en el sistema. El procedimiento debe recibir como parametro DNI, Apellido, Nombre, Fecha de nacimiento y los datos del domicilio del usuario.

B) Realizar un procedimiento almacenado llamado sp_Agregar_Tarjeta que de de alta una tarjeta. El procedimiento solo debe recibir el DNI del usuario.
Como el sistema solo permite una tarjeta activa por usuario, el procedimiento debe:
Dar de baja la ultima tarjeta del usuario (si corresponde).
Dar de alta la nueva tarjeta del usuario
Traspasar el saldo de la vieja tarjeta a la nueva tarjeta (si corresponde)

C) Realizar un procedimiento almacenado llamado sp_Agregar_Viaje que registre un viaje a una tarjeta en particular. El procedimiento debe recibir: Numero de tarjeta, importe del viaje, nro de interno y nro de linea.
El procedimiento debera:
Descontar el saldo
Registrar el viaje
Registrar el movimiento de debito

NOTA: Una tarjeta no puede tener una deuda que supere los $2000.

D) Realizar un procedimiento almacenado llamado sp_Agregar_Saldo que registre un movimiento de credito a una tarjeta en particular. El procedimiento debe recibir: El numero de tarjeta y el importe a recargar. Modificar el saldo de la tarjeta.

E) Realizar un procedimiento almacenado llamado sp_Baja_Fisica_Usuario que elimine un usuario del sistema. La eliminacion debera ser 'en cascada'. Esto quiere decir que para cada usuario primero deberan eliminarse todos los viajes y recargas de sus respectivas tarjetas. Luego, todas sus tarjetas y por ultimo su registro de usuario.
*/