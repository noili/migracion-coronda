-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `estado`(pago float, convenio int, judicial int, borrada int, cancelada int) RETURNS char(1) CHARSET latin1
BEGIN
  declare estado char;
  if pago is not null then set estado = 'T';
  else if borrada = 1 then set estado = 'N';
    else if convenio is not null or judicial is not null then set estado = 'N';
      else set 
		estado = 'A';
	  end if;
    end if;
  end if;
  return estado;
END
