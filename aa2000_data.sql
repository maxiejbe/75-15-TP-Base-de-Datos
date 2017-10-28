DELIMITER //
CREATE PROCEDURE Cargar_datos_iniciales()
BEGIN
	declare cantidad_instancias_vuelo int unsigned default 30;
    declare cantidad_checkins_reservas int unsigned default 10;
    
    declare iterador_fila int unsigned default 1;
    declare iterador_columna int unsigned default 1;
    declare iterador_aeronave int unsigned default 1;
    declare iterador_layout int unsigned default 1;
    declare iterador_vuelo int unsigned default 1;
    declare iterador_instancia_vuelo int unsigned default 1;
    declare iterador_aerolinea int unsigned default 1;
    declare iterador_pasajero int unsigned default 1;
    declare iterador_checkin int unsigned default 1;
    declare iterador_reserva int unsigned default 1;
    
    declare clase varchar(20);
    declare origen varchar(3);
    declare destino varchar(3);
    declare aerolinea varchar(2);
    
    declare personal int(11);
    declare idCheckin int(11);
    
    declare estadoInstancia varchar(40);
    declare numeroEstadoInstancia int(11);
    declare fechaInstancia date;    
    declare aeronave varchar(6);
    declare puertaSalida int(11);
    
    declare estadoCheckin varchar(20);
    declare asiento int(11);
    declare pasajero int(11);
    
    declare cantidad_filas int unsigned default 1;
    declare cantidad_columnas int unsigned default 1;
    
    declare claseReserva varchar(20);
    declare cantidadReservas int(11);
    
	/* Cargar al menos 15 Aerolíneas, 7 de Cabotaje y 8 Internacionales */

	/*Aerolineas de cabotaje*/
	INSERT INTO Aerolinea VALUES('AA', 'Aerolineas Argentinas');
	INSERT INTO Aerolinea VALUES('AU', 'Austral');
	INSERT INTO Aerolinea VALUES('GO', 'Gol');
	INSERT INTO Aerolinea VALUES('TA', 'TAM');
	INSERT INTO Aerolinea VALUES('AN', 'Andes');
	INSERT INTO Aerolinea VALUES('MA', 'Macair Jet');
	INSERT INTO Aerolinea VALUES('AM', 'Amazonas');

	/*Aerolineas internacionales*/
	INSERT INTO Aerolinea VALUES('AC', 'Air Canada');
	INSERT INTO Aerolinea VALUES('AF', 'Air France');
	INSERT INTO Aerolinea VALUES('AE', 'Aeroméxico');
	INSERT INTO Aerolinea VALUES('AV', 'Avianca');
	INSERT INTO Aerolinea VALUES('AL', 'Alitalia');
	INSERT INTO Aerolinea VALUES('BR', 'British Airways');
	INSERT INTO Aerolinea VALUES('CO', 'Copa');
	INSERT INTO Aerolinea VALUES('EM', 'Emirates');
    
    /*Cargar al menos 3 operadores por Aerolínea*/
	INSERT INTO Personal VALUES(NULL, 'test1@aa2000.com', 'testing', 'AA');
    INSERT INTO Personal VALUES(NULL, 'test2@aa2000.com', 'testing', 'AA');
    INSERT INTO Personal VALUES(NULL, 'test3@aa2000.com', 'testing', 'AA');
    
    INSERT INTO Personal VALUES(NULL, 'test4@aa2000.com', 'testing', 'AU');
    INSERT INTO Personal VALUES(NULL, 'test5@aa2000.com', 'testing', 'AU');
    INSERT INTO Personal VALUES(NULL, 'test6@aa2000.com', 'testing', 'AU');
    
    INSERT INTO Personal VALUES(NULL, 'test7@aa2000.com', 'testing', 'GO');
    INSERT INTO Personal VALUES(NULL, 'test8@aa2000.com', 'testing', 'GO');
    INSERT INTO Personal VALUES(NULL, 'test9@aa2000.com', 'testing', 'GO');
    
    INSERT INTO Personal VALUES(NULL, 'test10@aa2000.com', 'testing', 'TA');
    INSERT INTO Personal VALUES(NULL, 'test11@aa2000.com', 'testing', 'TA');
    INSERT INTO Personal VALUES(NULL, 'test12@aa2000.com', 'testing', 'TA');
    
    INSERT INTO Personal VALUES(NULL, 'test13@aa2000.com', 'testing', 'AN');
    INSERT INTO Personal VALUES(NULL, 'test14@aa2000.com', 'testing', 'AN');
    INSERT INTO Personal VALUES(NULL, 'test15@aa2000.com', 'testing', 'AN');
    
    INSERT INTO Personal VALUES(NULL, 'test16@aa2000.com', 'testing', 'MA');
    INSERT INTO Personal VALUES(NULL, 'test17@aa2000.com', 'testing', 'MA');
    INSERT INTO Personal VALUES(NULL, 'test18@aa2000.com', 'testing', 'MA');
    
    INSERT INTO Personal VALUES(NULL, 'test17@aa2000.com', 'testing', 'AM');
    INSERT INTO Personal VALUES(NULL, 'test18@aa2000.com', 'testing', 'AM');
    INSERT INTO Personal VALUES(NULL, 'test19@aa2000.com', 'testing', 'AM');
    
    
    INSERT INTO Personal VALUES(NULL, 'test20@aa2000.com', 'testing', 'AC');
    INSERT INTO Personal VALUES(NULL, 'test21@aa2000.com', 'testing', 'AC');
    INSERT INTO Personal VALUES(NULL, 'test22@aa2000.com', 'testing', 'AC');
    
	INSERT INTO Personal VALUES(NULL, 'test23@aa2000.com', 'testing', 'AF');
    INSERT INTO Personal VALUES(NULL, 'test24@aa2000.com', 'testing', 'AF');
    INSERT INTO Personal VALUES(NULL, 'test25@aa2000.com', 'testing', 'AF');
    
	INSERT INTO Personal VALUES(NULL, 'test26@aa2000.com', 'testing', 'AE');
    INSERT INTO Personal VALUES(NULL, 'test27@aa2000.com', 'testing', 'AE');
    INSERT INTO Personal VALUES(NULL, 'test28@aa2000.com', 'testing', 'AE');
    
	INSERT INTO Personal VALUES(NULL, 'test29@aa2000.com', 'testing', 'AV');
    INSERT INTO Personal VALUES(NULL, 'test30@aa2000.com', 'testing', 'AV');
    INSERT INTO Personal VALUES(NULL, 'test31@aa2000.com', 'testing', 'AV');
    
	INSERT INTO Personal VALUES(NULL, 'test32@aa2000.com', 'testing', 'AL');
    INSERT INTO Personal VALUES(NULL, 'test33@aa2000.com', 'testing', 'AL');
    INSERT INTO Personal VALUES(NULL, 'test34@aa2000.com', 'testing', 'AL');
    
    INSERT INTO Personal VALUES(NULL, 'test35@aa2000.com', 'testing', 'BR');
    INSERT INTO Personal VALUES(NULL, 'test36@aa2000.com', 'testing', 'BR');
    INSERT INTO Personal VALUES(NULL, 'test37@aa2000.com', 'testing', 'BR');
    
    INSERT INTO Personal VALUES(NULL, 'test38@aa2000.com', 'testing', 'CO');
    INSERT INTO Personal VALUES(NULL, 'test39@aa2000.com', 'testing', 'CO');
    INSERT INTO Personal VALUES(NULL, 'test40@aa2000.com', 'testing', 'CO');
    
    INSERT INTO Personal VALUES(NULL, 'test41@aa2000.com', 'testing', 'EM');
    INSERT INTO Personal VALUES(NULL, 'test42@aa2000.com', 'testing', 'EM');
    INSERT INTO Personal VALUES(NULL, 'test43@aa2000.com', 'testing', 'EM');
    
	/*Cargar todas las terminales que figuran en la página de AA2000 (34 en la
	actualidad) */

	INSERT INTO Aeropuerto VALUES ('AEP', 'Buenos Aires / Aeroparque', '', 10);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Buenos Aires', '', '', '', 'AEP');

	INSERT INTO Aeropuerto VALUES ('EZE', 'Buenos Aires / Ezeiza', '', 10);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Buenos Aires', '', '', '', 'EZE');

	INSERT INTO Aeropuerto VALUES ('BRC', 'Bariloche', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Bariloche', '', '', '', 'BRC');

	INSERT INTO Aeropuerto VALUES ('CTC', 'Catamarca', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Catamarca', '', '', '', 'CTC');

	INSERT INTO Aeropuerto VALUES ('CRD', 'Comodoro Rivadavia', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Comodoro Rivadavia', '', '', '', 'CRD');

	INSERT INTO Aeropuerto VALUES ('COR', 'Córdoba', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Córdoba', '', '', '', 'COR');

	INSERT INTO Aeropuerto VALUES ('EQS', 'Esquel', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Esquel', '', '', '', 'EQS');

	INSERT INTO Aeropuerto VALUES ('FMA', 'Formosa', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Formosa', '', '', '', 'FMA');

	INSERT INTO Aeropuerto VALUES ('GPO', 'General Pico', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'General Pico', '', '', '', 'GPO');

	INSERT INTO Aeropuerto VALUES ('IGR', 'Iguazú', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Iguazú', '', '', '', 'IGR');

	INSERT INTO Aeropuerto VALUES ('JUJ', 'Jujuy', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Jujuy', '', '', '', 'JUJ');

	INSERT INTO Aeropuerto VALUES ('IRJ', 'La Rioja', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'La Rioja', '', '', '', 'IRJ');

	INSERT INTO Aeropuerto VALUES ('LGS', 'Malargue', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Malargue', '', '', '', 'LGS');

	INSERT INTO Aeropuerto VALUES ('MDQ', 'Mar del Plata', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Mar del Plata', '', '', '', 'MDQ');

	INSERT INTO Aeropuerto VALUES ('MDZ', 'Mendoza', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Mendoza', '', '', '', 'MDZ');

	INSERT INTO Aeropuerto VALUES ('PRA', 'Paraná', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Paraná', '', '', '', 'PRA');

	INSERT INTO Aeropuerto VALUES ('PSS', 'Posadas', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Posadas', '', '', '', 'PSS');

	INSERT INTO Aeropuerto VALUES ('PMY', 'Puerto Madryn', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Puerto Madryn', '', '', '', 'PMY');

	INSERT INTO Aeropuerto VALUES ('RCQ', 'Reconquista', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Reconquista', '', '', '', 'RCQ');

	INSERT INTO Aeropuerto VALUES ('RES', 'Resistencia', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Resistencia', '', '', '', 'RES');

	INSERT INTO Aeropuerto VALUES ('RCU', 'Río Cuarto', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Río Cuarto', '', '', '', 'RCU');

	INSERT INTO Aeropuerto VALUES ('RGL', 'Río Gallegos', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Río Gallegos', '', '', '', 'RGL');

	INSERT INTO Aeropuerto VALUES ('RGA', 'Río Grande', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Río Grande', '', '', '', 'RGA');

	INSERT INTO Aeropuerto VALUES ('RHD', 'Río Hondo', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Río Hondo', '', '', '', 'RHD');

	INSERT INTO Aeropuerto VALUES ('SLA', 'Salta', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Salta', '', '', '', 'SLA');

	INSERT INTO Aeropuerto VALUES ('FDO', 'San Fernando', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'San Fernando', '', '', '', 'FDO');

	INSERT INTO Aeropuerto VALUES ('UAQ', 'San Juan', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'San Juan', '', '', '', 'UAQ');

	INSERT INTO Aeropuerto VALUES ('LUQ', 'San Luis', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'San Luis', '', '', '', 'LUQ');

	INSERT INTO Aeropuerto VALUES ('AFA', 'San Rafael', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'San Rafael', '', '', '', 'AFA');

	INSERT INTO Aeropuerto VALUES ('RSA', 'Santa Rosa', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Santa Rosa', '', '', '', 'RSA');

	INSERT INTO Aeropuerto VALUES ('SDE', 'Sgo. del Estero', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Sgo. del Estero', '', '', '', 'SDE');

	INSERT INTO Aeropuerto VALUES ('TUC', 'Tucumán', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Tucumán', '', '', '', 'TUC');

	INSERT INTO Aeropuerto VALUES ('VDM', 'Viedma', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Viedma', '', '', '', 'VDM');

	INSERT INTO Aeropuerto VALUES ('VME', 'Villa Mercedes', '', 5);
	INSERT INTO AeropuertoArgentino VALUES (NULL, 'Villa Mercedes', '', '', '', 'VME');

	/*Cargar Terminales de Auto-Checkin, de Checkin Personal y despacho de
	equipaje, con una distribución normal, garantizando un mínimo de 3 terminales
	de cada tipo en cada terminal*/
	INSERT INTO TerminalAutogestion VALUES(1);
	INSERT INTO TerminalAutogestion VALUES(2);
	INSERT INTO TerminalAutogestion VALUES(3);
	INSERT INTO TerminalFisica VALUES(1);
	INSERT INTO TerminalFisica VALUES(2);
	INSERT INTO TerminalFisica VALUES(3);

	/*Cargar al menos 10 terminales externas, de al menos 3 países distintos*/
	INSERT INTO Aeropuerto VALUES ('VIE', 'Aeropuerto Internacional de Viena', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Austria', 'VIE');

	INSERT INTO Aeropuerto VALUES ('SZG', 'Aeropuerto W.A.Mozart', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Austria', 'SZG');

	INSERT INTO Aeropuerto VALUES ('INN', 'Aeropuerto de Innsbruck', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Austria', 'INN');

	INSERT INTO Aeropuerto VALUES ('ANE', 'Aeropuerto de Angers-Loire', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Francia', 'ANE');

	INSERT INTO Aeropuerto VALUES ('ANG', 'Aeropuerto de Angoulême-Brie Champniers', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Francia', 'ANG');

	INSERT INTO Aeropuerto VALUES ('NCY', 'Aeropuerto de Annecy-Haut Savoie', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Francia', 'NCY');


	INSERT INTO Aeropuerto VALUES ('LIN', 'Aeropuerto de Milán-Linate', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Italia', 'LIN');

	INSERT INTO Aeropuerto VALUES ('MXP', 'Aeropuerto de Milán-Malpensa', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Italia', 'MXP');

	INSERT INTO Aeropuerto VALUES ('CIA', 'Aeropuerto de Roma-Ciampino', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Italia', 'CIA');

	INSERT INTO Aeropuerto VALUES ('FCO', 'Aeropuerto de Roma-Fiumicino', '', 8);
	INSERT INTO AeropuertoExterno VALUES (NULL, '', 'Italia', 'FCO');
    
    /*Cargar al menos 150 Aeronaves, 10 en promedio para cada Aerolínea (no es
	necesario que todas que tengan 10, pero al menos, una aeronave), con al
	menos 3 Layouts distintos*/
	while iterador_layout <= 3 do
		set cantidad_filas = ROUND((RAND() * (30-10))+10); 
		set cantidad_columnas = ROUND((RAND() * (8-4))+4);
		
		INSERT INTO Layout values (NULL, CONCAT('Layout ', iterador_layout), cantidad_filas, cantidad_columnas);
		set iterador_layout=iterador_layout+1;
        
		set iterador_fila=1;
        
		while iterador_fila <= cantidad_filas do
			set clase='TURISTA';
            IF iterador_fila<=4 THEN
            	set clase='PRIMERA_CLASE';
			END IF;
            
            IF iterador_fila>4 AND iterador_fila<=6 THEN
				set clase='BUSINESS';
			END IF;
			
            set iterador_columna=1;
            while iterador_columna <= cantidad_columnas do
				INSERT INTO Asiento VALUES (NULL, iterador_fila, iterador_columna, clase, false, '', iterador_layout - 1);
				set iterador_columna=iterador_columna+1;
            end while;
            
            set iterador_fila=iterador_fila+1;
		end while;
        
	end while;
    
    while iterador_aeronave <= 150 do
	    INSERT INTO Aeronave values((SELECT LEFT(UUID(), 6)),60, 10000, ROUND((RAND() * (3-1))+1));
		set iterador_aeronave=iterador_aeronave+1;
    end while;
    
	/*
    Cargar al menos 100 vuelos, donde el 15% sean internacionales (con Terminal
	de Destino en Terminales no propias)
	*/
    while iterador_vuelo <= 85 do
	    set aerolinea=(SELECT codigoAerolinea FROM Aerolinea ORDER BY RAND() LIMIT 1);
        set origen=(SELECT codigoAeropuerto FROM AeropuertoArgentino ORDER BY RAND() LIMIT 1);
        set destino=(SELECT codigoAeropuerto FROM AeropuertoArgentino ORDER BY RAND() LIMIT 1);
        
        /*Posible formato de idVuelo: CONCAT(aerolinea,1000 + iterador_vuelo)*/
        INSERT INTO Vuelo values(NULL, aerolinea, origen, destino);
		
        set iterador_vuelo=iterador_vuelo+1;
    end while;
    
    while iterador_vuelo <= 100 do
	    set aerolinea=(SELECT codigoAerolinea FROM Aerolinea ORDER BY RAND() LIMIT 1);
        set origen=(SELECT codigoAeropuerto FROM AeropuertoExterno ORDER BY RAND() LIMIT 1);
        set destino=(SELECT codigoAeropuerto FROM AeropuertoExterno ORDER BY RAND() LIMIT 1);
        
        /*Posible formato de idVuelo: CONCAT(aerolinea,1000 + iterador_vuelo)*/
        INSERT INTO Vuelo values(NULL, aerolinea, origen, destino);
		
        set iterador_vuelo=iterador_vuelo+1;
    end while;    
    
    /*Autorizar aerolineas a operar en los aeropuertos donde creamos los vuelos*/
    INSERT INTO Aerolinea_Aeropuerto
    SELECT DISTINCT codigoAerolinea, codigoAeropuertoOrigen as codigoAeropuerto FROM Vuelo;
    
    /*Cargar pasajeros*/
	set iterador_pasajero=1;
    while iterador_pasajero <= 1000 do
		INSERT INTO Pasajero VALUES (NULL, CONCAT('3000000',iterador_pasajero),CONCAT('Pepe',iterador_pasajero), CONCAT('Castro',iterador_pasajero), 'ARG');
		set iterador_pasajero=iterador_pasajero+1;
    end while;

    
    while iterador_instancia_vuelo <= cantidad_instancias_vuelo do	    
        /*
		Cargar al menos 1000 instancias de vuelos, distribuidos aleatoriamente entre
		las fechas 01-07-2017 y 31-12-2017. Contemplar la carga de todos los estados
		previos, dependiendo del estado actual (por ejemplo, si se carga una instancia
		cuyo estado actual es Carga de Combustible, deben estar cargados los estados
		previos Apertura, Asociación, Habilitación, etc.)
		*/
		
        SET @MIN = '2017-07-01 00:00:00';
        SET @MAX = '2017-12-31 23:59:59';
        set fechaInstancia = (SELECT TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
		set personal = (SELECT idPersonal FROM Personal ORDER BY RAND() LIMIT 1);
        
        INSERT INTO InstanciaVuelo values(NULL, fechaInstancia, fechaInstancia, fechaInstancia, 40, personal, ROUND((RAND() * (100-1))+1));
		
        IF fechaInstancia >= now() THEN
			set numeroEstadoInstancia = (1 + FLOOR(RAND()*9));
			set estadoInstancia = ELT(numeroEstadoInstancia, 'APERTURA_INSTANCIA_VUELO', 'ASOCIACION_AERONAVE', 'AERONAVE_HABILITADA', 'HABILITACION_PUERTA', 'CARGA_COMBUSTIBLE', 'CARGA_PASAJERO', 'DESPACHADO', 'DESPEGUE', 'CANCELADO');
        END IF;
        
        IF fechaInstancia < now() THEN
			set numeroEstadoInstancia = 9;
            set estadoInstancia = 'DESPEGUE';
        END IF;
        
        INSERT INTO RegistroInstanciaVuelo VALUES(NULL, estadoInstancia, iterador_instancia_vuelo);
        
        set puertaSalida = ROUND((RAND() * (5-1))+1);
        
        IF numeroEstadoInstancia >= 1 THEN
			INSERT INTO AperturaVuelo VALUES(NULL, puertaSalida, iterador_instancia_vuelo);
        END IF;
        
        IF numeroEstadoInstancia >= 2 THEN
			set aeronave = (SELECT matriculaAeronave FROM Aeronave ORDER BY RAND() LIMIT 1);
			INSERT INTO AsociacionAeronave VALUES(NULL, aeronave, iterador_instancia_vuelo);
        END IF;
        
		IF numeroEstadoInstancia >= 4 THEN
			INSERT INTO HabilitacionPuerta VALUES(NULL, puertaSalida, iterador_instancia_vuelo);
        END IF;
        
        IF numeroEstadoInstancia = 8 THEN
			INSERT INTO RegistroDespegue VALUES(NULL, 100, 100, 'DESPEGADO', iterador_instancia_vuelo);
        END IF;
        
        /*
		Cargar pasajeros con reservas, checkins y despachos de equipaje; siguiendo
		una distribución normal, teniendo en cuenta que los vuelos en el pasado
		tengan un porcentaje de ocupación cercano al 90%, y para aquellos vuelos en el
		futuro, un porcentaje menor decreciente
		*/
        
        /*set claseReserva = ELT((1 + FLOOR(RAND()*3)), 'TURISTA', 'BUSINESS', 'PRIMERA_CLASE');*/
        set claseReserva = 'TURISTA';
        
		set iterador_checkin=1;
		while iterador_checkin <= cantidad_checkins_reservas do	    
			/*'PENDIENTE', 'DESPACHADO'*/
			set estadoCheckin = ELT((1 + FLOOR(RAND()*2)), 'ABORDAJE', 'INHIBIDO');
			set asiento = (SELECT codigoAsiento FROM Asiento ORDER BY RAND() LIMIT 1);
			set pasajero = (SELECT idPasajero FROM Pasajero ORDER BY RAND() LIMIT 1);
			set personal = (SELECT idPersonal FROM Personal ORDER BY RAND() LIMIT 1);
			
			INSERT INTO Reserva VALUES (NULL, 'CONFIRMADA', fechaInstancia, NULL, claseReserva, pasajero, iterador_instancia_vuelo);
			INSERT INTO CheckIn VALUES (NULL, estadoCheckin, pasajero, iterador_instancia_vuelo, asiento);
			set idCheckin = LAST_INSERT_ID();
			INSERT INTO CheckInPresencial VALUES(NULL, idCheckin, personal,ROUND((RAND() * (3-1))+1));
			
			IF estadoCheckin = 'ABORDAJE' THEN
				INSERT INTO DespachoEquipaje VALUES (NULL, idCheckin, personal, ROUND((RAND() * (3-1))+1), fechaInstancia);
				INSERT INTO Bulto VALUES (NULL, LAST_INSERT_ID(), 5);
			END IF;
			
			set iterador_checkin=iterador_checkin+1;
		end while;
        
        set iterador_instancia_vuelo=iterador_instancia_vuelo+1;
    end while;    
    
END //
DELIMITER ;
