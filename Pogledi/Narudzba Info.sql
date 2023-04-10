CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `narudzba_info` AS
    SELECT 
        `narudzba`.`idNarudzba` AS `idNarudzba`,
        `narudzba`.`idAutomobil` AS `idAutomobil`,
        `narudzba`.`datumNarudzbe` AS `datumNarudzbe`,
        `narudzba`.`datumDolaska` AS `datumDolaska`
    FROM
        `narudzba`