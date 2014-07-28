drop view municipal.direcciones_contribuyentes;

CREATE VIEW municipal.direcciones_contribuyentes as
  select 
    c1.id, c1.calle_id as calle, c1.altura, '  ' as piso, c1.dpto, l.name as localidad
  from municipal.contribuyentes c1
    left join municipal.localidads l on c1.localidad_id = l.id
