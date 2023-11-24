/*
Actividades

1 Por cada tarjeta obtener el numero, la fecha de emision, el nombre del banco y la marca de la tarjeta. Incluir al listado la cantidad de dias restantes para el vencimiento de la tarjeta.
2 Por cada usuario indicar Apellidos, Nombres, Edad, Alias de la billetera, la antiguedad de la billetera en dias y el saldo de la misma.
3 Por cada usuario indicar Apellidos, Nombre y una categorizacion a partir del saldo de la billetera. La categorizacion es:
    'Gold' - Mas de un millon de pesos
    'Silver' - Mas de 500 mil y hasta un millon de pesos
    'Bronze' - Entre 50 mil y 500 mil
    'Copper' - Menos de 50 mil
4 Por cada usuario indicar apellidos, nombres, domicilio, nombre de la localidad y provincia.
5 Listar los usuarios con nivel de situacion crediticia Excelente y que residan en Buenos Aires.
6 Listar los nombres, apellidos y celulares de los usuarios que residan en Cordoba
7 Listar los nombres y apellidos de los clientes que no posean tarjeta
8 Listar los nombres, apellidos, alias de billetera, nombres de tarjetas y bancos de todos los usuarios. Si el usuario no tiene tarjetas debe figurar igualmente en el listado.
9 Listar nombres y apellidos del usuario que tenga la tarjeta que mas tiempo falta que llegue a su vencimiento.
10 Listar las distintas marcas de tarjeta, sin repetir, de los usuarios.
11 Listar todos los datos de los usuarios que tengan una situacion crediticia diferente de 'Excelente', 'Regular' y 'No confiable'.
*/

Use MercadoLabo
Go
Select T.Numero, T.FechaEmision, B.Nombre As Banco, M.Marca As Marca, DATEDIFF(DAY, GETDATE(), T.FechaVencimiento) AS DiasRestantesVencimiento From Tarjetas T
Inner Join Bancos B On T.ID_Banco = B.ID_Banco Inner Join MarcasTarjeta M On T.ID_MarcaTarjeta = M.ID_MarcaTarjeta;
Go
Select U.Apellidos, U.Nombres, DATEDIFF(YEAR, U.FechaNacimiento, GETDATE()) AS Edad, B.Alias As Alias, DATEDIFF(DAY, B.FechaCreacion, GETDATE()) AS AntiguedadBilleteraDias, B.Saldo AS SaldoBilletera
From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario;
Go
Select U.Apellidos, U.Nombres,
    CASE
        WHEN B.Saldo > 1000000 THEN 'Gold'
        WHEN B.Saldo > 500000 THEN 'Silver'
        WHEN B.Saldo >= 50000 THEN 'Bronze'
        ELSE 'Copper'
    END AS CategoriaSaldo
From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario;
Go
Select U.Apellidos, U.Nombres, U.Domicilio, L.Localidad As Localidad, P.Provincia As Provincia From Usuarios U
Inner Join Localidades L On U.ID_Localidad = L.ID_Localidad Inner Join Provincias P On L.ID_Provincia = P.ID_Provincia;
Go
Select U.Apellidos, U.Nombres From Usuarios U Inner Join NivelesSituacionCrediticia NSC On U.ID_NivelesSituacionCrediticia = NSC.ID_NivelesSituacionCrediticia
Inner Join Localidades L On U.ID_Localidad = L.ID_Localidad Inner Join Provincias P On L.ID_Provincia = P.ID_Provincia Where NSC.SituacionCrediticia = 'Excelente' and P.Provincia = 'Buenos Aires';
Go
Select U.Nombres, U.Apellidos, U.Celular From Usuarios U
Inner Join Localidades L On U.ID_Localidad = L.ID_Localidad Inner Join Provincias P On L.ID_Provincia = P.ID_Provincia Where P.Provincia = 'Cordoba';
Go
Select U.Nombres, U.Apellidos From Usuarios U Left Join Billeteras B On U.ID_Usuario = B.ID_Usuario Left Join Tarjetas T On B.ID_Billetera = T.ID_Billetera Where T.ID_Tarjeta is null;
Go
Select U.Nombres, U.Apellidos, B.Alias As Alias, M.Marca As Marca, Bn.Nombre As Banco From Usuarios U
Left Join Billeteras B On U.ID_Usuario = B.ID_Usuario
Left Join Tarjetas T On B.ID_Billetera = T.ID_Billetera Left Join MarcasTarjeta M On T.ID_MarcaTarjeta = M.ID_MarcaTarjeta Left Join Bancos Bn On T.ID_Banco = Bn.ID_Banco;
Go
Select U.Nombres, U.Apellidos From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Tarjetas T On B.ID_Billetera = T.ID_Billetera
Where T.FechaVencimiento = (Select Top 1 FechaVencimiento From Tarjetas Order By FechaVencimiento Desc);
Go
Select Distinct MT.Marca From Usuarios U Join Billeteras B On U.ID_Usuario = B.ID_Usuario Join Tarjetas T On B.ID_Billetera = T.ID_Billetera Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta;
Go
Select * From Usuarios U Inner Join NivelesSituacionCrediticia NSC On U.ID_NivelesSituacionCrediticia = NSC.ID_NivelesSituacionCrediticia 
Where SituacionCrediticia = 'Excelente' Or SituacionCrediticia = 'Regular' Or SituacionCrediticia = 'No Confiable';
