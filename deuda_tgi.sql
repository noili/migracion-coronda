select
  t.catastral as Numero_partida_municipal,
  lpad(d.cuenta, 10, 0) as cuenta, '01', lpad('1',10,0) , 
  municipal.estado(d.pago,d.convenio,d.judicial,d.borrada,d.cancelada) as estado, 
  lpad(d.periodo,20,0) as periodo, 
  DATE_SUB(p.vencimiento1,INTERVAL 10 DAY) as emision, p.vencimiento1, p.vencimiento2,
  lpad(municipal.dreal(NOW(), p.vencimiento1, d.avaluo, 0, 0) - 
  municipal.dreal(DATE_ADD(p.vencimiento1,INTERVAL 1 DAY), p.vencimiento1, d.avaluo, 0, 0),12,0) as interes,
  lpad(' ', 100, ' ') as referen, lpad(' ', 10, ' ') as nrocta, 
  municipal.rellenar_num(100,dir.calle) as calle,
  municipal.rellenar_num(6,dir.altura) as altura,
  municipal.rellenar_num(2,dir.piso) as piso,
  municipal.rellenar_num(4,dir.dpto) as dpto, 
  municipal.rellenar_varchar(50,dir.localidad) as localidad,
  -- lpad(d.convenio, 12, 0) as NROCONVo1,
  municipal.rellenar_num(12,d.convenio) as NROCONVo1,
  lpad(' ',150,' ') as DESCRCONo1, lpad(' ',150,' ') as NOMTICONo1, 
  municipal.rellenar_fecha(con.inicio) as FECHCONVo1,
  -- lpad(d.convenio, 12, 0) as NROCONVd, 
  municipal.rellenar_num(12,d.convenio) as NROCONVd,
  lpad(' ',150,' ') as DESCRCONd, lpad(' ',150,' ') as NOMTICONd, 
  municipal.rellenar_fecha(con.inicio) as FECHCONVd,
  municipal.rellenar_num(20,d.judicial) as NROTITU, municipal.rellenar_fecha(j.fecha) as FECHTITU,
  lpad(' ',20,' ') as NORANUL, '  ' as TIPOANUL, lpad(' ',10,' ') as FECHANUL,
  lpad(' ',320,' ') as 'activi importes', lpad(' ',176,' ') as 'cargo importe',
  lpad(' ',10,' ') as FCOBRO, ' ' as STAFE, ' ' as DISCRI, ' ' as NOMBREI, ' ' as ERR_BOL
  -- municipal.dreal(DATE_ADD(p.vencimiento1,INTERVAL 1 DAY), p.vencimiento1, d.avaluo, d.categ, 0) as deuda_v1,
  -- municipal.dreal(NOW(), p.vencimiento1, d.avaluo, d.categ, 0) as deuda_hoy
from municipal.dtgi d
  left join municipal.tgi t on d.cuenta = t.cod
  left join municipal.ptgi p on d.periodo = p.periodo
  left join municipal.direccion_correo_tgi dir on dir.cod = d.cuenta
  left join municipal.convenio con on con.cod = d.convenio
  left join municipal.judicial j on d.judicial = j.cod
-- where dir.calle != 0
