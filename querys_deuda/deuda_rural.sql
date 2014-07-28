select
  t.catastral as 'Numero partida municipal', 
  '02' as tributo,
  -- lpad(d.cuenta, 10, 0) as cuenta, 
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  d.periodo as periodo, 
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as fecha_emision, 
  p.vencimiento1 as 'Fecha 1er vencimiento', 
  p.vencimiento2 as 'Fecha 2do vencimiento',
  round(municipal.calcular_interes(d.f_pago, p.vencimiento1,d.costo),2) as 'interes resarcitorio',
  /*IF(d.f_pago is not null, 
    municipal.dreal(d.f_pago, p.vencimiento1, d.costo, 0, 0), 
    municipal.dreal(NOW(), p.vencimiento1, d.costo, 0, 0))- 
  municipal.dreal(DATE_ADD(p.vencimiento1,INTERVAL 1 DAY), p.vencimiento1, d.costo, 0, 0) as 'interes resarcitorio',*/
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
  '' as FECHANUL,
  'tasa',
  round(d.costo,2) as 'tasa'

from municipal.drural d
  left join municipal.rural t on d.cuenta = t.cod
  left join municipal.prural p on d.periodo = p.periodo
  left join municipal.direccion_correo_rural dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod
limit 10