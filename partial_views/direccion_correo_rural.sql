CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `direccion_correo_rural` AS
    select 
        `t`.`cod` AS `cod`,
        if((`t`.`cod_correo` = 0),
            `t`.`calle`,
            if((`t`.`cod_correo` = 1),
                `c1`.`calle`,
                `c2`.`calle`)) AS `calle`,
        if((`t`.`cod_correo` = 0),
            `t`.`altura`,
            if((`t`.`cod_correo` = 1),
                `c1`.`altura`,
                `c2`.`altura`)) AS `altura`,
        if((`t`.`cod_correo` = 0),
            ' ',
            if((`t`.`cod_correo` = 1),
                `c1`.`piso`,
                `c2`.`piso`)) AS `piso`,
        if((`t`.`cod_correo` = 0),
            convert( `t`.`dpto` using utf8),
            if((`t`.`cod_correo` = 1),
                `c1`.`dpto`,
                `c2`.`dpto`)) AS `dpto`,
        if((`t`.`cod_correo` = 0),
            `l`.`name`,
            if((`t`.`cod_correo` = 1),
                `c1`.`localidad`,
                `c2`.`localidad`)) AS `localidad`
    from
        (((`rural` `t`
        left join `direcciones_contribuyentes` `c1` ON ((`t`.`contri` = `c1`.`id`)))
        left join `direcciones_contribuyentes` `c2` ON ((`t`.`contri2` = `c2`.`id`)))
        left join `localidads` `l` ON ((`t`.`localidad` = `l`.`id`)))
