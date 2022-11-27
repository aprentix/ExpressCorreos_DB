DROP DATABASE IF EXISTS correosexpress;
CREATE DATABASE correosexpress;
use correosexpress;

CREATE TABLE CartaCertificada(
	id_carta_certificada INT NOT NULL AUTO_INCREMENT UNIQUE,
	nivel_urgencia VARCHAR(50) NOT NULL,
    dni_ui_recibe VARCHAR(9) DEFAULT NULL,
    dni_ui_envia VARCHAR(9) DEFAULT NULL,
    id_reparto INT NOT NULL,
    PRIMARY KEY(id_carta_certificada)
);

CREATE TABLE Paquete(
	id_paquete VARCHAR(20) NOT NULL AUTO_INCREMENT UNIQUE,
    dimension VARCHAR(5) NOT NULL,
    peso FLOAT NOT NULL,
    id_ug_envia INT NOT NULL,
    id_ug_recibe INT DEFAULT NULL,
	dni_cartero VARCHAR(9) DEFAULT NULL,
    id_reparto INT DEFAULT NULL,
    id_recogida INT DEFAULT NULL,
    PRIMARY KEY(id_paquete)
);

CREATE TABLE AreaEnvio(
	id_area_envio INT AUTO_INCREMENT,
    nombre_area_envio VARCHAR(50),
    id_oficina INT,
    PRIMARY KEY(id_area_envio)
);

CREATE TABLE Calle(
	id_calle INT NOT NULL auto_increment,
    nombre VARCHAR(50) NOT NULL,
    id_municipio INT,
    PRIMARY KEY(id_calle)
);

CREATE TABLE SegmentoCalle(
	n_Segmento INT AUTO_INCREMENT,
    n_Inicio INT NOT NULL,
    n_Final INT NOT NULL,
    id_calle INT NOT NULL,
    PRIMARY KEY(n_Segmento)
);

CREATE TABLE Municipio(
	id_municipio INT AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
    nombre_provincia VARCHAR(50),
    PRIMARY KEY(id_municipio)
);

CREATE TABLE Provincia(
	nombre VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(nombre)
);

CREATE TABLE CentroClasificacion(
    codigo INT NOT NULL AUTO_INCREMENT UNIQUE,
	nombre_centro VARCHAR(50) NOT NULL UNIQUE,
    capacidadProcesamientoPaquetes INT NOT NULL,
    capacidadProcesamientoCartas INT NOT NULL,
    id_municipio INT,
    PRIMARY KEY(codigo)
);

CREATE TABLE Coche(
	capacidad FLOAT,
    matricula VARCHAR(9) UNIQUE NOT NULL,
    codigo_oficina INT,
    PRIMARY KEY(matricula)
);

CREATE TABLE Ruta(
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE Turno(
	horario VARCHAR(50) NOT NULL,
    jornada VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY(jornada)
);

CREATE TABLE Cartero(
	nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY(dni)
);

CREATE TABLE Reparto(
	id_reparto INT AUTO_INCREMENT UNIQUE NOT NULL,
    fecha_creacion DATE NOT NULL,
	dni_cartero VARCHAR(50),
	matricula VARCHAR(9),
	id_ruta INT,
    PRIMARY KEY(id_reparto)
);

CREATE TABLE Oficina(
	codigo INT AUTO_INCREMENT NOT NULL,
    codigo_centro_clasificacion INT,
    id_municipio INT,
    PRIMARY KEY(codigo)
);

CREATE TABLE Recogida(
	recogidaId int unique not null auto_increment,
	fecha_solicitud_recogida date null,
    id_direccion int not null,
    dni_uidentificado varchar(9),
    dni_cartero varchar(9),
	PRIMARY KEY (recogidaId)
);

CREATE TABLE UGenerico(
	id_ugenerico int unique not null,
	nombre VARCHAR(50) not null,
	apellidos VARCHAR(50) not null,
    id_direccion int not null,
	PRIMARY KEY (id_ugenerico)
);

CREATE TABLE UIdentificado(
	dni_uidentificado varchar(9) unique not null,
	dni_autorizado_por_id_uidentificado varchar(9) default null,
	nombre VARCHAR(50) not null,
	apellidos VARCHAR(50) not null,
    correo_electronico varchar(50) not null,
	primary key(dni_uidentificado)
);

CREATE TABLE Carta(
	id_carta int auto_increment not null,
	formato varchar(10) not null,
    id_UGenerico_envia int,
	id_UGenerico_recibe int,
    id_Reparto int,
	primary key(id_carta)
);

CREATE TABLE Direccion(
	id_direccion int auto_increment not null,
	numero int default null,
    piso varchar(2) default null,
	letra varchar(2) default null,
	portal int default null,
    id_calle int not null,
	primary key(id_direccion)
);

/* TABLAS N:M */

CREATE TABLE UIdentificado_vive_en_direccion(
	id_direccion int not null,
    dni_uidentificado varchar(9)
);

CREATE TABLE area_envio_incluye_segmento_calle(
	id_area_envio INT NOT NULL,
    n_Segmento INT NOT NULL 
);

CREATE TABLE ruta_incluye_segmento(
	id_ruta int not null,
    n_segmento int not null
);

CREATE TABLE cartero_reparte_en_area_envio(
	dni_cartero varchar(9) not null,
	id_area_envio INT NOT NULL
);

CREATE TABLE area_envio_incluye_area_envio(
	id_area_envio INT NOT NULL,
    id_area_envio_incluida INT NOT NULL 
);

/* TABLAS TERNARIAS */

CREATE TABLE Trabaja(
	dniC varchar(9) not null,
	codOf int not null,
	jornadaT VARCHAR(50) not null,
	fechacomienzo date not null
);

CREATE TABLE EntregaCertificada(
	dniC varchar(9) not null,
	cartacertId int not null,
	uidentificadoId varchar(9) not null,
	fecha date not null,
	hora time not null
);
    
