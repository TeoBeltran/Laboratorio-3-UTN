/*
Actividad 1.1: Normalizacion y creacion de tablas por codigo

Realizar la normalizacion y posterior creacion de tablas y restricciones a partir del siguiente enunciado.

MercadoLabo es un nuevo servicio de billetera virtual para que sus clientes puedan realizar todo tipo de pagos, transferencias e inversiones.
La empresa desea comenzar sus operaciones en Argentina y requiere de una base de datos que permita respaldar de manera segura y confiable la informacion de su operatoria.
El objetivo final de la empresa es posicionarse como un medio de pago utilizable en cualquier comercio, transporte y tambien poder utilizarla para inversiones.
Por el momento, en una version 1.1 desean algo menos ambicioso: registrar la informacion de las personas que seran usuarios de la aplicacion. 
Cada usuario debe representar a una persona fisica y por ende registrar un codigo unico e irrepetible, ademas de informacion adicional tal como apellidos, nombres, dni, genero, 
    edad, fecha de nacimiento; datos de domicilio, como calle y numero, nombre de la localidad y provincia.
Tambien pueden registrar un telefono y un celular opcionalmente ambos y un mail de forma obligatoria.
Tambien se necesita inicialmente conocer la situacion crediticia de la persona. Esto le otorgara un nivel de 1 a 5 que determinara las diferentes operaciones que podra realizar dentro de la aplicacion. 
Otro aspecto que se requiere luego de registrar una persona es asociarla a una cuenta. Las cuentas no se pueden compartir.
Cada persona debe usar su propia billetera virtual. La billetera o cuenta, propiamente dicha, debera registrar el apellido y nombre del titular de la cuenta, 
    asi como tambien la edad del mismo y la fecha de creacion de la cuenta. Las billeteras virtuales tienen un numero de billetera unico.
Es un numero irrepetible que se va asignando a medida que se generan. La empresa ha decidido estrategicamente que los numeros de cuenta entre el 1 y 10000 cotizaran 
    ampliamente una vez que la empresa se consolide por lo que las nuevas cuentas comenzaran a contabilizar a partir del 10001 en adelante.
Las billeteras tambien tendran un alias, que los usuarios podran personalizar y que no puede repetirse. De las billeteras se podran registrar todos los 
    movimientos de dinero de la persona, por lo que deberan disponer de un saldo para poder consultarlo en cualquier momento.
Por ultimo, en esta primera version, se desean registrar las tarjetas de credito o debito que se asociaran a la billetera virtual.
Las tarjetas tienen un numero identificatorio irrepetible de 16 digitos, una fecha de emision y vencimiento y una clave de seguridad de hasta 4 digitos.
Poseen tambien un banco emisor y una marca. Por ejemplo, las empresas de tarjeta mas utilizadas actualmente son Nomis y Zelev. Aunque se espera que empresas como 
    Laramerican Express y KlosterCard esten proximamente disponibles para asociar.

*/
