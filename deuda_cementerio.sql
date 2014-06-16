select lpad(d.cuenta, 10, 0) as cuenta, '03', lpad('1',10,0) as numero, 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  lpad(d.periodo,20,0) as periodo, 
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as emision, p.vencimiento1, p.vencimiento2,
  lpad(municipal.dreal(NOW(), p.vencimiento1, d.costo, 0, 0) - 
  municipal.dreal(DATE_ADD(p.vencimiento1,INTERVAL 1 DAY), p.vencimiento1, d.costo, 0, 0),12,0) as interes,
  lpad(' ', 100, ' ') as referen, lpad(' ', 10, ' ') as nrocta, 
  lpad(dir.calle,100,0) as calle, lpad(dir.altura,6,0) as altura, lpad(dir.piso,2,0) as piso, 
  lpad(dir.dpto,4,0) as dpto, lpad(dir.localidad,50,0) as localidad, 
  lpad(d.convenio, 12, 0) as NROCONVo1, lpad(' ',150,' ') as DESCRCONo1, lpad(' ',150,' ') as NOMTICONo1, 
  con.inicio as FECHCONVo1,
  lpad(d.convenio, 12, 0) as NROCONVd, lpad(' ',150,' ') as DESCRCONd, lpad(' ',150,' ') as NOMTICONd, 
  con.inicio as FECHCONVd,
  lpad(d.judicial,20,0) as NROTITU, j.fecha as FECHTITU,
  lpad(' ',20,' ') as NORANUL, '  ' as TIPOANUL, lpad(' ',10,' ') as FECHANUL,
  lpad(' ',320,' ') as 'activi importes', lpad(' ',176,' ') as 'cargo importe',
  lpad(' ',10,' ') as FCOBRO, ' ' as STAFE, ' ' as DISCRI, ' ' as NOMBREI, ' ' as ERR_BOL
from municipal.dcementerio d
  left join municipal.pcementerio p on d.periodo = p.periodo
  left join municipal.direccion_correo_cementerio dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod