select 
  if(c.t_doc,c.t_doc,'') as 'tipo de documento',
  if(c.nro_doc,c.nro_doc,'') as 'documento',
  if(n.name,n.name,'') as 'nombre fantasia',
  '' as 'nombre real',
  if(c.telefono,c.telefono,'') as 'telefono',
  '' as 'sin uso',
  if(c.email,c.email,'') as 'email',
  if(cal.nombre,cal.nombre,'') as 'calle',
  if(n.altura,n.altura,'') as 'altura',
  if(n.piso,n.piso,'') as 'piso',
  if(n.departamento,n.departamento,'') as 'departamento',
  if(l.nombre,lnombre,'') as 'localidad',
  '' as 'numero del API',
  if(n.alta,n.alta,'') as 'fecha inicio actividades',
  if(r.name,r.name,'') as 'perfil fiscal',
  '' as 'tipo sociedad',
  '' as 'regimen convenio multilateral', 
  '' as 'tipo de empresa',
  '' as 'tamaño de la empresa',
  1 as 'cantidad de titulares',
  c.personal  as 'cantidad de empleados',
  '' as 'cadena comercial',
  d.id as 'codigo cuenta Drei'
 
from municipal.negocios n
  left join municipal.dris d on n.dri_id = d.id
  left join municipal.contribuyentes c on d.contribuyente_id = c.id
  left join municipal.calles cal on c.calle_id  = cal.id
  left join municipal.localidads l on c.localidad_id = l.id
  left join municipal.rubros r on n.rubro_id = r.id