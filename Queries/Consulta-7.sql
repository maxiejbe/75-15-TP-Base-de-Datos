/* SELECT * FROM Consulta7 where fechaInstancia > NOW() */

CREATE VIEW Consulta7 AS
	 
SELECT 
	iv.idInstanciaVuelo, iv.fechaInstancia, v.*,
	COUNT(re.codigoReserva) as cantidadReservas, COUNT(ci.idCheckIn) as cantidadCheckins
FROM
	InstanciaVuelo iv
INNER JOIN
	Vuelo v
ON
	iv.idVuelo = v.idVuelo
LEFT JOIN
	Reserva re
ON
	iv.idInstanciaVuelo = re.idInstanciaVuelo
INNER JOIN
	Pasajero p 
ON
	re.idPasajero = p.idPasajero
LEFT JOIN 
	CheckIn ci
ON
	iv.idInstanciaVuelo = ci.idInstanciaVuelo AND ci.idPasajero = p.idPasajero
GROUP BY
	iv.idInstanciaVuelo, iv.fechaInstancia