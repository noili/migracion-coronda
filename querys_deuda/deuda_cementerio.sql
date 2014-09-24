select
  d.cuenta as 'Numero partida municipal', 
  '03' as tributo, 
  '1' as 'numero de recibo', 
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

  '' as 'nro convenio destino',
  '' as 'descripcion convenio destino', 
  '' as 'nombre del tipo de convenio destino', 
  '' as 'fecha convenio destino',

  '' as 'nro titulo ejecutorio', 
  '' as 'fecha titulo ejecutorio',

  '' as NROANUL, 
  '' as TIPOANUL, 
  '' as FECHANUL,
  
  'tasa',
  round(d.costo,2) as 'tasa'

from municipal.deuda_cementerio d
  left join municipal.cementerio t on d.cuenta = t.cod
  left join municipal.pcementerio p on d.periodo = p.periodo
  left join municipal.direccion_correo_cementerio dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod
  left join municipal.calles c on dir.calle = c.id
	where t.baja != 1
