use correosexpress;

/*CARTERO*/
insert into Cartero (nombre, apellido, dni) values
 ('Ferguson', 'Rymill', '72983966K'),
('Amalia', 'Rodriguez', '08628813H'),
('Samantha', 'Gonzalez', '29293473Y'),
('Emilio', 'Valverde', '66502430T'),
('Kia', 'Paradoja', '35855091T'),
('Roberta', 'Madrigal', '66451628M'),
('Franchesca', 'Dominguez', '01154637Z'),
('Pedro', 'Picapiedra', '97257866C'),
('Maria', 'Sanchez', '57926582R'),
('Enrique', 'García', '51045398A');

/*RUTA*/
insert into Ruta(id) values (1), (2), (3), (4), (5), (6),(7);

/*UIDENTIFICADO*/
insert into UIdentificado (dni_uidentificado, nombre, apellidos, correo_electronico) values
 ('06456679G', 'Rosa', 'Díaz', 'rosa@maqueda.com'),
('69895509G', 'Marta', 'Pérez', 'rosa@maqueda.com'),
('98493233B', 'Paco', 'Rodriguez', 'rosa@maqueda.com'),
('91195150N', 'Roberto', 'Hamburg', 'rosa@maqueda.com');
insert into UIdentificado (dni_uidentificado, dni_autorizado_por_id_uidentificado, nombre, apellidos, correo_electronico) values 
('76784988V', '91195150N', 'Miriam', 'Hamburg', 'rosa@maqueda.com');

/*PROVINCIA*/
insert into Provincia (nombre) values
('Madrid'),
('Cataluña'),
('Andalucia');

/*MUNICIPIO*/
insert into Municipio (nombre, nombre_provincia) values
 ('Empirica', 'Andalucia'),
 ('Americas', 'Andalucia'),
 ('Alcorcón', 'Madrid'),
 ('Alcobendas', 'Madrid'),
('Gabri', 'Madrid'),
('Ria', 'Cataluña'),
('Oviedad', 'Cataluña');


/*CALLE*/ 
insert into Calle (nombre, id_municipio) values 
('Daystar', 1), /*ID 1*/
('Pamela', 1), /*ID 2*/
('Frivola', 1), /*ID 3*/
('Gayesta', 2), /*ID 4*/
('Finisterre', 2), /*ID 5*/
('Paseo de la Castellana', 2), /*ID 6*/
('Calle José Rizal', 3), /*ID 7*/
('Avenida de América', 3), /*ID 8*/
('Calle de Alcañiz', 3),/*ID 9*/
('Paseo de la Victoria', 4), /*ID 10*/
('Paseo de la Bonanza', 4), /*ID 11*/
('Paseo de la Mañana', 4), /*ID 12*/
('Calle Soledad Cazorla', 5), /*ID 13*/
('Paseo de Marcelino Camacho', 5), /*ID 14*/
('Calle de la Cooperación', 5), /*ID 15*/
('Calle de Diego Torres Villarroel', 6), /*ID 16*/ 
('Plaza de la Charca Verde', 6), /*ID 17*/
('Calle Memorial 11 de marzo de 2004', 6), /*ID 18*/
('Calle de Juana Doña', 7), /*ID 19*/
('Paseo de Juan Antonio Vallejo-Nájera Botas', 7), /*ID 20*/
('Plaza Mayor de Barajas', 7); /*ID 21*/


/*CENTRO CLASIFICACION*/
insert into CentroClasificacion (nombre_centro, capacidadProcesamientoPaquetes, capacidadProcesamientoCartas, id_municipio) values 
	('Michal', 1375, 4624, 1),
	('Claudino', 1399, 4244, 2),
	('Amancio', 1883, 4247, 3),
	('Catan', 1663, 4245, 4),
    ('Roemi', 1330, 4245, 5),
    ('Lustrosa', 1303, 4724, 6),
    ('Loretta', 1033, 4248, 7);

/*OFICINA*/
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7);

/*COCHE*/
insert into Coche (matricula, capacidad, codigo_oficina) values
('5365 HER', 273.96, 1),
('6353 YTR', 273.96, 2),
('7643 IRN', 273.96, 3),
('7638 JYT', 273.96, 4),
('2469 ITR', 273.96, 5),
('1940 RUO', 273.96, 6),
('0610 GLT', 273.96, 7);

/*TURNO*/
insert into Turno (horario, jornada) values
('6:43-9:45', 'MAÑANA'),
('15:30-18:30', 'TARDE'),
('9:30-12:30', 'NOCHE');

/*DIRECCION*/
insert into Direccion (id_direccion, numero, letra, portal, id_calle) values
    (1, 21, 'A', 32, 1),
    (2, 45, 'A', 23, 2),
    (3, 32, 'C', 2, 3),
    (4, 45, 'B', 32, 4),
    (5, 22, 'D', 2, 5),
    (6, 33, 'E', 12, 6),
    (7, 46, 'F', 9, 7),
	(8, 40, 'A', 32, 8),
    (9, 17, 'A', 23, 9),
    (10, 14, 'C', 2, 10),
    (11, 31, 'B', 32, 11),
    (12, 19, 'D', 2, 12),
    (13, 23, 'E', 12, 13),
    (14, 10, 'F', 9, 14),
	(15, 7, 'A', 32, 15),
    (16, 4, 'A', 23, 16),
    (17, 2, 'C', 2, 17),
    (18, 37, 'B', 32, 18),
    (19, 1, 'D', 2, 19),
    (20, 3, 'E', 12, 20),
    (21, 9, 'F', 9, 21);

