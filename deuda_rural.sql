select
  t.catastral as 'Numero partida municipal', 
  '01' as tributo,
  -- lpad(d.cuenta, 10, 0) as cuenta, 
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  d.periodo as periodo, 
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as fecha_emision, 
  p.vencimiento1 as 'Fecha 1er vencimiento', 
  p.vencimiento2 as 'Fecha 2do vencimiento',
  municipal.dreal(NOW(), p.vencimiento1, d.costo, 0, 0) - 
  municipal.dreal(DATE_ADD(p.vencimiento1,INTERVAL 1 DAY), p.vencimiento1, d.costo, 0, 0) as 'interes resarcitorio',
  '' as referencia, 
   
  dir.calle as calle,
  dir.altura as altura,
  dir.piso as piso,
  dir.dpto as dpto, 
  dir.localidad as localidad,
  
  '' as 'nro convenio origen',
  '' as 'descripcion convenio origen', 
  '' as 'nombre del tipo de convenio origen', 
  '' as 'fecha convenio origen',

  d.convenio as 'nro convenio destino',
  ' ' as 'descripcion convenio destino', 
  'convenio' as 'nombre del tipo de convenio destino', 
  con.inicio as 'fecha convenio destino',

  d.judicial as 'nro titulo ejecutorio', 
  j.fecha as 'fecha titulo ejecutorio',
   
  
  '' as NORANUL, 
  '' as TIPOANUL, 
  '' as FECHANUL
  /*'tasa pura',
  d.adicional + d.basico as 'tasa pura',
  'baldio',
  d.baldio as baldio,
  'BV',
  d.BV as 'BV',
  'Th',
  d.Th as Th,
  'Samco',
  d.samco as samco,
  'gastos administrativos',
  d.gadm as 'gastos administrativos',
  'mosquito',
  d.mosquito as mosquito
  -- lpad(' ',320,' ') as 'activi importes', lpad(' ',176,' ') as 'cargo importe',
  -- lpad(' ',10,' ') as FCOBRO, ' ' as STAFE, ' ' as DISCRI, ' ' as NOMBREI, ' ' as ERR_BOL*/

from municipal.drural d
  left join municipal.rural t on d.cuenta = t.cod
  left join municipal.prural p on d.periodo = p.periodo
  left join municipal.direccion_correo_rural dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod