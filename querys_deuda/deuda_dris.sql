select
  d.cuenta as 'Numero partida municipal', 
  '04' as tributo, 
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  if(d.periodo,d.periodo,'') as periodo,
  if(p.vencimiento1,DATE_SUB(p.vencimiento1,INTERVAL 10 DAY),'') as fecha_emision, 
  if(p.vencimiento1, p.vencimiento1, '') as 'Fecha 1er vencimiento', 
  if(p.vencimiento2, p.vencimiento2, '') as 'Fecha 2do vencimiento',
  round(municipal.calcular_interes(d.f_pago, p.vencimiento1,d.costo90,d.costoreal,d.pago),2) as 'interes resarcitorio',
  '' as referencia, 
   
  -- dir.calle as calle,
  if(c.name,c.name,'') as calle,
  if(dir.altura,dir.altura,'') as altura,
  if(dir.piso,dir.piso,'') as piso,
  if(dir.dpto,dir.dpto,'') as dpto, 
  if(dir.localidad,dir.localidad,'') as localidad,
  
  '' as 'nro convenio origen',
  '' as 'descripcion convenio origen', 
  '' as 'nombre del tipo de convenio origen', 
  '' as 'fecha convenio origen',

  if(d.convenio,d.convenio,'') as 'nro convenio destino',
  '' as 'descripcion convenio destino', 
  'convenio' as 'nombre del tipo de convenio destino', 
  if(con.inicio,con.inicio,'') as 'fecha convenio destino',

  '' as 'nro titulo ejecutorio', 
  '' as 'fecha titulo ejecutorio',
   
  
  '' as NORANUL, 
  '' as TIPOANUL, 
  '' as FECHANUL,

  'cargo',
  round(IF (d.pago is not null, d.pago, ''), 2) as impord1,
  
  (select rubro_id from municipal.negocios n where d.cuenta = n.dri_id limit 1) as activi1, 
  '' as impord1, 
  (select rubro_id from municipal.negocios n where d.cuenta = n.dri_id limit 1 offset 2) as activi2, 
  '' as impord2,
  (select rubro_id from municipal.negocios n where d.cuenta = n.dri_id limit 1 offset 3) as activi3, 
  '' as impord3,
  (select rubro_id from municipal.negocios n where d.cuenta = n.dri_id limit 1 offset 4) as activi4, 
  '' as impord4

from municipal.deuda_dris d
  left join municipal.dris t on d.cuenta = t.id
  left join municipal.pdris p on d.periodo = p.periodo
  left join municipal.direccion_correo_dris dir on dir.id = d.id
  left join municipal.convenio con on con.cod = d.convenio
  -- left join municipal.judicial j on d.judicial = j.cod
  left join municipal.calles c on dir.calle = c.id
  group by d.cuenta, d.periodo
