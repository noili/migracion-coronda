CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `direccion_correo_tgi` AS
    select 
        `t`.`cod` AS `cod`,
        if((`t`.`cod_inm` = 0),
            `t`.`calle`,
            if((`t`.`cod_inm` = 1),
                `c1`.`calle`,
                `c2`.`calle`)) AS `calle`,
        if((`t`.`cod_inm` = 0),
            convert( `t`.`altura` using utf8),
            if((`t`.`cod_inm` = 1),
                `c1`.`altura`,
                `c2`.`altura`)) AS `altura`,
        if((`t`.`cod_inm` = 0),
            ' ',
            if((`t`.`cod_inm` = 1),
                `c1`.`piso`,
                `c2`.`piso`)) AS `piso`,
        if((`t`.`cod_inm` = 0),
            convert( `t`.`dpto` using utf8),
            if((`t`.`cod_inm` = 1),
                `c1`.`dpto`,
                `c2`.`dpto`)) AS `dpto`,
        if((`t`.`cod_inm` = 0),
            `l`.`name`,
            if((`t`.`cod_inm` = 1),
                `c1`.`localidad`,
                `c2`.`localidad`)) AS `localidad`,
        `t`.`cate1` AS `cate1`,
        `t`.`cate2` AS `cate2`,
        `t`.`cate3` AS `cate3`,
        `t`.`cate4` AS `cate4`,
        `municipal`. `mi_max` (`t`.`cate1`,
                `t`.`cate2`,
                `t`.`cate3`,
                `t`.`cate4`) AS `categoria`
    from
        (((`tgi` `t`
        left join `direcciones_contribuyentes` `c1` ON ((`t`.`contri` = `c1`.`id`)))
        left join `direcciones_contribuyentes` `c2` ON ((`t`.`contri2` = `c2`.`id`)))
        left join `localidads` `l` ON ((`t`.`localidad` = `l`.`id`)))
