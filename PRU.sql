/*RUTA Y TOTAL DE SEGMENTOS QUE ESTAN EN LA RUTA Y EN LA DIRECCION DE REPARTO*/

use correosexpress;

SELECT ruta.id, count(*) FROM ruta
inner join ruta_incluye_segmento on ruta.id = ruta_incluye_segmento.id_ruta
inner join segmentocalle on ruta_incluye_segmento.n_segmento = segmentocalle.n_Segmento
where reparto.id_reparto = 2;
/*¿COMO RELACIONAR SEGMENTO CALLE Y DIRECCION?*/

SELECT segmentocalle.id, ugenerico.nombre FROM segmentocalle
inner join paquete on paquete.id_ug_recibe = ugenerico.id_ugenerico 
inner join direccion on direccion.id_direccion = ugenerico.id_direccion
inner join ugenerico on ugenerico.id_direccion = direccion.id_direccion;


/* Mostrar el id del segmento en el que viven los usuarios que tienen un paquete pendiente por recibir */
SELECT segmentocalle.id, ugenerico.nombre FROM segmentocalle
inner join paquete on paquete.id_ug_recibe = ugenerico.id_ugenerico 
inner join direccion on direccion.id_direccion = ugenerico.id_direccion
inner join ugenerico on ugenerico.id_direccion = direccion.id_direccion;

SELECT * FROM segmentocalle
inner join ruta_incluye_segmento on ruta_incluye_segmento.n_segmento=segmentocalle.n_segmento
where segmentocalle.n_Segmento IN (
	SELECT distinct segmentocalle.n_Segmento FROM ugenerico
	inner join paquete on paquete.id_ug_recibe = ugenerico.id_ugenerico 
	inner join direccion on ugenerico.id_direccion = direccion.id_direccion
	inner join calle on direccion.id_calle = calle.id_calle
	inner join segmentocalle on segmentocalle.id_calle = calle.id_calle
);


/*RUTA Y TOTAL DE SEGMENTOS QUE ESTAN EN LA RUTA Y EN LA DIRECCION DE REPARTO*/

SELECT Ruta.id, total_segmentos_recorridos(id_ruta, id_reparto) FROM Ruta;



/*Funcion que muestra las secciones en las que esta cada una de las direcciones de las cartas de reparto*/
use correosexpress;
/*Obtener las secciones incluidas en cierta ruta*/
SELECT distinct segmentocalle.n_Segmento FROM segmentocalle
INNER JOIN calle ON segmentocalle.id_calle = calle.id_calle
INNER JOIN direccion ON direccion.id_calle = calle.id_calle
INNER JOIN ruta_incluye_segmento ON ruta_incluye_segmento.n_segmento = segmentocalle.n_segmento
WHERE id_ruta = 3;
/*Obtener las secciones de las direcciones que hay que visitar en un reparto para entregar una carta*/
/*Obtener las secciones de las direcciones que hay que visitar en un reparto para entregar un paquete*/
/*PROBLEMA: TEORICAMENTE NOS DARIA TODOS LOS SEGMENTOS QUE COMPONEN LA CALLE DE CIERTA DIRECCION*/
/*Solucion: Cambiar el diseño de la base de datos si hacemos que direccion se relacione directamente con segmento de calle y la calle con segmento de calle*/
/*Solucion2: Comprobar por cada direccion a que segmento pertenece siendo el segmento n_fin>n_casa>n_inicio estando estas en la misma calle*/

SELECT distinct segmentocalle.n_Segmento FROM reparto
INNER JOIN carta ON reparto.id_reparto = carta.id_Reparto
INNER JOIN ugenerico ON carta.id_UGenerico_recibe = ugenerico.id_ugenerico
INNER JOIN direccion ON ugenerico.id_direccion = direccion.id_direccion
INNER JOIN calle ON calle.id_calle = direccion.id_calle
INNER JOIN segmentocalle ON segmentocalle.id_calle = calle.id_calle 
WHERE direccion.numero BETWEEN segmentocalle.n_Inicio AND segmentocalle.n_Final AND reparto.id_reparto = 1
UNION
SELECT distinct segmentocalle.n_Segmento FROM reparto
INNER JOIN paquete ON reparto.id_reparto = paquete.id_reparto
INNER JOIN ugenerico ON paquete.id_ug_recibe = ugenerico.id_ugenerico
INNER JOIN direccion ON ugenerico.id_direccion = direccion.id_direccion
INNER JOIN calle ON calle.id_calle = direccion.id_calle
INNER JOIN segmentocalle ON segmentocalle.id_calle = calle.id_calle 
WHERE direccion.numero BETWEEN segmentocalle.n_Inicio AND segmentocalle.n_Final AND reparto.id_reparto = 1;


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
					WHERE direccion.numero BETWEEN segmentocalle.n_Inicio AND segmentocalle.n_Final AND reparto.id_reparto = 2
					AND segmentocalle.n_Segmento IN (
						SELECT distinct segmentocalle.n_Segmento FROM segmentocalle
						INNER JOIN calle ON segmentocalle.id_calle = calle.id_calle
						INNER JOIN direccion ON direccion.id_calle = calle.id_calle
						INNER JOIN ruta_incluye_segmento ON ruta_incluye_segmento.n_segmento = segmentocalle.n_Segmento
						WHERE id_ruta = RUTA_ID
					)
					UNION
					SELECT distinct segmentocalle.n_Segmento FROM reparto
					INNER JOIN paquete ON reparto.id_reparto = paquete.id_reparto
					INNER JOIN ugenerico ON paquete.id_ug_recibe = ugenerico.id_ugenerico
					INNER JOIN direccion ON ugenerico.id_direccion = direccion.id_direccion
					INNER JOIN calle ON calle.id_calle = direccion.id_calle
					INNER JOIN segmentocalle ON segmentocalle.id_calle = calle.id_calle 
					WHERE direccion.numero BETWEEN segmentocalle.n_Inicio AND segmentocalle.n_Final AND reparto.id_reparto = 2
					AND segmentocalle.n_Segmento IN (
						SELECT distinct segmentocalle.n_Segmento FROM segmentocalle
						INNER JOIN calle ON segmentocalle.id_calle = calle.id_calle
						INNER JOIN direccion ON direccion.id_calle = calle.id_calle
						INNER JOIN ruta_incluye_segmento ON ruta_incluye_segmento.n_segmento = segmentocalle.n_Segmento
						WHERE id_ruta = RUTA_ID
					)
				)
        )
    );
    RETURN total;
END //
DELIMITER ;