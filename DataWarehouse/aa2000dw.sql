CREATE DATABASE IF NOT EXISTS aa2000dw;
use aa2000dw;

CREATE TABLE IF NOT EXISTS Pasajero (
  idPasajero int(11) NOT NULL,
  dni varchar(20) NOT NULL,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  nacionalidad varchar(20) NOT NULL,
  PRIMARY KEY (idPasajero)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Aeropuerto (
  codigoAeropuerto varchar(3) NOT NULL,
  nombre varchar(50) not null,
  codigoInternacionalIATA varchar(3) not null,
  cantidadPuertas int not null,
  PRIMARY KEY (codigoAeropuerto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Aerolinea (
  codigoAerolinea varchar(2) NOT NULL,
  nombre varchar(50) not null,
  PRIMARY KEY (codigoAerolinea)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS InstanciaVuelo (
  idInstanciaVuelo int(11) NOT NULL,
  fechaInstancia DATE NOT NULL,
  fechaSalida DATE NOT NULL,
  
  idVuelo int(11) not null,
  codigoAerolinea varchar(2) not null,
  codigoAeropuertoOrigen varchar(3) not null,
  codigoAeropuertoDestino varchar(3) not null,
  nombreLayout varchar(20) not null,
  cantidadAsientos int(11) NOT NULL,
  matriculaAeronave varchar(6) not null,
  estado varchar(40) NOT NULL,
  puertaSalidaConfirmada int(11) not null,
  PRIMARY KEY (idInstanciaVuelo),
  FOREIGN KEY fk_Aerolinea(codigoAerolinea) REFERENCES Aerolinea(codigoAerolinea),
  FOREIGN KEY fk_Aeropuerto_Origen(codigoAeropuertoOrigen) REFERENCES Aeropuerto(codigoAeropuerto),
  FOREIGN KEY fk_Aeropuerto_Destino(codigoAeropuertoDestino) REFERENCES Aeropuerto(codigoAeropuerto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
CREATE TABLE IF NOT EXISTS CheckIn (
  idCheckIn int(11) NOT NULL,
  estado VARCHAR(50) NOT NULL,
  idPasajero int(11) NOT NULL,
  idInstanciaVuelo int(11) NOT NULL,
  codigoAsiento int(11),
  fecha	DATE NOT NULL,
  fechaDespacho	DATE NOT NULL,
  cantidadTotalBultos int(11),
  pesoTotalBultos DOUBLE NOT NULL,
  
  PRIMARY KEY (idCheckIn),
  FOREIGN KEY fk_Pasajero(idPasajero) REFERENCES Pasajero(idPasajero),
  FOREIGN KEY fk_InstanciaVuelo(idInstanciaVuelo) REFERENCES InstanciaVuelo(idInstanciaVuelo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;