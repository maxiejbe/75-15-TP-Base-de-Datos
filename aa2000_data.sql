DELIMITER //
CREATE PROCEDURE Cargar_datos_iniciales()
BEGIN
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
    
    

END //
DELIMITER ;
