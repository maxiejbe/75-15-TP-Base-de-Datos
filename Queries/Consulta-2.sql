/* SELECT * FROM Consulta2 where codigoAeropuertoOrigen = 'ARG'*/

CREATE VIEW Consulta2 AS
SELECT 
	iv.idInstanciaVuelo, v.*, riv.estado, av.puertaSalida
FROM 
	InstanciaVuelo iv
INNER JOIN
	Vuelo v
ON
	v.idVuelo = iv.idVuelo
LEFT JOIN
	RegistroInstanciaVuelo riv
ON 
	iv.idInstanciaVuelo = riv.idInstanciaVuelo
LEFT JOIN
	AperturaVuelo av
ON
	riv.idRegistroInstanciaVuelo = av.idRegistroInstanciaVuelo
    
    