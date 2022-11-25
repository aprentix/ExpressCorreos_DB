use correosexpress;
/*
2. CONSULTAS
*/
/*
a. Obtener las oficinas asociadas a areas  de envio que incluyan calles cuyo nombre 
comience por “Paseo de”. 
Además, sólo se deben obtener oficinas que estén dentro del municipio “Alcobendas”.
*/
SELECT oficina.codigo FROM oficina
INNER JOIN areaenvio ON areaenvio.id_oficina = oficina.codigo
INNER JOIN area_envio_incluye_segmento_calle ON area_envio_incluye_segmento_calle.id_area_envio = areaenvio.id_area_envio
INNER JOIN segmentocalle ON segmentocalle.n_Segmento = area_envio_incluye_segmento_calle.n_Segmento
INNER JOIN calle ON calle.id_calle = segmentocalle.id_calle
WHERE calle.id_calle IN (
	SELECT id_calle FROM calle
    WHERE nombre LIKE 'Paseo de %'
)
AND
oficina.id_municipio IN (
	SELECT id_municipio FROM municipio
    WHERE municipio.nombre = "Alcobendas"
)

/*
b. Obtener el nombre y apellidos del cartero que ha realizado el reparto del paquete 
con menor peso, así como la matricula del coche con el que hizo dicho reparto, y el peso 
de dicho paquete.
*/

/*
c. Obtener el nombre, apellidos y dirección completa de los usuarios que han enviado 
cartas normales y certificadas (devolver el tipo de carta también) dentro del área de envío 
“AR-MAD-O3”.
*/

/*
d. Obtener el numero total de repartos realizados por cada cartero en las diferentes 
oficinas ordenado de mayor a menor.
*/

/*
e. Obtener el peso total de los paquetes y el nivel mayor de urgencia de las cartas certificadas 
que ha llevado los coches de la oficina “OF-MAD-O1” en los repartos que se les han asignado en los 
últimos 7 días.
*/

/*
f. Aumentar en un 10% la capacidad de los todos los coches que únicamente se hayan utilizado para 
realizar repartos de cartas.
*/

/*
g. Obtener los carteros que no hayan llevado a cabo recogidas de paquetes en la misma dirección 
varias veces.
*/
SELECT DISTINCT nombre, apellido
	FROM correosexpress.cartero INNER JOIN correosexpress.recogida
		ON cartero.dni = recogida.dni_cartero
	Where dni_cartero NOT IN (
		SELECT dni_cartero
        	FROM correosexpress.recogida
        	GROUP by  id_direccion, dni_cartero
		HAVING COUNT(*) > 1
)

/*
h. Obtener el código y la información del área de envío asociada a las oficinas en la que trabajan 
carteros con todos los turnos existentes.
*/

/*
i. Obtener las rutas que incluyen todos los segmentos de la calle “Avenida de América” de “Alcorcón” 
y que se hayan realizado más de 3 repartos en ella.
*/