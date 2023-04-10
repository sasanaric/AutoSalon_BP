CREATE DEFINER=`root`@`localhost` TRIGGER `insert_cijena` BEFORE INSERT ON `automobil` FOR EACH ROW BEGIN
	declare pocetnaCijena decimal;
    declare procenatOpreme double;
    
    select cijenaModela
    into pocetnaCijena
    from model
    where idModel = new.idModel;
    
    select procenat
    into procenatOpreme
    from oprema
    where idOprema = new.idOprema;
    
    set new.cijenaAutomobila = pocetnaCijena + procenatOpreme*pocetnaCijena;
END