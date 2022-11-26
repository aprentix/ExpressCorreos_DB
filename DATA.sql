use correosexpress;

/*CARTERO*/
insert into Cartero (nombre, apellido, dni) values ('Ferguson', 'Rymill', '72983966K');
insert into Cartero (nombre, apellido, dni) values ('Amalia', 'Rodriguez', '08628813H');
insert into Cartero (nombre, apellido, dni) values ('Samantha', 'Gonzalez', '29293473Y');
insert into Cartero (nombre, apellido, dni) values ('Emilio', 'Valverde', '66502430T');
insert into Cartero (nombre, apellido, dni) values ('Kia', 'Paradoja', '35855091T');
insert into Cartero (nombre, apellido, dni) values ('Roberta', 'Madrigal', '66451628M');
insert into Cartero (nombre, apellido, dni) values ('Franchesca', 'Dominguez', '01154637Z');
insert into Cartero (nombre, apellido, dni) values ('Pedro', 'Picapiedra', '97257866C');
insert into Cartero (nombre, apellido, dni) values ('Maria', 'Sanchez', '57926582R');
insert into Cartero (nombre, apellido, dni) values ('Enrique', 'García', '51045398A');

/*RUTA*/
insert into Ruta(id) values (1), (2), (3), (4), (5), (6);

/*UIDENTIFICADO*/
insert into UIdentificado (dni_uidentificado, nombre, apellidos, correo_electronico) values ('06456679G', 'Rosa', 'Díaz', 'rosa@maqueda.com');
insert into UIdentificado (dni_uidentificado, nombre, apellidos, correo_electronico) values ('69895509G', 'Marta', 'Pérez', 'rosa@maqueda.com');
insert into UIdentificado (dni_uidentificado, nombre, apellidos, correo_electronico) values ('98493233B', 'Paco', 'Rodriguez', 'rosa@maqueda.com');
insert into UIdentificado (dni_uidentificado, nombre, apellidos, correo_electronico) values ('91195150N', 'Roberto', 'Hamburg', 'rosa@maqueda.com');
insert into UIdentificado (dni_uidentificado, dni_autorizado_por_id_uidentificado, nombre, apellidos, correo_electronico) values ('76784988V', '91195150N', 'Miriam', 'Hamburg', 'rosa@maqueda.com');

/*PROVINCIA*/
insert into Provincia (nombre) values('Madrid');
insert into Provincia (nombre) values('Cataluña');
insert into Provincia (nombre) values('Andalucia');

/*MUNICIPIO*/
insert into Municipio (nombre, nombre_provincia) values ('Empirica', 'Andalucia');
insert into Municipio (nombre, nombre_provincia) values ('Oviedad', 'Cataluña');
insert into Municipio (nombre, nombre_provincia) values ('Cipriana', 'Madrid');
insert into Municipio (nombre, nombre_provincia) values ('Americas', 'Andalucia');
insert into Municipio (nombre, nombre_provincia) values ('Gabri', 'Madrid');
insert into Municipio (nombre, nombre_provincia) values ('Ria', 'Cataluña');
insert into Municipio (nombre, nombre_provincia) values ('Alcobendas', 'Madrid');

/*CALLE*/ 
insert into Calle (nombre, id_municipio) values ('Daystar', 1);
insert into Calle (nombre, id_municipio) values ('Pamela', 2);
insert into Calle (nombre, id_municipio) values ('Frivola', 3);
insert into Calle (nombre, id_municipio) values ('Gayesta', 4);
insert into Calle (nombre, id_municipio) values ('Finisterre', 5);
insert into Calle (nombre, id_municipio) values ('Paseo de la Castellana', 1);
insert into Calle (nombre, id_municipio) values ('Paseo de la Victoria', 6);
insert into Calle (nombre, id_municipio) values ('Paseo de la Bonanza', 7);
insert into Calle (nombre, id_municipio) values ('Paseo de la Mañana', 7);

