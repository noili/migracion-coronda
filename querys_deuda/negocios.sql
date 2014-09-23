select 

  if(length(c.cuit) > 9,5,if(c.nro_doc,1,'')) as 'tipo de documento',

  if(c.cuit,c.cuit,if(c.nro_doc,c.nro_doc,'')) as 'documento',

  -- if(n.name,n.name,'') as 'nombre fantasia',
  n.name as 'nombre fantasia',
  '' as 'nombre real',
  if(c.telefono,c.telefono,'') as 'telefono',
  if(c.email,c.email,'') as 'email',
  if(cal.name,cal.name,'') as 'calle',
  if(c.altura,c.altura,'') as 'altura',
  if(dir.piso,dir.piso,'') as 'piso',
  if(dir.dpto,dir.dpto,'') as 'departamento',
  if(l.name,l.name,'') as 'localidad',

  REPLACE(c.ingresos,'-','') as 'numero del API',
  if(n.alta,n.alta,'') as 'fecha inicio actividades',
  -- if(r.name,r.name,'') as 'perfil fiscal',
  CASE 3
    when 1 THEN 'RESPONSABLE INSCRIPTO'
    when 2 THEN 'MONOTRIBUTO RESP. SOCIAL'
    when 3 THEN 'CONSUMIDOR FINAL'
    when 4 THEN 'EXENTO/NO SUJETO'
    when 5 THEN 'MONOTRIBUTO'
    ELSE ''
  END as 'perfil fiscal',

  -- '' as 'tipo sociedad',
  CASE 6
    when '&1' THEN 'S.A.'
    when '&2' THEN 'S.H.'
    when '&3' THEN 'S.R.L.'
    when '&4' THEN 'UNIPERSONAL'
    ELSE ''
  END as 'tipo sociedad',

  'no' as 'regimen convenio multilateral', 
  -- '' as 'tipo de empresa',
  CASE 6
    when '1' THEN 'Industria'
    when '2' THEN 'Comercio'
    when '3' THEN 'Servicio'
    when '4' THEN 'Prmario'
    ELSE ''
  END as 'tipo sociedad',

  -- '' as 'tamaño de la empresa',
  CASE 6
    when 1 THEN 'Chico'
    when 2 THEN 'Mediano'
    when 3 THEN 'Grande'
    ELSE ''
  END as 'tamaño empresa',

  1 as 'cantidad de titulares',
  c.personal  as 'cantidad de empleados',
  'no' as 'cadena comercial',
  d.id as 'codigo cuenta Drei',
  if(n.alta,n.alta,'') as 'fecha emision Drei'
  
from municipal.negocios n
  left join municipal.dris d on n.dri_id = d.id
  left join municipal.contribuyentes c on d.contribuyente_id = c.id
  left join municipal.calles cal on c.calle_id  = cal.id
  left join municipal.localidads l on c.localidad_id = l.id
  left join municipal.rubros r on n.rubro_id = r.id
  left join municipal.direcciones_contribuyentes dir on c.id = dir.id