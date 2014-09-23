select 
  c.cod as 'numero partida municipal',
  '3-cementerio' as 'tipo',
  c.superficie as 'superficie',
  1 as 'tipo de documento',
  if(c.contri,contri.nro_doc,if(c.contri2,contri2.nro_doc,'')) as 'nro doc',
  -- if(c.contri,contri.apellido,if(c.contri2,contri2.apellido,'')) as 'apellido',
  if(c.contri,contri.name,if(c.contri2,contri2.name,'')) as 'nombre',
  if(c.contri,contri.telefono,if(c.contri2,contri2.telefono,'')) as 'telefono',
  '' as 'sexo',
  if(c.contri,contri.email,if(c.contri2,contri2.email,'')) as 'email',
  as 'calle',
  as 'altura',
  as 'piso'
  as 'dpto',
  as 'localidad',
  as 'difunto',

from municipal.cementerio c
  left join municipal.contribuyentes contri on c.contri = contri.id
  left join municipal.contribuyentes contri2 on c.contri2 = contri2.id
  