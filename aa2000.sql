CREATE DATABASE IF NOT EXISTS aa2000;
use aa2000;

CREATE TABLE IF NOT EXISTS Pasajero (
  idPasajero int(11) NOT NULL AUTO_INCREMENT,
  dni varchar(20) NOT NULL,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  nacionalidad varchar(20) NOT NULL,
  PRIMARY KEY (idPasajero)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS Aeropuerto (
  codigoAeropuerto int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(50) not null,
  codigoInternacionalIATA varchar(3) not null,
  PRIMARY KEY (codigoAeropuerto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS AeropuertoArgentino (
  codigoAeropuertoArgentino int(11) NOT NULL AUTO_INCREMENT,
  ciudad varchar(20) NOT NULL,
  provincia varchar(20) NOT NULL,
  categoria varchar(20) NOT NULL,
  codigoInternacionalFAA varchar(3) not null,
  codigoAeropuerto int(11) NOT NULL,
  PRIMARY KEY (codigoAeropuertoArgentino),
  FOREIGN KEY fk_Aeropuerto(codigoAeropuerto) REFERENCES Aeropuerto(codigoAeropuerto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS AeropuertoExterno (
  codigoAeropuertoExterno int(11) NOT NULL AUTO_INCREMENT,
  region varchar(20) NOT NULL,
  pais varchar(20) NOT NULL,
  codigoAeropuerto int(11) NOT NULL,
  PRIMARY KEY (codigoAeropuertoExterno),
  FOREIGN KEY fk_Aeropuerto(codigoAeropuerto) REFERENCES Aeropuerto(codigoAeropuerto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS Aerolinea (
  codigoAerolinea varchar(2) NOT NULL,
  nombre varchar(50) not null,
  PRIMARY KEY (codigoAerolinea)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS TerminalAeroportuaria (
  idTerminalAeroportuaria int(11) NOT NULL AUTO_INCREMENT,
  cantidadPuertas int not null,
  codigoAeropuerto int(11) NOT NULL,
  PRIMARY KEY (idTerminalAeroportuaria),
  FOREIGN KEY fk_Aeropuerto(codigoAeropuerto) REFERENCES Aeropuerto(codigoAeropuerto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Aerolinea_TerminalAeroportuaria (
  codigoAerolinea varchar(2) not null,
  idTerminalAeroportuaria int(11) NOT NULL,
  PRIMARY KEY (codigoAerolinea, idTerminalAeroportuaria),
  FOREIGN KEY fk_Aerolinea(codigoAerolinea) REFERENCES Aerolinea(codigoAerolinea),
  FOREIGN KEY fk_TerminalAeroportuaria(idTerminalAeroportuaria) REFERENCES TerminalAeroportuaria(idTerminalAeroportuaria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS Personal (
  idPersonal int(11) NOT NULL AUTO_INCREMENT,
  usuario varchar(20) NOT NULL,
  contrasena varchar(50) NOT NULL,
  codigoAerolinea varchar(2) not null,
  PRIMARY KEY (idPersonal),
  FOREIGN KEY fk_Aerolinea(codigoAerolinea) REFERENCES Aerolinea(codigoAerolinea)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Vuelo (
  idVuelo int(11) NOT NULL AUTO_INCREMENT,
  codigoAerolinea varchar(2) not null,
  codigoAeropuertoOrigen int(11) not null,
  codigoAeropuertoDestino int(11) not null,
  idTerminalAeroportuaria int(11) NOT NULL,
  PRIMARY KEY (idVuelo),
  FOREIGN KEY fk_Aerolinea(codigoAerolinea) REFERENCES Aerolinea(codigoAerolinea),
  FOREIGN KEY fk_Aeropuerto_Origen(codigoAeropuertoOrigen) REFERENCES Aeropuerto(codigoAeropuerto),
  FOREIGN KEY fk_Aeropuerto_Destino(codigoAeropuertoDestino) REFERENCES Aeropuerto(codigoAeropuerto),
  FOREIGN KEY fk_TerminalAeroportuaria(idTerminalAeroportuaria) REFERENCES TerminalAeroportuaria(idTerminalAeroportuaria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS InstanciaVuelo (
  idInstanciaVuelo int(11) NOT NULL AUTO_INCREMENT,
  fechaInstancia DATE NOT NULL,
  fechaInicioPasajes DATE NOT NULL,
  fechaSalida DATE NOT NULL,
  cantidadMinimaAsientos int(11) NOT NULL,
  idPersonalAutoriza int(11) not null,
  idVuelo int(11) not null,
  PRIMARY KEY (idInstanciaVuelo),
  FOREIGN KEY fk_Personal(idPersonalAutoriza) REFERENCES Personal(idPersonal),
  FOREIGN KEY fk_Vuelo(idVuelo) REFERENCES Vuelo(idVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS RegistroInstanciaVuelo (
  idRegistroInstanciaVuelo int(11) NOT NULL AUTO_INCREMENT,
  estado varchar(20) NOT NULL,
  idInstanciaVuelo int(11) not null,
  PRIMARY KEY (idRegistroInstanciaVuelo),
  FOREIGN KEY fk_InstanciaVuelo(idInstanciaVuelo) REFERENCES InstanciaVuelo(idInstanciaVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS AperturaVuelo (
  idAperturaVuelo int(11) NOT NULL AUTO_INCREMENT,
  puertaSalida int not null,
  idRegistroInstanciaVuelo int(11) not null,
  PRIMARY KEY (idAperturaVuelo),
  FOREIGN KEY fk_RegistroInstanciaVuelo(idRegistroInstanciaVuelo) REFERENCES RegistroInstanciaVuelo(idRegistroInstanciaVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS RegistroDespegue (
  idRegistroDespegue int(11) NOT NULL AUTO_INCREMENT,
  codigoAutorizacionSalida int,
  ordenDeSalida int,
  estado varchar(20) NOT NULL,
  idRegistroInstanciaVuelo int(11) not null,
  PRIMARY KEY (idRegistroDespegue),
  FOREIGN KEY fk_RegistroInstanciaVuelo(idRegistroInstanciaVuelo) REFERENCES RegistroInstanciaVuelo(idRegistroInstanciaVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS HabilitacionPuerta (
  idHabilitacionPuerta int(11) NOT NULL AUTO_INCREMENT,
  puertaSalidaConfirmada int(11) not null,
  idRegistroInstanciaVuelo int(11) not null,
  PRIMARY KEY (idHabilitacionPuerta),
  FOREIGN KEY fk_RegistroInstanciaVuelo(idRegistroInstanciaVuelo) REFERENCES RegistroInstanciaVuelo(idRegistroInstanciaVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Layout (
  codigoLayout int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(20) not null,
  cantidadFilas int not null,
  cantidadColumnas int not null,
  PRIMARY KEY (codigoLayout)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Asiento (
  codigoAsiento int(11) NOT NULL,
  clase varchar(20) not null,
  esSalidaEmergencia bool not null,
  seccion varchar(20),
  codigoLayout int(11) not null,
  PRIMARY KEY (codigoAsiento),
  FOREIGN KEY fk_Layout(codigoLayout) REFERENCES Layout(codigoLayout)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Aeronave (
  matriculaAeronave varchar(6) NOT NULL,
  autonomiaVuelo double not null,
  autonomiaCombustible double not null,
  codigoLayout int(11) not null,
  PRIMARY KEY (matriculaAeronave),
  FOREIGN KEY fk_Layout(codigoLayout) REFERENCES Layout(codigoLayout)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS AsociacionAeronave (
  idAsociacionAeronave int(11) NOT NULL AUTO_INCREMENT,
  matriculaAeronave varchar(6) not null,
  idRegistroInstanciaVuelo int(11) not null,
  PRIMARY KEY (idAsociacionAeronave),
  FOREIGN KEY fk_RegistroInstanciaVuelo(idRegistroInstanciaVuelo) REFERENCES RegistroInstanciaVuelo(idRegistroInstanciaVuelo),
  FOREIGN KEY fk_Aeronave(matriculaAeronave) REFERENCES Aeronave(matriculaAeronave)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CheckIn (
  idCheckIn int(11) NOT NULL AUTO_INCREMENT,
  estado VARCHAR(50) NOT NULL,
  idPasajero int(11) NOT NULL,
  idInstanciaVuelo int(11) NOT NULL,
  codigoAsiento int(11),
  PRIMARY KEY (idCheckIn),
  FOREIGN KEY fk_Pasajero(idPasajero) REFERENCES Pasajero(idPasajero),
  FOREIGN KEY fk_InstanciaVuelo(idInstanciaVuelo) REFERENCES InstanciaVuelo(idInstanciaVuelo),
  FOREIGN KEY fk_Asiento(codigoAsiento) REFERENCES Asiento(codigoAsiento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CambioAsiento (
  idCambioAsiento int(11) NOT NULL AUTO_INCREMENT,
  idCheckIn int(11) NOT NULL,
  codigoAsientoViejo int(11) NOT NULL,
  codigoAsientoNuevo int(11) NOT NULL,
  PRIMARY KEY (idCambioAsiento),
  FOREIGN KEY fk_CheckIn(idCheckIn) REFERENCES CheckIn(idCheckIn),
  FOREIGN KEY fk_Asiento_Viejo(codigoAsientoViejo) REFERENCES Asiento(codigoAsiento),
  FOREIGN KEY fk_Asiento_Nuevo(codigoAsientoNuevo) REFERENCES Asiento(codigoAsiento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CheckInOnline (
  idCheckInOnline int(11) NOT NULL AUTO_INCREMENT,
  idCheckIn int(11) NOT NULL,
  idSistemaExterno VARCHAR(50) NOT NULL,
  idTransaccionExterna int(11) NOT NULL,
  estadoTransaccionExterna VARCHAR(50) NOT NULL,
  PRIMARY KEY (idCheckInOnline),
  FOREIGN KEY fk_CheckIn(idCheckIn) REFERENCES CheckIn(idCheckIn)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS TerminalAutogestion (
  nroTerminal int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (nroTerminal)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CheckInAutogestion (
  idCheckInAutogestion int(11) NOT NULL AUTO_INCREMENT,
  idCheckIn int(11) NOT NULL,
  dni VARCHAR(20) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  nacionalidad VARCHAR(20) NOT NULL,
  nroVuelo int(11) NOT NULL,
  nroTerminal int(11) NOT NULL,
  PRIMARY KEY (idCheckInAutogestion),
  FOREIGN KEY fk_CheckIn(idCheckIn) REFERENCES CheckIn(idCheckIn),
  FOREIGN KEY fk_TerminalAutogestion(nroTerminal) REFERENCES TerminalAutogestion(nroTerminal)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS TerminalFisica (
  nroTerminal int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (nroTerminal)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CheckInPresencial (
  idCheckInPresencial int(11) NOT NULL AUTO_INCREMENT,
  idCheckIn int(11) not null,
  idPersonalOpera int(11) not null,
  nroTerminal int(11) not null,
  PRIMARY KEY (idCheckInPresencial),
  FOREIGN KEY fk_CheckIn(idCheckIn) REFERENCES CheckIn(idCheckIn),
  FOREIGN KEY fk_Personal(idPersonalOpera) REFERENCES Personal(idPersonal),
  FOREIGN KEY fk_TerminalFisica(nroTerminal) REFERENCES TerminalFisica(nroTerminal)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS Abordaje (
  idAbordaje int(11) NOT NULL AUTO_INCREMENT,
  idCheckIn int(11) not null,
  idPersonalRealiza int(11) not null,
  nroTerminal int(11) not null,
  PRIMARY KEY (idAbordaje),
  FOREIGN KEY fk_CheckIn(idCheckIn) REFERENCES CheckIn(idCheckIn),
  FOREIGN KEY fk_Personal(idPersonalRealiza) REFERENCES Personal(idPersonal),
  FOREIGN KEY fk_TerminalFisica(nroTerminal) REFERENCES TerminalFisica(nroTerminal)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS DespachoEquipaje (
  idDespachoEquipaje int(11) NOT NULL AUTO_INCREMENT,
  idCheckIn int(11) not null,
  idPersonalRealiza int(11) not null,
  nroTerminal int(11) not null,
  PRIMARY KEY (idDespachoEquipaje),
  FOREIGN KEY fk_CheckIn(idCheckIn) REFERENCES CheckIn(idCheckIn),
  FOREIGN KEY fk_Personal(idPersonalRealiza) REFERENCES Personal(idPersonal),
  FOREIGN KEY fk_TerminalFisica(nroTerminal) REFERENCES TerminalFisica(nroTerminal)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Bulto (
  idBulto int(11) NOT NULL AUTO_INCREMENT,
  idDespachoEquipaje int(11) not null,
  peso DOUBLE NOT NULL,
  PRIMARY KEY (idBulto),
  FOREIGN KEY fk_DespachoEquipaje(idDespachoEquipaje) REFERENCES DespachoEquipaje(idDespachoEquipaje)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS Reserva (
  codigoReserva int(11) NOT NULL AUTO_INCREMENT,
  estado varchar(20) NOT NULL,
  fechaConfirmacion DATE NOT NULL,
  fechaCancelacion DATE NOT NULL,
  clase varchar(20) NOT NULL,
  idPasajero int(11) not null,
  idInstanciaVuelo int(11) not null,
  PRIMARY KEY (codigoReserva),
  FOREIGN KEY fk_Pasajero(idPasajero) REFERENCES Pasajero(idPasajero),
  FOREIGN KEY fk_InstanciaVuelo(idInstanciaVuelo) REFERENCES InstanciaVuelo(idInstanciaVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
