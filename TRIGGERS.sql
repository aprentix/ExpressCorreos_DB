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
elseif NEW.dimension < 25 then
	signal sqlstate '02000'
	SET message_text = 'Paquete demasiado pequeño';
elseif NEW.dimension > 625 then
	signal sqlstate '02000'
	SET message_text = 'Paquete demasiado pequeño';
    
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
