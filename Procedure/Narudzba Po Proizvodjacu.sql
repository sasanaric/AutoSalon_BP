CREATE DEFINER=`root`@`localhost` PROCEDURE `narudzbe_po_proizvodjacu`(in proizvodjac varchar(20))
BEGIN
	select * from narudzba_automobil where nazivProizvodjaca = proizvodjac;
END