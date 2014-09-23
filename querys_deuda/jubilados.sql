select
  t.cod as 'partida municipal',
  if(c.jubilado = 1, '1', '0') as 'jubilado'
from municipal.tgi t
  left join municipal.contribuyentes c on t.contri2 = c.id
