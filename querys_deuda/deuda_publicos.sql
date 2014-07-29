select
  d.cuenta as 'Numero partida municipal', 
  '&2' as tributo, 
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  d.periodo as periodo, 
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as fecha_emision, 
  p.vencimiento1 as 'Fecha 1er vencimiento', 
  p.vencimiento2 as 'Fecha 2do vencimiento',
  round(municipal.calcular_interes(d.f_pago, p.vencimiento1,d.costo90,d.costoreal,d.pago),2) as 'interes resarcitorio',
  
  '' as referencia, 
   
  if(c.name,c.name,'') as calle,
  if(dir.altura,dir.altura,'') as altura,
  if(dir.piso,dir.piso,'') as piso,
  if(dir.dpto,dir.dpto,'') as dpto, 
  if(dir.localidad,dir.localidad,'') as localidad,
  
  '' as 'nro convenio origen',
  '' as 'descripcion convenio origen', 
  '' as 'nombre del tipo de convenio origen', 
  '' as 'fecha convenio origen',

  '' as 'nro convenio destino',
  '' as 'descripcion convenio destino', 
  '' as 'nombre del tipo de convenio destino', 
  '' as 'fecha convenio destino',

  '' as 'nro titulo ejecutorio',
  '' as 'fecha titulo ejecutorio',
   
  
  '' as NORANUL, 
  '' as TIPOANUL, 
  '' as FECHANUL,
  'tasa',
  round(d.costo,2) as 'tasa',
  
  (select rubro_id from municipal.negocios n where d.cuenta = n.dri_id limit 1) as activi1, 
  round(IF (d.pago is not null, d.pago, null),2) as impord1

from municipal.deuda_publicos d
  -- left join municipal.dris t on d.cuenta = t.id
  left join municipal.pdris p on d.periodo = p.periodo
  left join municipal.direccion_correo_dris dir on dir.id = d.rubro_id
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod
  left join municipal.calles c on dir.calle = c.id
limit 100