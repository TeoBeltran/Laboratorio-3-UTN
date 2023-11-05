/*
Actividad 1.2: Normalizacion y creacion de tablas por codigo

Realizar la normalizacion y posterior creacion de tablas y restricciones a partir del siguiente enunciado.

MercadoLabo ya ha estado funcionando en su version de prototipo y ha podido registrar toda la informacion de la version 1.1 a la perfeccion.
Ahora se desea poder registrar los movimientos y transferencias entre billeteras. Cada movimiento debe tener un ID unico autogenerado,  
    la billetera a la que pertenece el movimiento y el momento en que fue realizado. Es importante conocer tambien el horario en que fue realizado el movimiento.
Por supuesto, se debe poder registrar el importe. Este se guardara siempre con su valor absoluto. Para saber si el mismo debe impactar positiva o 
    negativamente en la billetera se guardara un TipoMovimiento que sera C para credito y D para debito. Los movimientos podran depurarse por lo que deben contar con un estado.
Mismo concepto de depuracion se utilizara para las transferencias. Las mismas moveran dinero de una cuenta a otra.
Se debe poder conocer la billetera de origen y de destino asi como el importe de la transferencia. Tambien es necesario poder registrar cuando se realizo la transferencia.
Es importante validar que tanto las transferencias como los movimientos no registren un importe igual o menor a 0.
Tambien, se debe verificar que la transferencia no tenga como Origen y Destino la misma billetera.
*/


Use MercadoLabo
Go
CREATE TABLE Movimientos (
    ID_Movimiento bigint PRIMARY KEY IDENTITY(1, 1),
    ID_Billetera bigint NOT NULL,
    FechaMovimiento datetime NOT NULL,
    Importe money NOT NULL CHECK (Importe > 0),
    TipoMovimiento char(1) CHECK (TipoMovimiento IN ('C', 'D')),
    Estado varchar(20) NOT NULL,
    FOREIGN KEY (ID_Billetera) REFERENCES Billeteras (ID_Billetera)
);
CREATE TABLE Transferencias (
    ID_Transferencia bigint PRIMARY KEY IDENTITY(1, 1),
    ID_BilleteraOrigen bigint NOT NULL,
    ID_BilleteraDestino bigint NOT NULL,
    FechaTransferencia datetime NOT NULL,
    Importe money NOT NULL CHECK (Importe > 0),
    Estado varchar(20) NOT NULL,
    FOREIGN KEY (ID_BilleteraOrigen) REFERENCES Billeteras (ID_Billetera),
    FOREIGN KEY (ID_BilleteraDestino) REFERENCES Billeteras (ID_Billetera),
    CONSTRAINT CK_DistinctBilleteras CHECK (ID_BilleteraOrigen <> ID_BilleteraDestino)
);
