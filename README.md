migracion-coronda
=================

migracion de la base de datos municipalidad de Coronda

### Datos Factura:

Nombre de la empreza o razon social:
Municipalidad de la ciudad de Coronda

cuit:
33-99901882-9

direccion:
Sarmiento 1818

que tiene que decir la factura:
migracion de datos en sql

### TODO:

hacer la migracion de los negocios.

hacer bromatologia.

las tablas verlas en foxpro, acces o algo asi.

La persona tiene declaradas varias actividades pero tiene un unico importe de 
pago, por lo tanto, no puedo dividirlo. Asi que lo paso como un único valor. 


 1  Número de Partida municipal
 2  Tributo ( Ver Tabla ) 
 q? preguntarle donde esta la tabla
 3  Número de recibo ( Max 10 Pos ) 
 q? (hay uno solo por impresion)
 4  Estado ( A-Activa , T-Pagas , N-Anuladas )
 5  Periodo ( Eje : Enero-13 )
 q? El formato es aaaamm 
 6  Fecha emisión ( Formato : dd/mm/aa )
 7  Fecha 1er Vencimiento ( Formato : dd/mm/aa )
 8  Fecha 2do Vencimiento ( Formato : dd/mm/aa )
 9  Interes resarcitorio (Formato 999999.99 )
 10 Referencia ( Max 100 Characteres )

 11 Nombre Calle ( Dirección de entrega )
 12 Altura ( Dirección de entrega )
 13 Piso ( Dirección de entrega )
 14 Dpto ( Dirección de entrega )
 15 Nombre de la Localidad ( Dirección de entrega )

 16 Número de convenio Origen
 17 Descripción de convenio Origen
 18 Nombre del tipo de convenio Origen
 19 Fecha de convenio Origen

 20 Número de convenio Destino
 21 Descripción de convenio Destino
 22 Nombre del tipo de convenio Destino
 23 Fecha de convenio Destino

 24 Numero Título ejecutorio
 25 Fecha de Título ejecutorio

 24 Número Anulación-Prescripción
 25 Tipo de Anulación-Prescripción
 25 Fecha de Anulación Prescripción
 q? Numero Anulacion es un estado T o F

 26 Descripción del Cargo
 27 Importe del Cargo
 28 Descripción del Cargo
 29 Importe del Cargo
 30 Descripción del Cargo
 31 Importe del Cargo
 32 Descripción del Cargo
 33 Importe del Cargo
 34 Descripción del Cargo
 35 Importe del Cargo
 36 Descripción del Cargo
 37 Importe del Cargo
 38 Descripción del Cargo
 39 Importe del Cargo
 40 Descripción del Cargo
 41 Importe del Cargo
 42 Descripción del Cargo
 43 Importe del Cargo
 44 Descripción del Cargo
 45 Importe del Cargo

Solo para recibos del DREI

 46 Descripción de la Actividad
 47 Importe del la Actividad
 48 Descripción de la Actividad
 49 Importe del la Actividad
 50 Descripción de la Actividad
 51 Importe del la Actividad
 52 Descripción de la Actividad
 53 Importe del la Actividad
 54 Descripción de la Actividad
 55 Importe del la Actividad
 56 Descripción de la Actividad
 57 Importe del la Actividad
 
 
 
### COMERCIOS


Hola federico, la vez pasada no te pase todas las estructuras, ahi van:

-Se puede trasladar desde el sistema anterior respetando el formato de
transferencia.

Nombre del archivo N:\PS-IO\IMPOR\COMERCIOS.TXT
Todos los campos deben estar separados por ';'
Definiciones de campos:
 1  Tipo de documento (Max 1 pos.)(5-CUIT – Ver Tabla)
 2  Número de documento (Max 12 pos.)
 3  Nombre fantasía (Max 50 Pos)
 4  Nombre Legal (Max 50 Pos)
 5  Teléfono (Max 30 Pos)
 6  Nro de cuenta.
 7  Mail (Max 50 Pos)
 8  Nombre de la calle (Max 30 Pos)
 9  Numero-Altura (Max 6 Pos)
 10 Numero de piso (Max 2 Pos)
 11 Numero de departamento (Max 4 Pos)
 12 Nombre de la localidad ( Max 30 Pos )
 13 Numero del API (Max 10 Pos)
 14 Fecha Inicio de Actividades (8 Pos dd/mm/aa)
 15 Perfil fiscal (Max 30 Pos) (Ver Tabla)
 16 Tipo de Sociedad (Max 30 Pos) (Ver Tabla)
 17 Régimen Convenio Multilateral (1 Pos) (S/N)
 18 Tipo de Empresa (Max 30 Pos) (Ver Tabla)
 19 Tamaño de Empresa (Max 30 Pos) (Ver Tabla)
 20 Cantidad Titulares (Max 3 Pos)
 21 Cantidad Empleados (Max 3 Pos)
 22 Cadena Comercial (1 Pos) (S/N)
 23 Código Cuenta DReI (Max 8 Pos)
 24 Fecha Emisión DReI (8 Pos dd/mm/aa)

EJE ( N:\ps-io\impor\COMERCIOS.TXT ) :  Archivo Ejemplo
1;20135236584;FERRETERIA JUAN;PERES
JUAN;0342-222547;;FERRETERIAJUAN@GMAIL.COM;LAPRIDA;2134;;;SANTA
FE;1234567890;01/01/95;Responsable Inscripto;S.A.;N;COMERCIO;CHICO;1;11;N

Al realizar la importación el sistema crea la  dirección en forma automática
y si es necesario dará de alta la calle, localidad, Tipo de sociedad, perfil
fiscal, tipo empresa, Tamaño empresa
