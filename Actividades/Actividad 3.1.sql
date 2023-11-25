/*
Parte 1 - Repaso Normalización

Realizar la normalización, creación de tablas, relaciones y restricciones a partir del siguiente enunciado.

El Sistema Único de Boleto Electrónico (SUBE) desea realizar la base de datos que permitirá a sus usuarios utilizar el sistema.
La forma de pago en los colectivos se realiza mediante una tarjeta magnética que contiene el saldo de la misma, cuando se paga el ticket automáticamente se registra la información en la base de datos centralizada, por lo que, tarjeta y sistema tienen exactamente la misma información de manera sincrónica. Esto quiere decir que este sistema y todas sus terminales están constantemente en línea siendo así extremadamente eficiente y ficticio.

Se solicita desarrollar la base de datos que permitirá almacenar la información y, en una próxima etapa, desarrollarle módulos que permitan garantizar la consistencia de la misma.

Se deberán registrar los usuarios que utilizarán las tarjetas. De cada usuario se debe poder obtener: el Apellido, nombre, número de DNI, fecha de su primera tarjeta SUBE, saldo de su última tarjeta SUBE, cantidad de viajes realizados, domicilio y edad.

Las tarjetas, necesarias para poder realizar cualquier viaje, registran la siguiente información: Número identificatorio de tarjeta, Apellido y nombre del usuario, número de DNI,  fecha de alta de la tarjeta SUBE y saldo.

Otro elemento que se registra son los viajes. Cada viaje debe tiene: un código único de viaje, una fecha y hora de viaje, el número de interno del colectivo, la línea de colectivo, el número de tarjeta SUBE que abona el viaje, el importe del ticket y el usuario que viaja.

Para esto también es necesario almacenar las líneas de colectivos, cada línea registra el código de línea, el nombre de la empresa y el domicilio legal.

Por último, otro elemento a registrar en la base de datos son los movimientos que sufren las tarjetas. Es decir, todos los débitos y créditos que se le practican. Para cada movimiento se registra: número de movimiento, fecha y hora, número de tarjeta SUBE, importe, tipo de movimiento ('C' - Crédito y 'D' - Débito).



Atención:

Las entidades de usuario y tarjeta deberán contener un campo estado para poder realizar baja lógica.


Parte 2 - Vistas y procedimientos almacenados

Vistas

Realizar las siguientes vistas:

A) Realizar una vista que permita conocer los datos de los usuarios y sus respectivas tarjetas. La misma debe contener: Apellido y nombre del usuario, número de tarjeta SUBE, estado de la tarjeta y saldo.

B) Realizar una vista que permita conocer los datos de los usuarios y sus respectivos viajes. La misma debe contener: Apellido y nombre del usuario, número de tarjeta SUBE, fecha del viaje, importe del viaje, número de interno y nombre de la línea.

C) Realizar una vista que permita conocer los datos estadísticos de cada tarjeta. La misma debe contener: Apellido y nombre del usuario, número de tarjeta SUBE, cantidad de viajes realizados, total de dinero acreditado (históricamente), cantidad de recargas, importe de recarga promedio (en pesos), estado de la tarjeta.
*/