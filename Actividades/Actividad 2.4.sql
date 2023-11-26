Use MercadoLabo
Go
-- 1 - Apellidos y nombres, alias, fecha de creación y saldo de aquellas cuentas que tengan un saldo mayor al saldo promedio.
Select U.Apellidos, U.Nombres, B.Alias, B.FechaCreacion, B.Saldo From Usuarios U 
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario
Where B.Saldo > (Select AVG(Saldo) From Billeteras);
Go

-- 2 - Marca de las tarjetas y límite de compras de aquellas tarjetas que tengan un límite mayor al de cualquier tarjeta del 'Banco Santander Rio'
Select MT.Marca, T.Limite From Tarjetas T
Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta
Where T.Limite > (Select MAX(T.Limite) From Tarjetas T
Inner Join Bancos B On T.ID_Banco = B.ID_Banco Where B.Nombre = 'Banco Santander Rio');
Go

-- 3 - Marca de las tarjetas y límite de compras de aquellas tarjetas que tengan un límite mayor al de alguna tarjeta del 'Banco HSBC'
Select MT.Marca, T.Limite From Tarjetas T
Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta
Where T.Limite > (Select MAX(T.Limite) From Tarjetas T
Inner Join Bancos B On T.ID_Banco = B.ID_Banco Where B.Nombre = 'Banco HSBC');
Go

-- 4 - Los apellidos y nombres y alias de las billeteras que no hayan registrado movimientos en la segunda quincena de Agosto de 2023.
Select U.Apellidos, U.Nombres, B.Alias From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario
Where B.ID_Billetera Not In (Select ID_Billetera From Movimientos Where FechaHora Between '2023-08-16' And '2023-08-31');
Go

-- 5 - Los apellidos y nombres de clientes que no tengan registrada ninguna tarjeta de la marca 'Zelev'
Select Distinct U.Apellidos, U.Nombres From Usuarios U 
Where U.ID_Usuario Not In (
    Select Distinct U2.ID_Usuario From Usuarios U2
    Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Tarjetas T On B.ID_Billetera = T.ID_Billetera 
    Inner Join MarcasTarjeta MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta 
    Where MT.Marca Like 'Zelev'
);
Go

-- 6 - Los nombres de bancos que no hayan entregado tarjetas a ningún cliente con nivel de situación crediticia Mala, Muy Mala o No Confiable.
Select B.Nombre From Bancos B 
Where ID_Banco Not In (
    Select Distinct T.ID_Banco From Tarjetas T
    Inner Join Billeteras B On T.ID_Billetera = B.ID_Billetera
    Inner Join Usuarios U On B.ID_Usuario = U.ID_Usuario
    Inner Join NivelesSituacionCrediticia NSC On U.ID_NivelesSituacionCrediticia = NSC.ID_NivelesSituacionCrediticia
    Where NSC.SituacionCrediticia In ('Mala', 'Muy Mala', 'No Confiable')
);
Go

-- 7 - Por cada marca de tarjeta listar el nombre, la cantidad de clientes con situación crediticia favorable (de Excelente a Buena) y situación crediticia desfavorable (de Regular a No Confiable)
Select MT.Marca As NombreMarca, 
    (Select COUNT(*) From Tarjetas T
     Inner Join Billeteras B On T.ID_Billetera = B.ID_Billetera
     Inner Join Usuarios U On B.ID_Usuario = U.ID_Usuario
     Inner Join NivelesSituacionCrediticia NSC On U.ID_NivelesSituacionCrediticia = NSC.ID_NivelesSituacionCrediticia
     Where T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta
     AND NSC.SituacionCrediticia In ('Excelente', 'Muy Buena', 'Buena')
    ) AS Favorable, 
    (Select COUNT(*) From Tarjetas T
     Inner Join Billeteras B On T.ID_Billetera = B.ID_Billetera
     Inner Join Usuarios U On B.ID_Usuario = U.ID_Usuario
     Inner Join NivelesSituacionCrediticia NSC On U.ID_NivelesSituacionCrediticia = NSC.ID_NivelesSituacionCrediticia
     Where T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta
     AND NSC.SituacionCrediticia In ('Regular','Mala', 'Muy Mala', 'No Confiable')
    ) As Desfavorable
From MarcasTarjeta MT;
Go

-- 8 - Por cada billetera, listar el alias y la cantidad total de dinero operado en el mes de agosto de 2023 y la cantidad total de dinero operado en el mes de septiembre de 2023. Si no registró movimientos debe totalizar 0.
Select B.Alias, 
    ISNULL( (Select SUM(M.Importe) From Movimientos M Where M.ID_Billetera = B.ID_Billetera And Month (M.FechaHora) = 8 And Year(M.FechaHora) = 2023) , 0) As TotalAgosto,
    ISNULL( (Select SUM(M.Importe) From Movimientos M Where M.ID_Billetera = B.ID_Billetera And Month (M.FechaHora) = 9 And Year(M.FechaHora) = 2023) , 0) As TotalAgosto
From Billeteras B;
Go

/* 9 - El banco decidió cobrar en el mes de Agosto el monto de $50 a cada movimiento de débito realizado en un fin de semana y $10 a los movimientos de crédito realizados. 
    Listar para cada billetera, el alias y la cantidad a abonar por este disparatado recargo. Si no registra recargos debe totalizar 0.
    NOTA: Sólo aplica a los movimientos registrados en el mes de Agosto de 2023. */
