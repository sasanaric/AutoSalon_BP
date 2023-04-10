CREATE DEFINER=`root`@`localhost` TRIGGER `narudzba_cijena` BEFORE INSERT ON `narudzba` FOR EACH ROW BEGIN
	declare cijena_automobila decimal;
    
    select cijenaAutomobila
    into cijena_automobila
    from automobil
    where idAutomobil = new.idAutomobil;
    
    set new.cijena = cijena_automobila;
END