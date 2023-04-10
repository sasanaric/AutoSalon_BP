CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `broj_prodanih_po_proizvodjacu` AS
    SELECT 
        `narudzba_automobil`.`nazivProizvodjaca` AS `nazivProizvodjaca`,
        COUNT(0) AS `brojProdanih`
    FROM
        `narudzba_automobil`
    GROUP BY `narudzba_automobil`.`nazivProizvodjaca`