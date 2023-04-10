CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `automobil_info` AS
    SELECT 
        `automobil`.`idAutomobil` AS `idAutomobil`,
        `proizvodjac`.`nazivProizvodjaca` AS `nazivProizvodjaca`,
        `model`.`nazivModela` AS `nazivModela`,
        `tip`.`tipAutomobila` AS `tipAutomobila`,
        `motor`.`tipMotora` AS `tipMotora`,
        `oprema`.`nivoOpreme` AS `nivoOpreme`,
        `bojaauta`.`bojaAuta` AS `bojaAuta`,
        `automobil`.`cijenaAutomobila` AS `cijenaAutomobila`
    FROM
        ((((((`automobil`
        JOIN `model` ON ((`automobil`.`idModel` = `model`.`idModel`)))
        JOIN `proizvodjac` ON ((`model`.`idProizvodjac` = `proizvodjac`.`idProizvodjac`)))
        JOIN `tip` ON ((`automobil`.`idTip` = `tip`.`idTip`)))
        JOIN `motor` ON ((`automobil`.`idMotor` = `motor`.`idMotor`)))
        JOIN `oprema` ON ((`automobil`.`idOprema` = `oprema`.`idOprema`)))
        JOIN `bojaauta` ON ((`automobil`.`idBojaAuta` = `bojaauta`.`idBojaAuta`)))