/*UGENERICO*/
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values
 (1, 'Neely', 'Seaborne', 1),
(2, 'Roselia', 'Perez', 2),
(3, 'Melisa', 'Rodriguez', 3),
(4, 'Sara', 'Sanchez', 5),
(5, 'Clara', 'Campoamor', 6),
(6, 'Alfonso ', 'Romera',7),
(7, 'Baltasar', 'Muñoz',9),
(8, 'Lina', 'Tejero',10),
(9, 'Itziar ', 'Conde',11),
(10, 'Maria-Victoria', 'Capdevila',12),
(11, 'Luis', 'Velazquez',14),
(12, 'Juan-Andres', 'Mariño',15),
(13, 'Azucena', 'de La Rosa',16),
(14, 'Vanesa', 'Guijarro',18),
(15, 'Andres', 'Naranjo',19),
(16, 'Amelia', 'Taboada',20),
(17, 'Cesar', 'Rivera',21);




/*REPARTO*/
insert into Reparto (fecha_creacion, dni_cartero, matricula, id_ruta) values 
    ('2022-11-30', '01154637Z', '5365 HER', 1),
    ('2022-11-29', '01154637Z', '5365 HER', 1),
    ('2021-12-21', '08628813H', '6353 YTR', 2),
    ('2022-11-23', '08628813H', '6353 YTR', 2),
    ('2020-05-21', '29293473Y', '7643 IRN', 3),
    ('2022-11-28', '29293473Y', '7643 IRN', 3),
    ('2022-11-27', '29293473Y', '7643 IRN', 3),
	('2021-08-23', '57926582R', '7638 JYT', 4),
    ('2021-12-21', '66451628M', '2469 ITR', 5),
    ('2021-08-23', '66451628M', '2469 ITR', 5),
    ('2022-11-25', '66451628M', '2469 ITR', 5),
	('2022-11-24', '66502430T', '1940 RUO', 6),
    ('2022-11-23', '72983966K', '1940 RUO', 6),
    ('2022-11-22', '97257866C', '0610 GLT', 7),
    ('2022-11-13', '97257866C', '0610 GLT', 7);


/*CARTA*/
insert into Carta (id_carta, formato, id_UGenerico_envia, id_UGenerico_recibe, id_Reparto) values
	(1, 'A4', 3, 1, 2),
    (2, 'A2', 1, 2, 4),
    (3, 'A3', 2, 3, 2),
	(4, 'A3', 4, 5, 1),
	(5, 'A4', 7, 3, 3);

/*PAQUETE*/
insert into Paquete (dimension, peso, id_ug_envia, id_ug_recibe, dni_cartero, id_reparto) values 
	(1.5, 0.5, 1, 2, '01154637Z', 1), 
    (1.5, 0.5, 1, 3, '01154637Z', 1), 
    (1.5, 0.5, 2, 4, '01154637Z', 1), 
    (1.5, 0.5, 1, 2, '01154637Z', 1), 
    (3.5, 0.5, 2, 3, '08628813H', 2),
    (2.5, 0.5, 3, 4, '29293473Y', 6),
    (4.5, 3.5, 5, 4, '29293473Y', 7),
    (6.5, 7.5, 5, 2, '57926582R', 8),
    (8.5, 0.5, 3, 2, '66451628M', 9);

/*CARTA CERTIFICADA*/
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values 
(1, 'BAJO', '06456679G', '98493233B', 2),
(2, 'ALTO', '06456679G', '98493233B', 3),
(3, 'ALTO', '06456679G', '98493233B', 5),
(4, 'ALTO', '06456679G', '98493233B', 6),
(5, 'MEDIO', '06456679G', '69895509G', 9),
(6, 'BAJO', '69895509G', '69895509G', 11),
(7, 'MEDIO', '69895509G', '69895509G', 13),
(8, 'BAJO', '76784988V', '91195150N', 15);

/*RECOGIDA*/
insert into Recogida (fecha_solicitud_recogida, id_direccion, dni_uidentificado, dni_cartero) values
    ('2020-12-04', 1, '06456679G', '29293473Y'),
    ('2020-11-01', 4, '69895509G', '29293473Y'),
    ('2020-02-20', 8, '98493233B', '29293473Y'),
    ('2020-06-26', 13, '91195150N', '29293473Y'),
    ('2020-04-27', 17, '76784988V', '29293473Y');

