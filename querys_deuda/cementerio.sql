select 
  c.cod as 'numero partida municipal',
  '3-cementerio' as 'tipo',
  c.superficie as 'superficie',
  1 as 'tipo de documento',
  if(c.contri,contri.nro_doc,if(c.contri2,contri2.nro_doc,'')) as 'nro doc',
  '' as 'apellido',
  if(c.contri,contri.name,if(c.contri2,contri2.name,'')) as 'nombre',
  if(c.contri,contri.telefono,if(c.contri2,contri2.telefono,'')) as 'telefono',
  '' as 'sexo',
  if(c.contri,contri.email,if(c.contri2,contri2.email,'')) as 'email',
  if(c.contri,dir.nombre,if(c.contri2,dir2.nombre,'')) as 'calle',
  if(c.contri,dir.altura,if(c.contri2,dir2.altura,'')) as 'altura',
  if(c.contri,dir.piso,if(c.contri2,dir2.piso,'')) as 'piso',
  if(c.contri,dir.dpto,if(c.contri2,dir2.dpto,'')) as 'dpto',
  if(c.contri,dir.localidad,if(c.contri2,dir2.localidad,'')) as 'localidad',
  c.difunto as 'difunto',
  if('nicho','&3','&2') as 'nicho',
  concat(c.carac, ' - ', c.fila, ' - ', c.nro, ' - ', c.seccion) as 'nota',
  if(c.baja != 1, 'A', 'N')as 'estado'

from municipal.cementerio c
  left join municipal.contribuyentes contri on c.contri = contri.id
  left join municipal.contribuyentes contri2 on c.contri2 = contri2.id
  left join municipal.direcciones_contribuyentes dir on c.contri = dir.id
  left join municipal.direcciones_contribuyentes dir2 on c.contri2 = dir.id
    where c.baja != 1
limit 1000
  