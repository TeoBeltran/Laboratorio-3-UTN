/*
Parte 1 - Repaso Normalizacion
Realizar la normalizacion, creacion de tablas, relaciones y restricciones a partir del siguiente enunciado.

El Sistema Unico de Boleto Electronico (SUBE) desea realizar la base de datos que permitira a sus usuarios utilizar el sistema.
La forma de pago en los colectivos se realiza mediante una tarjeta magnetica que contiene el saldo de la misma, 
cuando se paga el ticket automaticamente se registra la informacion en la base de datos centralizada, por lo que, 
tarjeta y sistema tienen exactamente la misma informacion de manera sincronica. 
Esto quiere decir que este sistema y todas sus terminales estan constantemente en linea siendo asi extremadamente eficiente y ficticio.

Se solicita desarrollar la base de datos que permitira almacenar la informacion y, en una proxima etapa, 
desarrollarle modulos que permitan garantizar la consistencia de la misma.

Se deberan registrar los usuarios que utilizaran las tarjetas. De cada usuario se debe poder obtener: el Apellido, nombre, numero de DNI, 
fecha de su primera tarjeta SUBE, saldo de su ultima tarjeta SUBE, cantidad de viajes realizados, domicilio y edad.

Las tarjetas, necesarias para poder realizar cualquier viaje, registran la siguiente informacion: Numero identificatorio de tarjeta, 
Apellido y nombre del usuario, numero de DNI,  fecha de alta de la tarjeta SUBE y saldo.

Otro elemento que se registra son los viajes. Cada viaje debe tiene: un codigo unico de viaje, una fecha y hora de viaje, 
el numero de interno del colectivo, la linea de colectivo, el numero de tarjeta SUBE que abona el viaje, el importe del ticket y el usuario que viaja.

Para esto tambien es necesario almacenar las lineas de colectivos, cada linea registra el codigo de linea, 
el nombre de la empresa y el domicilio legal.

Por ultimo, otro elemento a registrar en la base de datos son los movimientos que sufren las tarjetas. 
Es decir, todos los debitos y creditos que se le practican. Para cada movimiento se registra: numero de movimiento, 
fecha y hora, numero de tarjeta SUBE, importe, tipo de movimiento ('C' - Credito y 'D' - Debito).

Atencion:
Las entidades de usuario y tarjeta deberan contener un campo estado para poder realizar baja logica.
*/

Create Database SUBE
Go
Use SUBE
Go

Create Table Usuario(
    ID_Usuario int primary key identity (1, 1),
    Apellido varchar(255) not null,
    Nombre varchar(255) not null,
    DNI varchar(20) not null unique,
    PrimeraTarjeta date not null,
    SaldoUltimaTarjeta decimal(10, 2) not null,
    CantidadViajes int,
    Domicilio varchar(255),
    Edad int,
    Estado bit
);
Go

Create Table Tarjeta(
    ID_Tarjeta int primary key identity (1, 1),
    ID_Usuario int not null foreign key references Usuario(ID_Usuario),
    FechaAlta DATE not null,
    Saldo decimal(10, 2) not null,
    Estado bit
);
Go

Create Table LineaColectivo(
    ID_Linea int primary key identity (1, 1),
    Nombre varchar(255) not null unique,
    Domicilio varchar(255) not null
);
Go

Create Table Viajes(
    ID_Viaje int primary key identity (1, 1),
    FechaHora Datetime not null,
    NumColectivo int not null,
    LineaColectivo int not null foreign key references LineaColectivo(ID_Linea),
    ID_Tarjeta int not null foreign key references Tarjeta(ID_Tarjeta),
    Importe Money not null check (Importe > 0),
    ID_Usuario int not null foreign key references Usuario(ID_Usuario)
);
Go

Create Table Movimientos(
    ID_Movimiento int primary key identity (1, 1),
    FechaHora Datetime not null,
    ID_Tarjeta int not null foreign key references Tarjeta(ID_Tarjeta),
    Importe Money not null check (Importe > 0),
    TipoMov char not null check (TipoMov in ('D', 'C'))
);



---------------------------------------------

/*
Parte 2 - Vistas y procedimientos almacenados

Vistas

Realizar las siguientes vistas:

A) Realizar una vista que permita conocer los datos de los usuarios y sus respectivas tarjetas. 
La misma debe contener: Apellido y nombre del usuario, numero de tarjeta SUBE, estado de la tarjeta y saldo.

B) Realizar una vista que permita conocer los datos de los usuarios y sus respectivos viajes. 
La misma debe contener: Apellido y nombre del usuario, numero de tarjeta SUBE, fecha del viaje, importe del viaje, numero de interno y nombre de la linea.

C) Realizar una vista que permita conocer los datos estadisticos de cada tarjeta. La misma debe 
contener: Apellido y nombre del usuario, numero de tarjeta SUBE, cantidad de viajes realizados, 
total de dinero acreditado (historicamente), cantidad de recargas, importe de recarga promedio (en pesos), estado de la tarjeta.
*/



--A
Use SUBE
Go
Create View UsuariosTarjeta As
Select U.Apellido, U.Nombre, T.ID_Tarjeta As Tarjeta, T.Estado As EstadoTarj, T.Saldo From Usuario U Inner Join Tarjeta T On U.ID_Usuario = T.ID_Usuario;
Go
Select * From UsuariosTarjeta
Go

--B

Create View DatosUsuario As
Select U.Apellido, U.Nombre As NombreUsuario, T.ID_Tarjeta As nTarjeta, V.FechaHora As FechaViaje, V.Importe As ImporteViaje, V.NumColectivo As NumeroInterno, LC.Nombre As Linea From Usuario U
Inner Join Tarjeta T On U.ID_Usuario = T.ID_Usuario Inner Join Viajes V On T.ID_Tarjeta = V.ID_Tarjeta Inner Join LineaColectivo LC On V.LineaColectivo = LC.ID_Linea;
Go
Select* From DatosUsuario
Go

--C
Create View EstadisticasTarjeta As
Select U.Apellido, U.Nombre As NombreUsuario, T.ID_Tarjeta As Tarjeta, ISNULL(Count(V.ID_Viaje), 0) As Viajes, ISNULL(SUM(V.Importe), 0) As GastoTotal, ISNULL(Count(M.ID_Movimiento), 0) As Recargas, 
Case When Count(M.ID_Movimiento) > 0 Then ISNULL(SUM(M.Importe) / Count(M.ID_Movimiento), 0) Else 0 End As RecargaPromedio, T.Estado AS Estado From Usuario U
Inner Join Tarjeta T On U.ID_Usuario = T.ID_Usuario Left Join Viajes V On T.ID_Tarjeta = V.ID_Tarjeta Left Join Movimientos M On T.ID_Tarjeta = M.ID_Tarjeta And M.TipoMov = 'C'
Group By U.Apellido, U.nombre, T.ID_Tarjeta, T.Estado;
Go
Select * From EstadisticasTarjeta