/*ENTREGA CERTIFICADA*/
insert into EntregaCertificada (dniC, cartacertId, uidentificadoId, fecha, hora) values
    ('29293473Y', 1, '06456679G', '2021-02-03', '19:55'),
    ('29293473Y', 2, '06456679G', '2021-02-04', '14:40'),
    ('29293473Y', 3, '06456679G', '2021-01-05', '12:30'),
    ('29293473Y', 4, '06456679G', '2021-03-02', '13:45'),
    ('29293473Y', 5, '06456679G', '2021-04-04', '15:50');


/*SEGMENTO CALLE*/
insert into SegmentoCalle (n_Inicio, n_Final, id_calle) values 
    (1, 13, 1), /*ID 1*/
    (2, 15, 2), /*ID 2*/
    (45, 76, 3),/*ID 3*/
    (23, 67, 4),/*ID 4*/
    (23, 56 ,5),/*ID 5*/
    (14, 17, 6),/*ID 6*/
    (2, 15, 7),/*ID 7*/
    (45, 76, 8), /*SEGMENTO CALLE AVENIDA DE AMERICA ID 8*/
	(23, 45, 8), /*SEGMENTO CALLE AVENIDA DE AMERICA ID 9*/
	(1,13,8), /*SEGMENTO CALLE AVENIDA DE AMERICA ID 10*/
    (23, 67, 9), /*SEGMENTO CALLE AVENIDA DE ALCORCON ID 11*/
	(1, 13, 9), /*SEGMENTO CALLE AVENIDA DE ALCORCON ID 12*/
    (14, 23, 9), /*SEGMENTO CALLE AVENIDA DE ALCORCON ID 13*/
    (23, 56 ,10), /*ID 14*/
    (1, 13, 11), /*ID 15*/
    (2, 15, 12), /*ID 16*/
    (45, 76, 13), /*ID 17*/
    (23, 67, 14), /*ID 18*/
    (23, 56 ,15), /*ID 19*/
    (1, 13, 16), /*ID 20*/
    (2, 15, 17), /*ID 21*/
    (45, 76, 18), /*ID 22*/
    (23, 67, 19), /*ID 23*/
    (23, 56 ,20), /*ID 24*/
    (45, 76, 21); /*ID 25*/


insert into Trabaja (dniC, codOf, jornadaT, fechacomienzo) values
    ('72983966K', 1, 'MAÑANA', '2020-01-04'),
    ('08628813H', 2, 'MAÑANA', '2009-12-07'),
    ('29293473Y', 3, 'MAÑANA', '2000-12-03'),
    ('66502430T', 4, 'MAÑANA', '2019-02-13'),
    ('35855091T', 1, 'TARDE', '2008-01-06'),
    ('66451628M', 2, 'TARDE', '2005-03-05'),
    ('01154637Z', 3, 'NOCHE', '2006-04-04'),
    ('97257866C', 4, 'NOCHE', '2009-05-03'),
    ('57926582R', 3, 'TARDE', '2018-06-02'),
    ('51045398A', 1, 'NOCHE', '2017-07-01');


/*UIdentificado_vive_en_direccion*/
insert into UIdentificado_vive_en_direccion (id_direccion, dni_uidentificado) values
    (1,'06456679G'),(4,'69895509G'),(8,'98493233B'),(13,'91195150N'),(17,'76784988V');

/*AREA ENVIO*/
insert into AreaEnvio (id_area_envio, nombre_area_envio, id_oficina) values 
(1, "AR-AND-01", 1),
 (2,"AR-AND-02", 1),
 (3,"AR-AND-03", 1),
 (4,"AR-AND-04", 2),
 (5,"AR-AND-05", 2),
 (6, "AR-AND-06", 2),
 (7, "AR-MAD-01", 3),
 (8, "AR-MAD-02", 3),
 (9,"AR-MAD-03", 3), /*AR MAD 03*/
 (10,"AR-MAD-04", 4),
 (11,"AR-MAD-05", 4),
 (12,"AR-MAD-06", 4),
 (13, "AR-MAD-07", 5),
 (14, "AR-MAD-08", 5),
 (15, "AR-MAD-09", 5),
 (16,"AR-CAT-01", 6),
 (17,"AR-CAT-02", 6),
 (18,"AR-CAT-03", 6),
 (19,"AR-CAT-04", 7),
 (20, "AR-CAT-05", 7),
 (21, "AR-CAT-06", 7);

/*area_envio_incluye_segmento_calle*/
insert into area_envio_incluye_segmento_calle (id_area_envio, n_Segmento) values
    (1,2),(2,3),(3,3),(4,4),(5,6),(6,7),(10,13),(11,14),(12,15),(9,8),(9,9),(9,10);


/*ruta_incluye_segmento*/
insert into ruta_incluye_segmento (id_ruta, n_segmento) values
    (1,2),(1,3),(2,4),(2,6),(3,8),(3,9),(3,10),(4,14),(5,11),(5,12),(5,13),(6,20),(6,22),(7,23),(7,25);


/*cartero_reparte_en_area_envio*/
insert into cartero_reparte_en_area_envio (dni_cartero, id_area_envio) values
    ('35855091T', 2),
    ('57926582R' , 1),
    ('35855091T' , 4),
    ('57926582R' , 3),
    ('01154637Z' , 2);

