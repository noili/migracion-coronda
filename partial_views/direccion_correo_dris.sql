CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `direccion_correo_dris` AS
    select 
        `t`.`id` AS `id`,
        `t`.`calle_id` AS `calle`,
        `t`.`altura` AS `altura`,
        '  ' AS `piso`,
        `t`.`dpto` AS `dpto`,
        `l`.`name` AS `localidad`
    from
        (`dris` `t`
        left join `localidads` `l` ON ((`t`.`localidad_id` = `l`.`id`)))
