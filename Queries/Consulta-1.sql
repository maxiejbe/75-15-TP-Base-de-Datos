CREATE VIEW Consulta1 AS
SELECT 
	iv.idInstanciaVuelo, iv.fechaInstancia, p.dni as dniPasajero, CONCAT(p.nombre, ' ', p.apellido) as nombreCompletoPasajero, re.codigoReserva, ci.estado as estadoCheckin
FROM 
	InstanciaVuelo iv
INNER JOIN 
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
	iv.idInstanciaVuelo = ci.idInstanciaVuelo;
    