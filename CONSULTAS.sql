use correosexpress;
/*
2. CONSULTAS
*/
/*
a. Obtener las oficinas asociadas a areas  de envio que incluyan calles cuyo nombre 
comience por “Paseo de”. 
Además, sólo se deben obtener oficinas que estén dentro del municipio “Alcobendas”.
*/
SELECT oficina.codigo, oficina.codigo_centro_clasificacion, oficina.id_municipio FROM oficina
INNER JOIN areaenvio ON areaenvio.id_oficina = oficina.codigo
INNER JOIN area_envio_incluye_segmento_calle ON area_envio_incluye_segmento_calle.id_area_envio = areaenvio.id_area_envio
INNER JOIN segmentocalle ON segmentocalle.n_Segmento = area_envio_incluye_segmento_calle.n_Segmento
INNER JOIN calle ON calle.id_calle = segmentocalle.id_calle
WHERE calle.id_municipio = oficina.id_municipio 
AND calle.id_calle IN (
	SELECT id_calle FROM calle
    WHERE nombre LIKE 'Paseo de %'
)
AND
oficina.id_municipio IN (
	SELECT id_municipio FROM municipio
    WHERE municipio.nombre = "Alcobendas"
);
/*
4	4	7
*/
/*
b. Obtener el nombre y apellidos del cartero que ha realizado el reparto del paquete 
con menor peso, así como la matricula del coche con el que hizo dicho reparto, y el peso 
de dicho paquete.
*/
SELECT DISTINCT cartero.nombre, cartero.apellido, reparto.matricula, paquete.peso FROM cartero
INNER JOIN reparto ON cartero.dni = reparto.dni_cartero
INNER JOIN paquete ON reparto.id_reparto = paquete.id_reparto
WHERE paquete.peso <= ALL ( SELECT paquete.peso FROM paquete)
;
/*
c. Obtener el nombre, apellidos y dirección completa de los usuarios que han enviado 
cartas normales y certificadas (devolver el tipo de carta también) dentro del área de envío 
“AR-MAD-O3”.
*/
SELECT ugenerico.nombre, ugenerico.apellidos, direccion.portal, direccion.numero, direccion.piso, direccion.letra, calle.nombre,municipio.nombre,provincia.nombre
FROM ugenerico
	INNER JOIN direccion ON ugenerico.id_direccion = direccion.id_direccion
    INNER JOIN calle ON direccion.id_calle = calle.id_calle
    INNER JOIN municipio ON calle.id_municipio = municipio.id_municipio
    INNER JOIN provincia ON municipio.nombre_provincia = provincia.nombre
    INNER JOIN oficina ON municipio.id_municipio = oficina.id_municipio
    INNER JOIN areaenvio ON oficina.codigo = areaenvio.id_oficina
    WHERE areaenvio.nombre_area_envio = 'AR-MAD-03'
    
    UNION 
    
    SELECT uidentificado.nombre, uidentificado.apellidos, direccion.portal, direccion.numero, direccion.piso, direccion.letra, calle.nombre,municipio.nombre,provincia.nombre
FROM uidentificado
	INNER JOIN uidentificado_vive_en_direccion ON uidentificado.dni_uidentificado = uidentificado_vive_en_direccion.dni_uidentificado
	INNER JOIN direccion ON uidentificado_vive_en_direccion.id_direccion = direccion.id_direccion
    INNER JOIN calle ON direccion.id_calle = calle.id_calle
    INNER JOIN municipio ON calle.id_municipio = municipio.id_municipio
    INNER JOIN provincia ON municipio.nombre_provincia = provincia.nombre
    INNER JOIN oficina ON municipio.id_municipio = oficina.id_municipio
    INNER JOIN areaenvio ON oficina.codigo = areaenvio.id_oficina
    WHERE areaenvio.nombre_area_envio = 'AR-MAD-03';

/*
d. Obtener el numero total de repartos realizados por cada cartero en las diferentes 
oficinas ordenado de mayor a menor.
*/
SELECT DISTINCT COUNT(*)
FROM reparto
ORDERED BY DESC

/*Posible solución, la de arriba solo cuenta los pedidos, desconozco si la de abajo es 100% solución pero parece funcionar
SELECT dni_cartero, count(*)
FROM reparto
group by dni_cartero
order by count(*) DESC*/

