select
  (select t.cod from municipal.convenio t where d.cuenta = t.cod limit 1) as cuenta,
  -- if(t.cod,t.cod,'') as 'Numero partida municipal',
  '05' as tributo,
  '1' as numero_de_recibo, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  if(d.periodo,d.periodo,'') as periodo,
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as fecha_emision, 
  p.vencimiento1 as 'Fecha 1er vencimiento', 
  p.vencimiento2 as 'Fecha 2do vencimiento',
  round(municipal.calcular_interes(d.f_pago, p.vencimiento1,d.costo,d.costo,d.pago),2) as 'interes resarcitorio',
  
  '' as referencia, 
   
  if(c.name,c.name,'') as calle,
  if(dir.altura,dir.altura,'') as altura,
  if(dir.piso,dir.piso,'') as piso,
  if(dir.dpto,dir.dpto,'') as dpto, 
  if(dir.localidad,dir.localidad,'') as localidad,
  
  
  d.impu as 'nro convenio origen',
  CASE d.tipo
    when 0 THEN 'tgi'
    when 2 THEN 'rural'
    when 4 THEN 'catastro'
    ELSE ''
  END as 'descripcion convenio origen', 
  '' as 'nombre del tipo de convenio origen', 
  d.inicio as 'fecha convenio origen',

  '' as 'nro convenio destino',
  '' as 'descripcion convenio destino', 
  '' as 'nombre del tipo de convenio destino', 
  '' as 'fecha convenio destino',

  '' as 'nro titulo ejecutorio',
  '' as 'fecha titulo ejecutorio',
   
  
  '' as NORANUL, 
  '' as TIPOANUL,
  '' as FECHANUL,
  
  /*'tasa' as tasa,
  d.costo as tasa*/
  'anticipo' as anticipo,
  d.anticipo

from municipal.deuda_convenio d
  left join municipal.convenio t on d.cuenta = t.cod
  left join municipal.pconvenio p on d.periodo = p.periodo
  left join municipal.direccion_correo_tgi dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod
  left join municipal.calles c on dir.calle = c.id
where d.tipo = 0
