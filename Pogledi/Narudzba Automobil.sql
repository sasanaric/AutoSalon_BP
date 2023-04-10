CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `narudzba_automobil` AS
    SELECT 
        `narudzba_info`.`idAutomobil` AS `idAutomobil`,
        `narudzba_info`.`idNarudzba` AS `idNarudzba`,
        `narudzba_info`.`datumNarudzbe` AS `datumNarudzbe`,
        `narudzba_info`.`datumDolaska` AS `datumDolaska`,
        `automobil_info`.`nazivProizvodjaca` AS `nazivProizvodjaca`,
        `automobil_info`.`nazivModela` AS `nazivModela`,
        `automobil_info`.`tipAutomobila` AS `tipAutomobila`,
        `automobil_info`.`tipMotora` AS `tipMotora`,
        `automobil_info`.`nivoOpreme` AS `nivoOpreme`,
        `automobil_info`.`bojaAuta` AS `bojaAuta`,
        `automobil_info`.`cijenaAutomobila` AS `cijenaAutomobila`
    FROM
        (`narudzba_info`
        JOIN `automobil_info` ON ((`narudzba_info`.`idAutomobil` = `automobil_info`.`idAutomobil`)))