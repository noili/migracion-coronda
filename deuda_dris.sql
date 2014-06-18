select
  -- t.catastral as 'Numero partida municipal', 
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
  '' as FECHANUL,
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
  d.mosquito as mosquito,*/
  
  (select rubro_id from municipal.negocios n where d.rubro_id  = n.dri_id limit 1) as activi1, 
  IF (d.pago is not null, d.pago, null) as impord1,
  (select rubro_id from municipal.negocios n where d.rubro_id = n.dri_id limit 1 offset 2) as activi2, 
  '' as impord2,
  (select rubro_id from municipal.negocios n where d.rubro_id  = n.dri_id limit 1 offset 3) as activi3, 
  '' as impord3,
  (select rubro_id from municipal.negocios n where d.rubro_id  = n.dri_id limit 1 offset 4) as activi4, 
  '' as impord4,
  (select rubro_id from municipal.negocios n where d.rubro_id  = n.dri_id limit 1 offset 5) as activi5, 
  '' as impord5,
  (select rubro_id from municipal.negocios n where d.rubro_id  = n.dri_id limit 1 offset 6) as activi6, 
  '' as impord6
from municipal.deuda_dris d
  left join municipal.dris t on d.cuenta = t.id
  left join municipal.pdris p on d.periodo = p.periodo
  left join municipal.direccion_correo_dris dir on dir.id = d.id
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod
-- where dir.calle != 0