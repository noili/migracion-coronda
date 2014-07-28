drop view municipal.direccion_correo_tgi;

create view municipal.direccion_correo_tgi as
select
  t.cod,
  IF(cod_inm = 0,t.calle,IF(cod_inm = 1,c1.calle,c2.calle)) as calle,
  IF(cod_inm = 0,t.altura,IF(cod_inm = 1,c1.altura,c2.altura)) as altura,
  IF(cod_inm = 0,' ',IF(cod_inm = 1,c1.piso,c2.piso)) as piso,
  IF(cod_inm = 0,t.dpto,IF(cod_inm = 1,c1.dpto,c2.dpto)) as dpto,
  IF(cod_inm = 0,l.name,IF(cod_inm = 1,c1.localidad,c2.localidad)) as localidad,
  t.cate1, t.cate2, t.cate3, t.cate4, municipal.mi_max(t.cate1, t.cate2, t.cate3, t.cate4) as categoria
from municipal.tgi t
  left join municipal.direcciones_contribuyentes c1 on t.contri = c1.id
  left join municipal.direcciones_contribuyentes c2 on t.contri2 = c2.id
  left join municipal.localidads l on t.localidad = l.id
