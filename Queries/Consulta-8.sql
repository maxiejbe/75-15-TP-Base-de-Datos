/* SELECT * FROM Consulta8 */

CREATE VIEW Consulta8 AS
	 
SELECT DISTINCT 
	a.codigoAeropuerto, a.nombre, YEAR(iv.fechaInstancia) as anoInstancia, 
    MONTH(iv.fechaInstancia) as mesInstancia, riv.estado, 
    COUNT(rivd.idInstanciaVuelo) as cantidadVuelosDespegados, 
    COUNT(rivc.idInstanciaVuelo) as cantidadVuelosCancelados,
    COUNT(riv.idInstanciaVuelo) / day(last_day(iv.fechaInstancia)) as promedioVuelosDiarios
FROM
	Aeropuerto a
INNER JOIN
	Vuelo v
ON
	v.codigoAeropuertoOrigen = a.codigoAeropuerto
INNER JOIN
	InstanciaVuelo iv
ON
	v.idVuelo = iv.idInstanciaVuelo
INNER JOIN
	RegistroInstanciaVuelo riv
ON
	iv.idInstanciaVuelo = riv.idInstanciaVuelo

LEFT JOIN
	RegistroInstanciaVuelo rivd
ON
	iv.idInstanciaVuelo = rivd.idInstanciaVuelo
	AND rivd.estado = 'DESPEGUE'
LEFT JOIN
	RegistroInstanciaVuelo rivc
ON
	iv.idInstanciaVuelo = rivc.idInstanciaVuelo
	AND rivc.estado = 'CANCELADO'
	
GROUP BY
	a.codigoAeropuerto, a.nombre, YEAR(iv.fechaInstancia), 
    MONTH(iv.fechaInstancia), riv.estado, iv.fechaInstancia