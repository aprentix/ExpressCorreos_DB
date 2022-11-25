use correosexpress;
/*
3. PROCEDIMIENTO Y FUNCION
*/

/*
a. Define un procedimiento que devuelva los DNIs (separados por “#”) 
	tanto del usuario receptor, como del usuario autorizado, 
    para recibir la entrega de una carta certificada que se pasará como parámetro de entrada.
*/

DELIMITER &&
CREATE PROCEDURE dni_receptor_autorizado_inner_join(IN id_carta_cert INT)
BEGIN 
	SELECT dni_uidentificado, dni_autorizado_por_id_uidentificado FROM UIdentificado
    INNER JOIN CartaCertificada ON CartaCertificada.dni_ui_recibe = UIdentificado.dni_uidentificado
    WHERE CartaCertificada.id_carta_certificada = id_carta_cert;
END &&
DELIMITER ;
/*
call dni_receptor_autorizado_inner_join(6); 
*/
/* 
El usuario con dni '91195150N' envia al usuario '76784988V' una carta con el codigo que nos pasan por parámetro, en este caso el 6
y sacamos por pantalla el dni del receptor y de la persona que puede coger la carta en lugar del mismo, en este caso:  '91195150N'
*/

DELIMITER //
CREATE PROCEDURE dni_receptor_autorizado_in(IN id_carta_cert INT)
BEGIN 
	SELECT dni_uidentificado, dni_autorizado_por_id_uidentificado FROM UIdentificado
    WHERE dni_uidentificado IN (
			SELECT dni_ui_recibe FROM CartaCertificada
			WHERE CartaCertificada.id_carta_certificada = id_carta_cert
    );
END //
DELIMITER ;
/*
call dni_receptor_autorizado_in(6)
*/
/*
b. Define una función que devuelva cual es la ruta mas adecuada de las predefinidas
	existentes para realizar una reparto especificado por parámetro. Dicha ruta será 
    aquella que incluya el mayor numero de segmentos de calles de todas las direcciones 
    de los paquetes y cartas (de ambos tipos) contenidos en el reparto. Se debe utilizar 
    como mínimo un cursor para implementar esta función.
*/

DELIMITER %%
CREATE FUNCTION ruta_mejor(reparto INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE id_mejor_ruta INT;
	DECLARE n_segmentos_mejor_ruta INT;
    DECLARE ruta_id, n_segmentos INT;
    DECLARE cur1 CURSOR FOR (
		/*RUTA Y TOTAL DE SEGMENTOS QUE ESTAN EN LA RUTA Y EN LA DIRECCION DE REPARTO*/
		SELECT Ruta.id, calculaSegmentos(Ruta.id, reparto) as segmentosRutaReparto FROM Ruta
    );
	SET n_segmentos_mejor_ruta = 0;
		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO ruta_id, n_segmentos;
		IF n_segmentos>n_segmentos_mejor_ruta THEN
			SET n_segmentos_mejor_ruta = n_segmentos;
			SET id_mejor_ruta = ruta_id;
		END IF;
		IF done THEN 
			LEAVE read_loop;
		END IF;
		END LOOP;
		CLOSE cur1;
    RETURN (id_mejor_ruta);
END %%
DELIMITER ;


DELIMITER //
CREATE FUNCTION calculaSegmentos(RUTA_ID INT, REPARTO_ID INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;
    SET total = (
		SELECT COUNT(*) FROM (
			SELECT distinct segmentocalle.n_Segmento FROM segmentocalle
				WHERE segmentocalle.n_Segmento IN (
					SELECT distinct segmentocalle.n_Segmento FROM reparto
					INNER JOIN carta ON reparto.id_reparto = carta.id_Reparto
					INNER JOIN ugenerico ON carta.id_UGenerico_recibe = ugenerico.id_ugenerico
					INNER JOIN direccion ON ugenerico.id_direccion = direccion.id_direccion
					INNER JOIN calle ON calle.id_calle = direccion.id_calle
					INNER JOIN segmentocalle ON segmentocalle.id_calle = calle.id_calle 
					WHERE direccion.numero BETWEEN segmentocalle.n_Inicio AND segmentocalle.n_Final AND reparto.id_reparto = REPARTO_ID
					AND segmentocalle.n_Segmento IN (
						SELECT distinct segmentocalle.n_Segmento FROM segmentocalle
						INNER JOIN calle ON segmentocalle.id_calle = calle.id_calle
						INNER JOIN direccion ON direccion.id_calle = calle.id_calle
						INNER JOIN ruta_incluye_segmento ON ruta_incluye_segmento.n_segmento = segmentocalle.n_segmento
						WHERE id_ruta = RUTA_ID
					)
					UNION
					SELECT distinct segmentocalle.n_Segmento FROM reparto
					INNER JOIN paquete ON reparto.id_reparto = paquete.id_reparto
					INNER JOIN ugenerico ON paquete.id_ug_recibe = ugenerico.id_ugenerico
					INNER JOIN direccion ON ugenerico.id_direccion = direccion.id_direccion
					INNER JOIN calle ON calle.id_calle = direccion.id_calle
					INNER JOIN segmentocalle ON segmentocalle.id_calle = calle.id_calle 
					WHERE direccion.numero BETWEEN segmentocalle.n_Inicio AND segmentocalle.n_Final AND reparto.id_reparto = REPARTO_ID
					AND segmentocalle.n_Segmento IN (
						SELECT distinct segmentocalle.n_Segmento FROM segmentocalle
						INNER JOIN calle ON segmentocalle.id_calle = calle.id_calle
						INNER JOIN direccion ON direccion.id_calle = calle.id_calle
						INNER JOIN ruta_incluye_segmento ON ruta_incluye_segmento.n_segmento = segmentocalle.n_segmento
						WHERE id_ruta = RUTA_ID
					)
				)
        ) segmentos_en_ruta_y_reparto
    );
    RETURN total;
END //
DELIMITER ;

/*
Vamos recorriendo las rutas con un cursor y calculamos el numero de segmentos que 
visitaria dado el codigo del reparto
*/

SELECT ruta_mejor(1) as mejorRuta;
