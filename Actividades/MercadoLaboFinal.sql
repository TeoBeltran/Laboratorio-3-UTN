
Create Database MercadoLabo
Go
Use MercadoLabo
Go
Create Table Provincias(
    ID_Provincia tinyint not null primary key identity (1,1),
    Provincia varchar(50) not null
)
Go
Create Table Localidades(
    ID_Localidad int not null primary key identity (1, 1),
    ID_Provincia tinyint not null foreign key references Provincias (ID_Provincia),
    Localidad varchar(200) not null
)
Go
Create Table Bancos(
    ID_Banco smallint not null primary key identity (1, 1),
    Nombre varchar(100) not null
)
Go
Create Table NivelesSituacionCrediticia(
    ID_NivelesSituacionCrediticia tinyint not null primary key identity (1, 1),
    SituacionCrediticia varchar(50) not null
)
Go
Create Table MarcasTarjeta(
    ID_MarcaTarjeta tinyint not null primary key identity (1, 1),
    Marca varchar(100) not null
)
Go
Create Table Usuarios(
    ID_Usuario bigint not null primary key identity (1, 1),
    DNI varchar(10) not null unique,
    Apellidos varchar(200) not null,
    Nombres varchar(200) not null,
    FechaNacimiento date not null check (FechaNacimiento <= getdate()),
    Genero char null,
    ID_NivelesSituacionCrediticia tinyint foreign key references NivelesSituacionCrediticia(ID_NivelesSituacionCrediticia),
    Telefono varchar (20) null,
    Celular varchar (20) null,
    Mail  varchar (250) null unique,
    Domicilio varchar (500) not null,
    ID_Localidad int not null foreign key references Localidades(ID_Localidad)
)
Go
Create Table Billeteras(
    ID_Billetera bigint not null primary key identity (10001, 1),
    ID_Usuario bigint not null unique foreign key references Usuarios(ID_Usuario),
    Alias varchar (30) not null unique,
    FechaCreacion date not null,
    Saldo money not null default (0)
)
Go
Create Table Tarjetas(
    ID_Tarjeta bigint not null primary key identity (1, 1),
    ID_Billetera bigint not null foreign key references Billeteras(ID_Billetera),
    ID_MarcaTarjeta tinyint not null foreign key references MarcasTarjeta(ID_MarcaTarjeta),
    ID_Banco smallint not null foreign key references Bancos(ID_Banco),
    Numero varchar (16) not null unique check(LEN(RTrim(LTrim(Numero))) = 16),
    FechaEmision date not null,
    FechaVencimiento date not null,
    CodigoSeguridad varchar (4) not null,
    check (FechaEmision < FechaVencimiento)
)
Go
Create Table Movimientos(
    ID_Movimiento bigint not null primary key identity (1, 1),
    ID_Billetera bigint not null foreign key references Billeteras(ID_Billetera),
    FechaHora datetime not null,
    Importe money not null check (Importe > 0),
    TipoMovimiento char not null check (TipoMovimiento in ('D', 'C')),
    Estado bit not null default (1)
)
Go
Create Table Transferencias(
    ID_Transferencia bigint not null primary key identity (1, 1),
    ID_BilleteraOrigen bigint not null foreign key references Billeteras(ID_Billetera),
    ID_BilleteraDestino bigint not null foreign key references Billeteras(ID_Billetera),
    FechaHora datetime not null,
    Importe money not null check (Importe > 0),
    Estado bit not null default(1)
)

Go
-- Script que agrega el límite a la tabla de Tarjetas
Alter Table Tarjetas
Add Limite money not null default (0)
Go
-- Inventar límites para cada tarjeta
Update Tarjetas Set Limite = ID_Tarjeta * 100000

