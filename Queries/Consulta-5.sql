/* SELECT * FROM Consulta5 where codigoAerolinea = 'AV'*/

CREATE VIEW Consulta5 AS
	 
SELECT 
	v.codigoAerolinea, a.nombre as nombreAerolinea, re.codigoReserva, re.estado, 
    iv.idInstanciaVuelo, iv.fechaInstancia, v.codigoAeropuertoOrigen, v.codigoAeropuertoDestino
FROM 
	Reserva re
INNER JOIN
	InstanciaVuelo iv 
ON
	re.idInstanciaVuelo = iv.idInstanciaVuelo
INNER JOIN
	Vuelo v
ON
	iv.idVuelo = v.idVuelo
INNER JOIN 
	Aerolinea a
ON
	v.codigoAerolinea = a.codigoAerolinea

    