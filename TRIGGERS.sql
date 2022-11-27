/*
a) Define un trigger para impedir que se puedan registrar env´ıos de paquetes cuyo
identificador no cumpla que empiece por “PQ” y tenga 10 n´umeros despu´es, que
adem´as sus dimensiones est´en entre 5x5 y 25x25 y que su peso entre 1 y 100. Si
no se cumple alguna de estas restricciones de datos se deber´a devolver un error
con un mensaje que indique claramente el error concreto que se ha producido.
*/

DELIMITER $$
CREATE TRIGGER formatoPaqueteErroneo before INSERT ON Paquete 
FOR EACH ROW 
BEGIN 
/*
ID_paquete correcta
*/
if char_length(NEW.id_paquete) > 12 
OR char_length(NEW.id_paquete) < 12 
or NEW.id_paquete not regexp 'PQ+[0-9]+$' then
	signal sqlstate '02000'
	SET message_text = 'ID incorrecto';
    
/*
dimension del paquete correcta
*/
elseif NEW.dimension not regexp '[0-9]+$+x+[0-9]+$' 
/*
Primera dimension
*/

or substr(NEW.dimension, 1,locate('x', NEW.dimension)-1) + 0 < 5
or substr(NEW.dimension, 1,locate('x', NEW.dimension)-1) + 0 > 25
/*
Segunda dimension
*/
or substr(NEW.dimension, locate('x',NEW.dimension)+1, 3) + 0 < 5
or substr(NEW.dimension, locate('x',NEW.dimension)+1, 3) + 0 > 25 then
	signal sqlstate '02000'
	SET message_text = 'Dimensiones del paquete incorrecta';
   
/*
peso del paquete correcto
*/
elseif NEW.PESO > 100 then
	signal sqlstate '02000'
	SET message_text = 'Paquete demasiado pesado';
elseif NEW.PESO < 1 then
	signal sqlstate '02000'
	SET message_text = 'Paquete demasiado ligero';
end if;
END$$

DELIMITER ;

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
DECLARE done INT DEFAULT FALSE;
DECLARE repartoID, pesoTotal INT;
DECLARE cur1 CURSOR FOR (
		select Reparto.id_reparto, sum(peso) as pesoReparto
		from Reparto join Paquete on Reparto.id_reparto = Paquete.id_reparto
		group by Reparto.id_reparto
);
DECLARE cartero_DNI VARCHAR(20);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
SET cartero_DNI = seleccionarCarteroDisponible();
	OPEN cur1;
    read_loop: LOOP
		FETCH cur1 INTO repartoID, pesoTotal;
        IF pesoTotal>500 THEN
			UPDATE reparto SET dni_cartero = cartero_DNI
            WHERE id_reparto = repartoID;
        END IF;
        IF done THEN
			LEAVE read_loop;
		END IF;
	END LOOP;
    CLOSE cur1;
END //
DELIMITER ;

DELIMITER &&
CREATE FUNCTION seleccionarCarteroDisponible()
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE dni VARCHAR(20) DEFAULT '';
    SET dni = ( SELECT cartero.dni IN (
			SELECT cartero.dni FROM cartero
			INNER JOIN coche ON coche.matricula = reparto.matricula
			INNER JOIN oficina ON oficina.codigo = coche.codigo_oficina
			INNER JOIN reparto ON cartero.dni = reparto.dni_cartero
			INNER JOIN trabaja ON trabaja.dniC = cartero.dni
			INNER JOIN turno ON turno.jornada = trabaja.jornadaT
			WHERE reparto.fecha_creacion = current_date()
			AND current_time() > time(substr(horario, 1, locate('-',horario)-1)) and current_time() < time(substr(horario, locate('-',horario)+1, 2))        
			UNION
			SELECT cartero.dni FROM cartero
			INNER JOIN coche ON coche.matricula = reparto.matricula
			INNER JOIN oficina ON oficina.codigo = coche.codigo_oficina
			INNER JOIN reparto ON cartero.dni = reparto.dni_cartero
			INNER JOIN trabaja ON trabaja.dniC = cartero.dni
			INNER JOIN turno ON turno.jornada = trabaja.jornadaT
			AND current_time() > time(substr(horario, 1, locate('-',horario)-1)) and current_time() < time(substr(horario, locate('-',horario)+1, 2))   
			GROUP BY cartero.dni
			HAVING COUNT(distinct reparto.id_reparto) = 0
    )
    LIMIT 1
    );
	RETURN(dni);
END &&
DELIMITER ;
