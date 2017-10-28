/* SELECT * FROM Consulta3 where idPersonal = 1*/

CREATE VIEW Consulta3 AS
	 
SELECT 
	d.fecha, 'DESPACHO_EQUIPAJE' as accion, d.nroTerminal, d.idPersonalRealiza as idPersonal
FROM 
	DespachoEquipaje d

UNION

SELECT 
	a.fecha, 'ABORDAJE' as accion, a.nroTerminal, a.idPersonalRealiza as idPersonal
FROM 
	Abordaje a

UNION

SELECT 
	ca.fecha, 'CAMBIO_ASIENTO' as accion, ca.nroTerminal, ca.idPersonalRealiza as idPersonal
FROM 
	Abordaje ca

