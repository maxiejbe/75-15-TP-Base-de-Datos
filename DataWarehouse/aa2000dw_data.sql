USE aa2000dw;

DELIMITER //
CREATE PROCEDURE Popular_Data_Warehouse()
BEGIN
	/*Cargo la dimensión de pasajero*/
	INSERT INTO Pasajero
    SELECT * FROM aa2000.Pasajero;
    
    /*Cargo la dimensión de aerolinea*/
	INSERT INTO Aeropuerto
    SELECT * FROM aa2000.Aeropuerto;
    
    /*Cargo la dimensión de aerolinea*/
	INSERT INTO Aerolinea
    SELECT * FROM aa2000.Aerolinea;
    
    
	/*Cargo la dimensión de vuelo*/
	INSERT INTO InstanciaVuelo
	SELECT 
		iv.idInstanciaVuelo, iv.fechaInstancia, iv.fechaSalida, 
		v.idVuelo, v.codigoAerolinea, v.codigoAeropuertoOrigen, v.codigoAeropuertoDestino,
		l.nombre as nombreLayout,
		l.cantidadFilas * l.cantidadColumnas as cantidadAsientos,
		a.matriculaAeronave,
		riv.estado, 
		hp.puertaSalidaConfirmada 
	FROM aa2000.InstanciaVuelo iv
	INNER JOIN aa2000.Vuelo v ON iv.idVuelo = v.idVuelo
	LEFT JOIN aa2000.RegistroInstanciaVuelo riv ON iv.idInstanciaVuelo = riv.idInstanciaVuelo
	LEFT JOIN aa2000.AsociacionAeronave aa ON aa.idRegistroInstanciaVuelo = riv.idRegistroInstanciaVuelo
	LEFT JOIN aa2000.Aeronave a ON a.matriculaAeronave = aa.matriculaAeronave
	LEFT JOIN aa2000.Layout l ON l.codigoLayout = a.codigoLayout
	LEFT JOIN aa2000.HabilitacionPuerta hp ON hp.idRegistroInstanciaVuelo = riv.idRegistroInstanciaVuelo;
	
    /*Cargo la dimensión de tiempo*/
    INSERT INTO Tiempo
    SELECT DISTINCT 
		NULL,
        DAY(ci.fecha), MONTH(ci.fecha), 
		CASE 
		  WHEN MONTH(ci.fecha) IN (1,2,3) THEN 1
		  WHEN MONTH(ci.fecha) IN (4,5,6) THEN 2
		  WHEN MONTH(ci.fecha) IN (7,8,9) THEN 3
		  WHEN MONTH(ci.fecha) IN (10,11,12) THEN 4 ELSE NULL 
		END,
		YEAR(ci.fecha),
    ci.fecha
    FROM aa2000.CheckIn ci;
	
    /*Cargo la tabla de hechos de checkins*/
	INSERT INTO CheckIn
	SELECT 
		ci.idCheckIn, ci.estado, ci.idPasajero, ci.idInstanciaVuelo,
		-- ci.fecha,
        (SELECT idTiempo FROM Tiempo t WHERE t.fechaCompleta = ci.fecha),
		COUNT(b.idBulto) as cantidadBultos,
		SUM(b.peso) as pesoTotalBultos
	FROM aa2000.CheckIn ci
	LEFT JOIN aa2000.Abordaje ab ON ab.idCheckIn = ci.idCheckIn
	LEFT JOIN aa2000.DespachoEquipaje de ON de.idCheckIn = ci.idCheckIn
	LEFT JOIN aa2000.Bulto b ON b.idDespachoEquipaje = de.idDespachoEquipaje
	GROUP BY ci.idCheckIn, ci.estado, ci.idPasajero, ci.idInstanciaVuelo, ci.fecha, de.fecha;

END //
DELIMITER ;

	