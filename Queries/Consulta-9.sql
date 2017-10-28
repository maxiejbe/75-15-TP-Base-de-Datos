/* 
SELECT codigoAerolinea, nombre, MAX(cantidadCheckins) 
FROM Consulta9 
WHERE anoInstancia = 2017 AND mesInstancia = 7
GROUP BY codigoAerolinea, nombre
*/

CREATE VIEW Consulta9 AS
	 
SELECT 
	a.codigoAerolinea, a.nombre, YEAR(iv.fechaInstancia) as anoInstancia, 
    MONTH(iv.fechaInstancia) as mesInstancia, 
    COUNT(re.codigoReserva) as cantidadReservasConfirmadas, 
    COUNT(ci.idCheckIn) as cantidadCheckins
FROM
	Aerolinea a
INNER JOIN
	Vuelo v
ON
	v.codigoAerolinea = a.codigoAerolinea
INNER JOIN
	InstanciaVuelo iv
ON
	v.idVuelo = iv.idInstanciaVuelo
INNER JOIN
	Reserva re
ON
	iv.idInstanciaVuelo = re.idInstanciaVuelo
    AND re.estado = 'CONFIRMADA'
LEFT JOIN 
	CheckIn ci
ON
	iv.idInstanciaVuelo = ci.idInstanciaVuelo AND ci.idPasajero = re.idPasajero
    
GROUP BY
	a.codigoAerolinea, a.nombre, YEAR(iv.fechaInstancia), MONTH(iv.fechaInstancia)