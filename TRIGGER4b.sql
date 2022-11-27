
/*
Define un trigger que compruebe que si se han incluido paquetes en un reparto con un peso mayor de 500Kg en total se le asigne un cartero. 
Como el reparto al crearse tiene que tener asignado un coche, 
el cartero que se le debera asignar tiene que ser uno que este trabajando en la misma oficina que el coche que tiene asignado previamente el reparto, 
en un turno que este dentro del horario actual, y que no tenga asignado otro reparto en ese momento. 
Se puede utilizar la función CURRENT TIMESTAMP1 para obtener la fecha.
*/
DROP TRIGGER IF EXISTS comprobarReparto;
DELIMITER //
CREATE TRIGGER comprobarReparto after INSERT ON Reparto
FOR EACH ROW
BEGIN
declare dnicartero varchar(9) default null;

		select Reparto.id_reparto, sum(peso) as pesoReparto
		from Reparto join Paquete on Reparto.id_reparto = Paquete.id_reparto
		group by Reparto.id_reparto;
		if pesoReparto >= 500 then
        
			select distinct Trabaja.dniC into dnicartero
			from Trabaja
				join Oficina on Trabaja.codOf = Oficina.codigo
				join Coche on Trabaja.codOf = Coche.codigo_oficina
				join Reparto on Reparto.matricula = Coche.matricula
				join Turno on Trabaja.jornadaT = Turno.jornada
				join Cartero on Trabaja.dniC = Cartero.dni
				where Coche.codigo_oficina = Oficina.codigo
				and current_time() between hora_comienzo and hora_fin
				and  Cartero.numReparatos =  0
                

        end if;
END //
DELIMITER ;
