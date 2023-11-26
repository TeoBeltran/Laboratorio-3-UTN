/* Actividades

1 - Apellidos y nombres, alias, fecha de creación y saldo de aquellas cuentas que tengan un saldo mayor al saldo promedio.
2 - Marca de las tarjetas y límite de compras de aquellas tarjetas que tengan un límite mayor al de cualquier tarjeta del 'Banco Santander Rio'
3 - Marca de las tarjetas y límite de compras de aquellas tarjetas que tengan un límite mayor al de alguna tarjeta del 'Banco HSBC'
4 - Los apellidos y nombres y alias de las billeteras que no hayan registrado movimientos en la segunda quincena de Agosto de 2023.
5 - Los apellidos y nombres de clientes que no tengan registrada ninguna tarjeta de la marca 'Zelev'
6 - Los nombres de bancos que no hayan entregado tarjetas a ningún cliente con nivel de situación crediticia Mala, Muy Mala o No Confiable.
7 - Por cada marca de tarjeta listar el nombre, la cantidad de clientes con situación crediticia favorable (de Excelente a Buena) y situación crediticia desfavorable (de Regular a No Confiable)
8 - Por cada billetera, listar el alias y la cantidad total de dinero operado en el mes de agosto de 2023 y la cantidad total de dinero operado en el mes de septiembre de 2023. Si no registró movimientos debe totalizar 0.
9 - El banco decidió cobrar en el mes de Agosto el monto de $50 a cada movimiento de débito realizado en un fin de semana y $10 a los movimientos de crédito realizados. Listar para cada billetera, el alias y la cantidad a abonar por este disparatado recargo. Si no registra recargos debe totalizar 0.
    NOTA: Sólo aplica a los movimientos registrados en el mes de Agosto de 2023.
10 - El total acumulado en concepto de recargo (ver Punto 9)
11 - Las marcas de tarjeta que hayan otorgado igual cantidad de tarjetas a clientes con situación crediticia favorable que a clientes con situación crediticia desfavorable.
12 - La cantidad de marcas de tarjeta que hayan otorgado más del doble de cantidad de tarjetas a clientes con situación crediticia favorable que a clientes con situación crediticia desfavorable.
13 - Las billeteras que hayan operado, en total, más dinero en agosto que en septiembre de 2023.
14 - La cantidad de billeteras que hayan operado en Agosto pero no en Septiembre.
15 - Las billeteras que pagaron más de $100 en total en concepto de recargo (Ver Punto 9)
*/

Use MercadoLabo
Go
Select U.Apellidos, U.Nombres, B.Alias, B.FechaCreacion, B.Saldo From Usuarios U 
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario
Where B.Saldo > (Select AVG(Saldo) From Billeteras);
Go
Select MT.Marca, T.Limite From Tarjetas T
Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta
Where T.Limite > (Select MAX(T.Limite) From Tarjetas T
Inner Join Bancos B On T.ID_Banco = B.ID_Banco Where B.Nombre = 'Banco Santander Rio');
Go
Select MT.Marca, T.Limite From Tarjetas T
Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta
Where T.Limite > (Select MAX(T.Limite) From Tarjetas T
Inner Join Bancos B On T.ID_Banco = B.ID_Banco Where B.Nombre = 'Banco HSBC');
Go
Select U.Apellidos, U.Nombres, B.Alias From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario
Where B.ID_Billetera Not In (Select ID_Billetera From Movimientos Where FechaHora Between '2023-08-16' And '2023-08-31')
Go
Select Distinct U.Apellidos, U.Nombres, MT.Marca, U.ID_Usuario From Usuarios U 
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Tarjetas T On B.ID_Billetera = T.ID_Billetera 
Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta 
Where MT.Marca <> 'Zelev'
--Order By U.ID_Usuario
--Where T.ID_Tarjeta <> 9;
Go
Select Distinct U.Apellidos, U.Nombres From Usuarios U 
Where U.ID_Usuario Not In (
    Select Distinct U2.ID_Usuario From Usuarios U2
    Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Tarjetas T On B.ID_Billetera = T.ID_Billetera 
    Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta 
    Where MT.Marca Like 'Zelev'
)
Go





/*
6 - Los nombres de bancos que no hayan entregado tarjetas a ningún cliente con nivel de situación crediticia Mala, Muy Mala o No Confiable.
7 - Por cada marca de tarjeta listar el nombre, la cantidad de clientes con situación crediticia favorable (de Excelente a Buena) y situación crediticia desfavorable (de Regular a No Confiable)
8 - Por cada billetera, listar el alias y la cantidad total de dinero operado en el mes de agosto de 2023 y la cantidad total de dinero operado en el mes de septiembre de 2023. Si no registró movimientos debe totalizar 0.
9 - El banco decidió cobrar en el mes de Agosto el monto de $50 a cada movimiento de débito realizado en un fin de semana y $10 a los movimientos de crédito realizados. Listar para cada billetera, el alias y la cantidad a abonar por este disparatado recargo. Si no registra recargos debe totalizar 0.
    NOTA: Sólo aplica a los movimientos registrados en el mes de Agosto de 2023.
10 - El total acumulado en concepto de recargo (ver Punto 9)
11 - Las marcas de tarjeta que hayan otorgado igual cantidad de tarjetas a clientes con situación crediticia favorable que a clientes con situación crediticia desfavorable.
12 - La cantidad de marcas de tarjeta que hayan otorgado más del doble de cantidad de tarjetas a clientes con situación crediticia favorable que a clientes con situación crediticia desfavorable.
13 - Las billeteras que hayan operado, en total, más dinero en agosto que en septiembre de 2023.
14 - La cantidad de billeteras que hayan operado en Agosto pero no en Septiembre.
15 - Las billeteras que pagaron más de $100 en total en concepto de recargo (Ver Punto 9)
*/