select   
  d.cuenta, d.periodo, i.superficie, c.name, d.pago, l.name
  from   municipal.dtgi d   
	left join municipal.tgi i on d.cuenta = i.cod  
	left join municipal.contribuyentes c on i.contri = c.id
	left join municipal.localidads l on l.id = c.localidad_id
where   
  i.cod is not null and d.pago is not null 
limit 1000;