/*CENTRO CLASIFICACION*/
insert into CentroClasificacion (nombre_centro, capacidadProcesamientoPaquetes, capacidadProcesamientoCartas, id_municipio) values 
	('Michal', 1375, 4624, 1),
	('Claudino', 1399, 4244, 2),
	('Amancio', 1883, 4247, 3),
	('Catan', 1663, 4245, 4),
    ('Roemi', 1330, 4245, 5),
    ('Lustrosa', 1303, 4724, 1),
    ('Loretta', 1033, 4248, 2);

/*OFICINA*/
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values (1, 2, 1);
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values (2, 3, 2);
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values (3, 1, 7);
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values (4, 4, 7);
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values (5, 1, 5);
insert into Oficina (codigo, codigo_centro_clasificacion, id_municipio) values (6, 3, 1);


/*AREA ENVIO*/
insert into AreaEnvio (id_area_envio, nombre_area_envio, id_oficina) values 
(1, "AR-MAD-O3", 1), (2,"AR-MAD-O2", 2), (3,"AR-MAD-O1", 3), (4,"AR-MAD-O4", 4), (5,"AR-MAD-50", 5), (8, "AR-MAD-O3-20", 5);

/*COCHE*/
insert into Coche (matricula, capacidad, codigo_oficina) values ('5365 HER', 273.96, 1);
insert into Coche (matricula, capacidad, codigo_oficina) values ('6353 YTR', 273.96, 2);
insert into Coche (matricula, capacidad, codigo_oficina) values ('7643 IRN', 273.96, 3);
insert into Coche (matricula, capacidad, codigo_oficina) values ('7638 JYT', 273.96, 4);
insert into Coche (matricula, capacidad, codigo_oficina) values ('7382 JPT', 273.96, 5);

/*TURNO*/
insert into Turno (horario, jornada) values ('6:43-9:45', 'MAÑANA');
insert into Turno (horario, jornada) values ('15:30-18:30', 'TARDE');
insert into Turno (horario, jornada) values ('9:30-12:30', 'NOCHE');

/*DIRECCION*/
insert into Direccion (id_direccion, numero, letra, portal, id_calle) values
    (1, 5, 'A', 5, 2),
    (2, 45, 'A', 23, 1),
    (3, 32, 'C', 2, 3),
    (4, 45, 'B', 32, 1),
    (5, 22, 'D', 2, 2),
    (6, 33, 'E', 12, 3),
    (7, 46, 'F', 9, 1);

/*UGENERICO*/
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (1, 'Neely', 'Seaborne', 1);
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (2, 'Roselia', 'Perez', 2);
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (3, 'Melisa', 'Rodriguez', 3);
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (4, 'Claudia', 'Llorente', 3);
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (5, 'Sara', 'Sanchez', 4);
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (6, 'Clara', 'Campoamor', 5);
insert into UGenerico (id_ugenerico, nombre, apellidos, id_direccion) values (7, 'Lucas', 'Martín',6);


/*REPARTO*/
insert into Reparto (fecha_creacion, dni_cartero, matricula, id_ruta) values 
    ('2021-04-20', '08628813H', '5365 HER', 1),
    ('2020-05-21', '08628813H', '5365 HER', 2),
    ('2021-12-21', '08628813H', '5365 HER', 3),
    ('2021-08-23', '08628813H', '5365 HER', 4),
    ('2022-11-25', '08628813H', '5365 HER', 5),
	('2022-11-24', '08628813H', '5365 HER', 4),
    ('2022-11-23', '08628813H', '5365 HER', 4),
    ('2022-11-22', '08628813H', '5365 HER', 4),
    ('2022-11-13', '08628813H', '5365 HER', 4);


/*CARTA*/
insert into Carta (id_carta, formato, id_UGenerico_envia, id_UGenerico_recibe, id_Reparto) values
	(1, 'A4', 3, 1, 1),
    (2, 'A2', 1, 2, 1),
    (3, 'A3', 2, 3, 1),
	(4, 'A3', 4, 5, 1),
	(5, 'A4', 1, 3, 3);

