-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_interes`(f_pago date, vencimiento date, costo90 FLOAT, costoreal FLOAT, pago FLOAT) RETURNS float
BEGIN
declare interes FLOAT;
declare dreal_pago FLOAT;
set dreal_pago = municipal.dreal(f_pago, vencimiento, costoreal, 0, costo90);
IF f_pago IS NOT NULL THEN
  IF pago < dreal_pago THEN
    set interes = 0;
  ELSE
    set interes = dreal_pago - costoreal;
  END IF;
ELSE 
  set interes = municipal.dreal(NOW(), vencimiento, costoreal, 0, costo90) - costoreal;
END IF;
IF interes < 0 then 
  set interes = 0;
END IF;
RETURN interes;
END