Select B.Alias, 
    ISNULL((Select SUM(
        Case 
            When M.TipoMovimiento = 'D' And DATEPART(dw, M.FechaHora) In (1, 7) Then 50
            When M.TipoMovimiento = 'C' Then 10
            Else 0
        End) From Movimientos M
        Where M.ID_Billetera = B.ID_Billetera And MONTH(M.FechaHora) = 8 And YEAR(M.FechaHora) = 2023), 0) As TotalRecargo From Billeteras B;
Go

-- 10 - El total acumulado en concepto de recargo (ver Punto 9)
Select SUM(Total) AS AcumuladoRecargos From(
    Select ISNULL(
        (Select SUM(
            Case
            When M.TipoMovimiento = 'D' And DATEPART(dw, M.FechaHora) In (1, 7) Then 50
            When M.TipoMovimiento = 'C' Then 10 Else 0
            End) From Movimientos M
            Where M.ID_Billetera = B.ID_Billetera And MONTH(M.FechaHora) = 8 And YEAR(M.FechaHora) = 2023), 0) As Total From Billeteras B) As Recargos;
Go

-- 11 - Las marcas de tarjeta que hayan otorgado igual cantidad de tarjetas a clientes con situación crediticia favorable que a clientes con situación crediticia desfavorable.
Select MT.Marca From MarcasTarjeta MT
Inner Join (
    Select T.ID_MarcaTarjeta,
        SUM(Case When U.ID_NivelesSituacionCrediticia Between 1 And 3 Then 1 Else 0 End) As CrediticiaFavorable,
        SUM(Case When U.ID_NivelesSituacionCrediticia Between 4 And 7 Then 1 Else 0 End) As CrediticiaDesfavorable
    From Tarjetas T
    Inner Join Billeteras B On T.ID_Billetera = B.ID_Billetera Inner Join Usuarios U On B.ID_Usuario = U.ID_Usuario
    Group By T.ID_MarcaTarjeta
) As SituacionCrediticia On MT.ID_MarcaTarjeta = SituacionCrediticia.ID_MarcaTarjeta
Where SituacionCrediticia.CrediticiaFavorable = SituacionCrediticia.CrediticiaDesfavorable;
Go

-- 12 - La cantidad de marcas de tarjeta que hayan otorgado más del doble de cantidad de tarjetas a clientes con situación crediticia favorable que a clientes con situación crediticia desfavorable.
Select Count(*) As Cantidad From (
    Select T.ID_MarcaTarjeta,
        SUM(Case When U.ID_NivelesSituacionCrediticia Between 1 And 3 Then 1 Else 0 End) As CrediticiaFavorable,
        SUM(Case When U.ID_NivelesSituacionCrediticia Between 4 And 7 Then 1 Else 0 End) As CrediticiaDesfavorable
    From Tarjetas T
    Inner Join Billeteras B On T.ID_Billetera = B.ID_Billetera Inner Join Usuarios U On B.ID_Usuario = U.ID_Usuario
    Group By T.ID_MarcaTarjeta
    Having SUM(Case When U.ID_NivelesSituacionCrediticia Between 1 And 3 Then 1 Else 0 End) > 2 * SUM(Case When U.ID_NivelesSituacionCrediticia Between 4 And 7 Then 1 Else 0 End)
) As Dobles
Go

-- 13 - Las billeteras que hayan operado, en total, más dinero en agosto que en septiembre de 2023.
Select ID_Billetera, Alias, ISNULL(TotalAgosto, 0) AS TotalAgosto, ISNULL(TotalSeptiembre, 0) AS TotalSeptiembre From (
    Select B.ID_Billetera, B.Alias,
        (Select SUM(ISNULL(M1.Importe, 0)) From Movimientos M1 Where M1.ID_Billetera = B.ID_Billetera And MONTH(M1.FechaHora) = 8) As TotalAgosto,
        (Select SUM(ISNULL(M2.Importe, 0)) From Movimientos M2 Where M2.ID_Billetera = B.ID_Billetera And MONTH(M2.FechaHora) = 9) As TotalSeptiembre
    From Billeteras B
) As TotalesPorBilletera
Where ISNULL(TotalAgosto, 0) > ISNULL(TotalSeptiembre, 0)
Go

-- 14 - La cantidad de billeteras que hayan operado en Agosto pero no en Septiembre.
Select COUNT(*) As Cantidad From (
    Select Distinct ID_Billetera From Movimientos Where Month(FechaHora) = 8
    And ID_Billetera Not In (
    Select Distinct ID_Billetera From Movimientos Where Month(FechaHora) = 9
    )  
) As SoloAgosto
Go

-- 15 - Las billeteras que pagaron más de $100 en total en concepto de recargo (Ver Punto 9)
Select * From (
    Select B.Alias, 
    ISNULL((Select SUM(
        Case 
            When M.TipoMovimiento = 'D' And DATEPART(dw, M.FechaHora) In (1, 7) Then 50
            When M.TipoMovimiento = 'C' Then 10
            Else 0
        End) From Movimientos M
        Where M.ID_Billetera = B.ID_Billetera And MONTH(M.FechaHora) = 8 And YEAR(M.FechaHora) = 2023), 0) As TotalRecargo From Billeteras B
) As Punto15 Where TotalRecargo >= 50;
