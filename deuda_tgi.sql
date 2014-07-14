select
  t.catastral as 'Numero partida municipal', 
  '01' as tributo,
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  d.periodo as periodo, 
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as fecha_emision, 
  p.vencimiento1 as 'Fecha 1er vencimiento', 
  p.vencimiento2 as 'Fecha 2do vencimiento',
  round(municipal.calcular_interes(d.f_pago, p.vencimiento1,d.avaluo),2) as 'interes resarcitorio',
  /*IF(d.f_pago is not null, 
    municipal.dreal(d.f_pago, p.vencimiento1, d.avaluo, 0, 0), 
    municipal.dreal(NOW(), p.vencimiento1, d.avaluo, 0, 0))- 
  municipal.dreal(DATE_ADD(p.vencimiento1,INTERVAL 1 DAY), p.vencimiento1, d.avaluo, 0, 0) as 'interes resarcitorio',*/
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
  /*j.fecha as 'fecha titulo ejecutorio',*/
   
  
  '' as NORANUL, 
  '' as TIPOANUL, 
  '' as FECHANUL,
  'tasa pura',
  round(d.adicional + d.basico,2) as 'tasa pura',
  'baldio',
  round(d.baldio,2) as baldio,
  'BV',
  round(d.BV,2) as 'BV',
  'Th',
  round(d.Th,2) as Th,
  'Samco',
  round(d.samco,2) as samco,
  'gastos administrativos',
  round(d.gadm,2) as 'gastos administrativos',
  'mosquito',
  round(d.mosquito,2) as mosquito

from municipal.deuda_tgi d
  left join municipal.tgi t on d.cuenta = t.cod
  left join municipal.ptgi p on d.periodo = p.periodo
  left join municipal.direccion_correo_tgi dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  /*left join municipal.judicial j on d.judicial = j.cod*/
