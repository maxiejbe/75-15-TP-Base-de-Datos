DELIMITER //
CREATE PROCEDURE Popular_Data_Warehouse()
BEGIN
	/*Cargo la tabla de hechos de checkins*/
    SELECT 
		ci.idCheckIn, ci.estado, ci.idPasajero, ci.idInstanciaVuelo,
		COUNT(b.idBulto) as cantidadBultos,
		SUM(b.peso) as pesoTotalBultos
	FROM aa2000.CheckIn ci
	LEFT JOIN aa2000.Abordaje ab ON ab.idCheckIn = ci.idCheckIn
	LEFT JOIN aa2000.DespachoEquipaje de ON de.idCheckIn = ci.idCheckIn
	LEFT JOIN aa2000.Bulto b ON b.idDespachoEquipaje = de.idDespachoEquipaje
	GROUP BY ci.idCheckIn, ci.estado, ci.idPasajero, ci.idInstanciaVuelo;
    
    /*Cargo la dimensión de vuelo*/
	SELECT 
		l.nombre as nombreLayout,
		l.cantidadFilas * l.cantidadColumnas as cantidadAsientos,
		a.matriculaAeronave,
		v.idVuelo, v.codigoAerolinea, v.codigoAeropuertoOrigen, v.codigoAeropuertoDestino,
		iv.idInstanciaVuelo, iv.fechaInstancia, iv.fechaSalida, 
		riv.estado, 
		hp.puertaSalidaConfirmada 
	FROM aa2000.InstanciaVuelo iv
	INNER JOIN aa2000.Vuelo v ON iv.idVuelo = v.idVuelo
	LEFT JOIN aa2000.RegistroInstanciaVuelo riv ON iv.idInstanciaVuelo = riv.idInstanciaVuelo
	LEFT JOIN aa2000.AsociacionAeronave aa ON aa.idRegistroInstanciaVuelo = riv.idRegistroInstanciaVuelo
	LEFT JOIN aa2000.Aeronave a ON a.matriculaAeronave = aa.matriculaAeronave
	LEFT JOIN aa2000.Layout l ON l.codigoLayout = a.codigoLayout
	LEFT JOIN aa2000.HabilitacionPuerta hp ON hp.idRegistroInstanciaVuelo = riv.idRegistroInstanciaVuelo;


END //
DELIMITER ;

	