/*
e. Obtener el peso total de los paquetes y el nivel mayor de urgencia de las cartas certificadas 
que ha llevado los coches de la oficina “OF-MAD-O1” en los repartos que se les han asignado en los 
últimos 7 días.
*/
/*
Obtener el peso total de los paquetes que ha llevado los coches de la oficina “OF-MAD-O1” 
en los repartos que se les han asignado en los últimos 7 días.
*/
SELECT SUM(paquete.peso) FROM reparto
INNER JOIN paquete ON paquete.id_reparto = reparto.id_reparto
INNER JOIN coche ON coche.matricula = reparto.matricula
INNER JOIN oficina ON oficina.codigo = coche.codigo_oficina
WHERE oficina.codigo = "1"
AND fecha_creacion < CURDATE() AND fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);
/*
11.5
*/
/*
Obtener el nivel mayor de urgencia de las cartas certificadas que ha llevado los coches de la oficina “OF-MAD-O1” 
en los repartos que se les han asignado en los últimos 7 días.
*/
DELIMITER //
CREATE FUNCTION nivelMaximo()
RETURNS VARCHAR(20) 
NO SQL
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE nivelActual VARCHAR(20) DEFAULT '';
	DECLARE nivelMayor VARCHAR(20) DEFAULT '';
    DECLARE cur1 CURSOR FOR (
		SELECT cartacertificada.nivel_urgencia FROM reparto
		INNER JOIN cartacertificada ON cartacertificada.id_reparto = reparto.id_reparto
		INNER JOIN coche ON coche.matricula = reparto.matricula
		INNER JOIN oficina ON oficina.codigo = coche.codigo_oficina
		WHERE oficina.codigo = "1"
		AND fecha_creacion < CURDATE() AND fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO nivelActual;
		IF nivelActual='ALTO' AND nivelMayor<>'ALTO' THEN
			SET nivelMayor = nivelActual;
		ELSEIF nivelActual='MEDIO' OR nivelMayor<>'ALTO' THEN 
			SET nivelMayor = nivelActual;
		ELSEIF nivelActual='BAJO' AND nivelMayor<>'ALTO' AND nivelMayor<>'MEDIO' THEN
			SET nivelMayor = nivelActual;
		END IF;
		IF done THEN 
			LEAVE read_loop;
		END IF;
		END LOOP;
		CLOSE cur1;
    RETURN (nivelMayor);
END //
DELIMITER ;

SELECT nivelMaximo();

/*
ALTO
*/

/*
f. Aumentar en un 10% la capacidad de los todos los coches que únicamente se hayan utilizado para 
realizar repartos de cartas.
*/
UPDATE coche
INNER JOIN reparto ON coche.matricula=reparto.matricula
INNER JOIN carta ON reparto.id_reparto=carta.id_Reparto
SET capacidad = capacidad * 1.10
WHERE EXISTS(SELECT id_Reparto 
				FROM carta	 
					WHERE carta.id_Reparto= reparto.id_reparto);
/*
g. Obtener los carteros que no hayan llevado a cabo recogidas de paquetes en la misma dirección varias veces.
*/
SELECT DISTINCT nombre, apellido
	FROM correosexpress.cartero INNER JOIN correosexpress.recogida
		ON cartero.dni = recogida.dni_cartero
	Where dni_cartero NOT IN (
		SELECT dni_cartero
        	FROM correosexpress.recogida
        	GROUP by  id_direccion, dni_cartero
		HAVING COUNT(*) > 1
);

/*
h. Obtener el código y la información del área de envío asociada a las oficinas en la que trabajan 
carteros con todos los turnos existentes.
*/
SELECT areaenvio.id_area_envio, areaenvio.nombre_area_envio ,areaenvio.id_oficina FROM areaenvio
INNER JOIN oficina ON oficina.codigo = areaenvio.id_oficina
INNER JOIN trabaja ON trabaja.codOf = oficina.codigo
INNER JOIN turno ON turno.jornada = trabaja.jornadaT
GROUP BY oficina.codigo 
HAVING COUNT(distinct turno.jornada) = 3;
/*
1	AR-MAD-O3	1
3	AR-MAD-O1	3
*/
/*
i. Obtener las rutas que incluyen todos los segmentos de la calle “Avenida de América” de “Alcorcón” 
y que se hayan realizado más de 3 repartos en ella.
*/
SELECT * FROM ruta
INNER JOIN ruta_incluye_segmento ON ruta.id = ruta_incluye_segmento.id_ruta
INNER JOIN segmentocalle ON segmentocalle.n_Segmento = ruta_incluye_segmento.n_segmento
INNER JOIN calle ON calle.id_calle = segmentocalle.id_calle
INNER JOIN municipio ON municipio.id_municipio = calle.id_municipio
INNER JOIN reparto ON reparto.id_ruta = ruta.id
WHERE calle.nombre = 'Avenida de América' 
AND municipio.nombre = 'Alcorcón'
GROUP BY ruta.id
HAVING COUNT(distinct segmentocalle.n_Segmento) = (
		SELECT COUNT(*) FROM segmentocalle 
		INNER JOIN calle ON calle.id_calle = segmentocalle.id_calle
		INNER JOIN municipio ON municipio.id_municipio = calle.id_municipio
		WHERE calle.nombre = 'Avenida de América' 
		AND municipio.nombre = 'Alcorcón'
)
AND COUNT(distinct reparto.id_reparto) > 3
