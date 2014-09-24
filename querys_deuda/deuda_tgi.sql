select
  d.cuenta as cuenta,
  '01' as tributo,
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  if(d.periodo,d.periodo,'') as periodo,
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

  if(d.convenio,d.convenio,'') as 'nro convenio destino',
  '' as 'descripcion convenio destino', 
  'convenio' as 'nombre del tipo de convenio destino', 
  if(con.inicio,con.inicio,'') as 'fecha convenio destino',

  if(d.judicial,d.judicial,'') as 'nro titulo ejecutorio',
  if(j.fecha,j.fecha,'') as 'fecha titulo ejecutorio',
   
  
  if(d.borrada,d.borrada,'') as NROANUL, 
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
  left join municipal.direccion_correo_tgi dir on d.cuenta = dir.cod
  left join municipal.convenio con on d.convenio = con.cod
  left join municipal.judicial j on d.judicial = j.cod
  left join municipal.calles c on dir.calle = c.id
   where t.baja != 1
