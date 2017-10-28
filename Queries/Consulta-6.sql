/* SELECT * FROM Consulta6 where cantidadAeropuertos != totalAeropuertos */

CREATE VIEW Consulta6 AS
	 
SELECT 
	a.codigoAerolinea, a.nombre, count(*) as cantidadAeropuertos, (SELECT COUNT(*) from Aeropuerto) as totalAeropuertos 
FROM
	Aerolinea a
INNER JOIN
	Aerolinea_Aeropuerto aa
ON
	a.codigoAerolinea = aa.codigoAerolinea
GROUP BY
	a.codigoAerolinea, a.nombre