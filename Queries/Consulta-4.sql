/* SELECT * FROM Consulta4 where matriculaAeronave = 'dsadas'*/

CREATE VIEW Consulta4 AS
	 
SELECT 
	iv.idInstanciaVuelo, iv.fechaInstancia, a.matriculaAeronave, riv.estado
FROM 
	Aeronave a
INNER JOIN
	AsociacionAeronave aa
ON	
	a.matriculaAeronave = aa.matriculaAeronave
INNER JOIN
	RegistroInstanciaVuelo riv
ON
	aa.idRegistroInstanciaVuelo = riv.idRegistroInstanciaVuelo
INNER JOIN
	InstanciaVuelo iv
ON
	riv.idInstanciaVuelo = iv.idInstanciaVuelo



