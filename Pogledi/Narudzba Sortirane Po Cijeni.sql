CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `narudzbe_sortirane_cijena` AS
    SELECT 
        `narudzba_automobil`.`idAutomobil` AS `idAutomobil`,
        `narudzba_automobil`.`idNarudzba` AS `idNarudzba`,
        `narudzba_automobil`.`datumNarudzbe` AS `datumNarudzbe`,
        `narudzba_automobil`.`datumDolaska` AS `datumDolaska`,
        `narudzba_automobil`.`nazivProizvodjaca` AS `nazivProizvodjaca`,
        `narudzba_automobil`.`nazivModela` AS `nazivModela`,
        `narudzba_automobil`.`tipAutomobila` AS `tipAutomobila`,
        `narudzba_automobil`.`tipMotora` AS `tipMotora`,
        `narudzba_automobil`.`nivoOpreme` AS `nivoOpreme`,
        `narudzba_automobil`.`bojaAuta` AS `bojaAuta`,
        `narudzba_automobil`.`cijenaAutomobila` AS `cijenaAutomobila`
    FROM
        `narudzba_automobil`
    ORDER BY `narudzba_automobil`.`cijenaAutomobila` DESC