/*PAQUETE*/
insert into Paquete (dimension, peso, id_ug_envia, id_ug_recibe, dni_cartero, id_reparto) values 
	(1.5, 0.5, 1, 2, '08628813H', 1), 
    (1.5, 0.5, 1, 3, '08628813H', 1), 
    (1.5, 0.5, 2, 4, '08628813H', 1), 
    (1.5, 0.5, 1, 2, '08628813H', 1), 
    (3.5, 0.5, 2, 3, '08628813H', 2),
    (2.5, 0.5, 3, 4, '08628813H', 6),
    (4.5, 3.5, 5, 4, '08628813H', 7),
    (6.5, 7.5, 5, 2, '08628813H', 8),
    (8.5, 0.5, 3, 2, '08628813H', 9);

/*CARTA CERTIFICADA*/
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (1, 'BAJO', '06456679G', '98493233B', 1);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (2, 'ALTO', '06456679G', '98493233B', 7);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (3, 'ALTO', '06456679G', '98493233B', 6);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (4, 'ALTO', '06456679G', '98493233B', 8);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (5, 'MEDIO', '06456679G', '69895509G', 8);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (6, 'BAJO', '69895509G', '69895509G', 6);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (7, 'MEDIO', '69895509G', '69895509G', 7);
insert into CartaCertificada (id_carta_certificada, nivel_urgencia, dni_ui_recibe, dni_ui_envia, id_reparto) values (8, 'BAJO', '76784988V', '91195150N', 8);

/*RECOGIDA*/
insert into Recogida (fecha_solicitud_recogida, id_direccion, dni_uidentificado, dni_cartero) values
    ('2020-12-04', 1, '06456679G', '29293473Y'),
    ('2020-11-01', 2, '06456679G', '29293473Y'),
    ('2020-02-20', 3, '06456679G', '29293473Y'),
    ('2020-06-26', 4, '06456679G', '29293473Y'),
    ('2020-04-27', 5, '06456679G', '29293473Y');

/*ENTREGA CERTIFICADA*/
insert into EntregaCertificada (dniC, cartacertId, uidentificadoId, fecha, hora) values
    ('29293473Y', 1, '06456679G', '2021-02-03', '19:55'),
    ('29293473Y', 2, '06456679G', '2021-02-04', '14:40'),
    ('29293473Y', 3, '06456679G', '2021-01-05', '12:30'),
    ('29293473Y', 4, '06456679G', '2021-03-02', '13:45'),
    ('29293473Y', 5, '06456679G', '2021-04-04', '15:50');


/*SEGMENTO CALLE*/
insert into SegmentoCalle (n_Inicio, n_Final, id_calle) values 
    (1, 13, 1),
    (2, 15, 2),
    (45, 76, 3),
    (23, 67, 8),
    (23, 56 ,9);


insert into Trabaja (dniC, codOf, jornadaT, fechacomienzo) values
    ('72983966K', 1, 'TARDE', '2020-01-04'),
	('72983966K', 1, 'MAÑANA', '2020-01-04'),
	('72983966K', 1, 'NOCHE', '2020-01-04'),
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
    (1,'06456679G'),(2,'69895509G'),(4,'98493233B'),(5,'91195150N');

/*area_envio_incluye_segmento_calle*/
insert into area_envio_incluye_segmento_calle (id_area_envio, n_Segmento) values
    (1,2),(4,3),(2,4),(4,5),(2,1);


/*ruta_incluye_segmento*/
insert into ruta_incluye_segmento (id_ruta, n_segmento) values
    (1,2),(1,3),(2,5),(3,2),(1,4),(4,2),(4,1);


/*cartero_reparte_en_area_envio*/
insert into cartero_reparte_en_area_envio (dni_cartero, id_area_envio) values
    ('35855091T', 2),
    ('57926582R' , 1),
    ('35855091T' , 4),
    ('57926582R' , 3),
    ('01154637Z' , 2);
