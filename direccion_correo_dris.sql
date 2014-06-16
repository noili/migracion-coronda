drop view municipal.direccion_correo_dris;

create view municipal.direccion_correo_dris as
select
  t.id, t.calle_id as calle, t.altura as altura , '  ' as piso, t.dpto as dpto, l.name as localidad
  -- IF(cod_correo = 0,t.calle,IF(cod_correo = 1,c1.calle,c2.calle)) as calle,
  -- IF(cod_correo = 0,t.altura,IF(cod_correo = 1,c1.altura,c2.altura)) as altura,
  -- IF(cod_correo = 0,' ',IF(cod_correo = 1,c1.piso,c2.piso)) as piso,
  -- IF(cod_correo = 0,t.dpto,IF(cod_correo = 1,c1.dpto,c2.dpto)) as dpto,
  -- IF(cod_correo = 0,l.name,IF(cod_correo = 1,c1.localidad,c2.localidad)) as localidad
from municipal.dris t
  -- left join municipal.direcciones_contribuyentes c1 on t.contribuyente_id = c1.id
  left join municipal.localidads l on t.localidad_id = l.id