migracion-coronda
=================

migracion de la base de datos municipalidad de Coronda

### TODO:

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
 TODO: falta redondear
 10 Referencia ( Max 100 Characteres )

 11 Nombre Calle ( Dirección de entrega )
 TODO: cambiar a nombre
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
 TODO: si baja > 0 esta anulada, sale de d.baja

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
