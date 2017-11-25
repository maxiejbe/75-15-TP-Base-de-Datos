/* SELECT * FROM Reporte */

CREATE VIEW Reporte AS
SELECT 
	iv.idInstanciaVuelo, 
    iv.fechaInstancia, 
    iv.codigoAerolinea, 
    iv.codigoAeropuertoOrigen, 
    iv.codigoAeropuertoDestino,
    COUNT(ci.idCheckIn) as cantidadPasajeros,
    SUM(ci.cantidadTotalBultos) as cantidadBultosDespachados,
    SUM(ci.pesoTotalBultos) as pesoTotalBultosDespachados,
    AVG(ci.pesoTotalBultos / ci.cantidadTotalBultos) as pesoPromedioBultosDespachados,
    avg(timestampdiff(HOUR, fecha, iv.fechaSalida)) AS promedioEnHorasTiempoCheckInDespegue
FROM
	CheckIn ci
INNER JOIN
	InstanciaVuelo iv
ON
	ci.idInstanciaVuelo = iv.IdInstanciaVuelo
GROUP BY
	iv.idInstanciaVuelo, 
    iv.fechaInstancia, 
    iv.codigoAerolinea, 
    iv.codigoAeropuertoOrigen, 
    iv.codigoAeropuertoDestino