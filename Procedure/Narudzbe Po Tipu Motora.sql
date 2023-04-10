CREATE DEFINER=`root`@`localhost` PROCEDURE `narudzbe_po_tipu_motora`(in motor varchar(20))
BEGIN
	select * from narudzba_automobil where tipMotora = motor;
END